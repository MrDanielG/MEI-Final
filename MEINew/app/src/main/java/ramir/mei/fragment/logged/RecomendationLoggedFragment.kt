package ramir.mei.fragment.logged

import android.app.ActivityOptions
import android.app.Fragment
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Bundle
import android.os.Handler
import android.preference.PreferenceManager
import android.support.design.widget.Snackbar
import android.support.v4.app.ActivityCompat
import android.support.v4.content.ContextCompat
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.*
import android.widget.*
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.getkeepsafe.taptargetview.TapTarget
import com.getkeepsafe.taptargetview.TapTargetView
import com.google.android.gms.location.LocationServices
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.app_bar_logged_fragment.*
import kotlinx.android.synthetic.main.logged_rec_fragment.*
import kotlinx.android.synthetic.main.logged_rec_fragment.view.*
import kotlinx.android.synthetic.main.recom_card_sample.view.*
import org.json.JSONArray
import ramir.mei.R
import ramir.mei.SQL.FavoriteDB
import ramir.mei.SQL.FavoriteData
import ramir.mei.Utils
import ramir.mei.activity.CareerActivity
import ramir.mei.activity.LoggedActivity
import ramir.mei.activity.MapsActivity


/**
 * Creado por Ramiro el 22/11/2017 a las 07:38 PM para MEINew.
 */

class RecomendationLoggedFragment : Fragment() {
    private var lat = 0.0
    private var lng = 0.0
    var root : View? = null
    data class RecomendationData(val Nombre: String,val Uni: String,val urlFoto: String,val Inst: String,val Id : String,val lat: Double,val lng: Double,val sueldo : String)
    val recomendationList = ArrayList<RecomendationData?>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_rec_fragment, container, false)
        root = rootView
        val url = Utils().getMeiURL()
        val queue = Volley.newRequestQueue(activity)
        val db = FavoriteDB(activity)
        rootView.recomLayout.layoutManager = LinearLayoutManager(activity)

        db.createDatabase()

        rootView.recomSwipe.setOnRefreshListener {
            queue.add(getRecomendationRange(100000, url))
            Utils().collapse(rootView.rangeSeekBar)
            activity.title = "Recomendaciones"
        }

        rootView.rangeSeekBar.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            var seekBarValue = 0
            override fun onProgressChanged(seekBar: SeekBar, i: Int, b: Boolean) {
                seekBarValue = i
                activity.runOnUiThread {activity.title = (i + 10).toString() + " Km." }
            }

            override fun onStartTrackingTouch(seekBar: SeekBar) {}

            override fun onStopTrackingTouch(seekBar: SeekBar) {
                getDeviceLocation()
                queue.add(getRecomendationRange(seekBarValue, url))
            }
        })

        rootView.recomSwipe.isRefreshing = true
        queue.add(getRecomendationRange(100000, url))
        return rootView
    }

    override fun onCreateOptionsMenu(menu: Menu?, menuInflater: MenuInflater?) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater!!.inflate(R.menu.logged, menu)
        menu!!.getItem(0).isVisible = true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val queue = Volley.newRequestQueue(activity)
        val url = Utils().getMeiURL()

        when (item.itemId) {
            R.id.range_loc -> {
                if (ContextCompat.checkSelfPermission(activity,
                        android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
                    if (rangeSeekBar.visibility == View.VISIBLE) {
                        Utils().collapse(rangeSeekBar)
                        if(root != null)
                            queue.add(getRecomendationRange(100000, url))
                        activity.runOnUiThread { activity.title = "Recomendaciones" }
                    } else {
                        Utils().expand(rangeSeekBar)

                        rangeSeekBar.max = 0
                        rangeSeekBar.max = 390
                        rangeSeekBar.progress = 0

                        getDeviceLocation()

                        activity.runOnUiThread { activity.title = "10 Km." }
                        if(root != null)
                            queue.add(getRecomendationRange(10, url))
                    }
                } else {
                    Snackbar.make(recomSwipe, "Se necesita tener acceso a la ubicación.",
                            Snackbar.LENGTH_LONG).setAction("Dar permiso") { getDeviceLocation() }.show()
                }
                return true
            }
            else -> return super.onOptionsItemSelected(item)
        }
    }

    private fun getDeviceLocation() {
        if (ContextCompat.checkSelfPermission(activity,
                android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {

            val mLastKnownLocation = LocationServices.getFusedLocationProviderClient(activity).lastLocation
            mLastKnownLocation.addOnCompleteListener {
                if (mLastKnownLocation != null) {
                    lat = mLastKnownLocation.result.latitude
                    lng = mLastKnownLocation.result.longitude
                } else {
                    Toast.makeText(activity, "No se pudo obtener la ubicación.", Toast.LENGTH_SHORT).show()
                }
            }
        } else {
            ActivityCompat.requestPermissions(activity,
                    arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION),
                    99)
        }
    }

    private fun getRecomendationRange(range: Int, url : String) : StringRequest {
        root?.recomSwipe?.isRefreshing = true
        val db = FavoriteDB(activity)

        return object : StringRequest(Method.POST, url, Response.Listener {
            try {
                val response = JSONArray(it)
                root?.recomSwipe?.isRefreshing = false
                recomendationList.clear()

                for(i in 0 until response.length()){
                    val data = JSONArray(response[i].toString())
                    recomendationList.add(RecomendationData(data[1].toString(),data[2].toString(),data[0].toString(),
                            data[3].toString(), Utils().generateRecomId(data[4].toString().toDouble(),data[5].toString().toDouble(),data[1].toString(),data[2].toString(),data[0].toString()).toString(),
                            data[4].toString().toDouble(),data[5].toString().toDouble(),
                            "$"+data[6].toString()+" - $"+data[7].toString()))
                }
                root?.recomLayout?.recycledViewPool?.clear()
                root?.recomLayout?.adapter = RecomendationAdapter(recomendationList, db, activity as LoggedActivity, root!!)
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "", "key" to Utils().getKey(activity),
                        "req" to "recom",
                        "lat" to lat.toString(),
                        "lng" to lng.toString(),
                        "range" to range.toString())
            }
        }
    }

    class RecomendationAdapter constructor(private val recomendationList: ArrayList<RecomendationData?>,
                                           private val db : FavoriteDB,
                                           val activity: LoggedActivity,
                                           val rootView : View) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {

        val LIMIT = 5
        var currentLimit = 0
        var innerList = arrayListOf<RecomendationData?>()
        var inicio = true

        init {
            loadData()
        }

        fun loadData(){
            if(recomendationList.size > 0){
                currentLimit += LIMIT
                val limit = if(currentLimit > recomendationList.size){
                    recomendationList.size
                }else{
                    currentLimit
                }
                innerList = ArrayList(recomendationList.subList(0, limit))
                if(currentLimit < recomendationList.size){
                    innerList.add(null)
                }
            }else{
                innerList.clear()
            }
        }

        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
            return if(viewType == 1){
                CardViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.recom_card_sample, parent,false))
            }else{
                FooterViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.sample_recycler_footer, parent,false))
            }
        }

        override fun getItemViewType(position: Int): Int {
            return if(innerList[position] == null){
                0
            }else{
                1
            }
        }

        override fun getItemCount(): Int {
            return innerList.size
        }

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
            if (holder is CardViewHolder) {
                val data = innerList[position]!!
                if(position == 0){
                    if(inicio){
                        rootView.recomLayout.scheduleLayoutAnimation()
                        inicio = false
                    }
                    val layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
                    layoutParams.setMargins(Utils().dpToPixel(activity.resources, 8),Utils().dpToPixel(activity.resources, 7),Utils().dpToPixel(activity.resources, 8),Utils().dpToPixel(activity.resources, 7))
                    holder.viewHolder.layoutParams = layoutParams
                    val preferences = PreferenceManager.getDefaultSharedPreferences(activity)
                    if (!preferences.getBoolean("RecoDiscovery", false)) {
                        val editor = preferences.edit()
                        editor.putBoolean("RecoDiscovery", true)
                        editor.apply()
                        TapTargetView.showFor(activity, TapTarget.forView(activity.recomIV , "Rango", "Puedes filtrar las carreras por la distancia entre tú y las universidades presionando el botón."), object : TapTargetView.Listener(){
                            override fun onTargetDismissed(view: TapTargetView?, userInitiated: Boolean) {
                                super.onTargetDismissed(view, userInitiated)
                                TapTargetView.showFor(activity, TapTarget.forView(activity.recomLayout.getChildAt(0).findViewById(R.id.img_main_card1_favorite) , "Favoritos", "Puedes guardar carreras para verlas mas tarde en el apartado de tus favoritos."))
                            }
                        })
                    }
                }

                Picasso.get().load(data.urlFoto).transform(object : Transformation {

                    override fun transform(source: Bitmap): Bitmap {
                        val targetHeight = 800
                        val aspectRatio = source.width.toDouble() / source.height.toDouble()
                        val targetWidth = (targetHeight * aspectRatio).toInt()
                        val result = Bitmap.createScaledBitmap(source, targetWidth, targetHeight, false)
                        if (result != source) {
                            source.recycle()
                        }
                        return result
                    }

                    override fun key(): String = "cropPosterTransformation720"
                }).into(holder.cardImage)

                holder.tituloText.text = data.Nombre
                holder.sueldoText.text = data.sueldo
                holder.uniText.text = data.Uni
                holder.institText.text = data.Inst
                Picasso.get().load(R.drawable.ic_favorite_border).into(holder.favoriteBtn)

                holder.infoBtn.setOnClickListener {
                    val intent = Intent(activity, CareerActivity::class.java)
                    intent.putExtra("img", data.urlFoto)
                    intent.putExtra("name", data.Nombre)
                    intent.putExtra("uni", data.Uni)
                    intent.putExtra("inst", data.Inst)
                    intent.putExtra("sueldo", data.sueldo)
                    intent.putExtra("id", data.Id)
                    intent.putExtra("lat", data.lat)
                    intent.putExtra("lng", data.lng)
                    val p1 = android.util.Pair(holder.cardImage as View , "recoImage")
                    val p2 = android.util.Pair(holder.infoBtn as View, "recoTitle")
                    activity.startActivity(intent, ActivityOptions.makeSceneTransitionAnimation(activity, p1, p2).toBundle())
                }

                holder.locationBtn.setOnClickListener{
                    val intent = Intent(activity, MapsActivity::class.java)
                    intent.putExtra("lat", data.lat)
                    intent.putExtra("lon", data.lng)
                    activity.startActivity(intent)
                }

                if (db.containsFavoriteById(data.Id)){
                    Picasso.get().load(R.drawable.ic_favorite_action).into(holder.favoriteBtn)
                }

                holder.favoriteBtn.setOnClickListener {
                    if (db.containsFavoriteById(data.Id)){
                        if(db.deleteFavoriteById(data.Id)){
                            Toast.makeText(activity, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                            Picasso.get().load(R.drawable.ic_favorite_border).into(holder.favoriteBtn)
                        }
                    }else{
                        val data2 = FavoriteData()
                        data2.id = data.Id
                        data2.urlFoto = data.urlFoto
                        data2.inst = data.Inst
                        data2.nombre = data.Nombre
                        data2.sueldo = data.sueldo
                        data2.uni = data.Uni
                        data2.lat = data.lat
                        data2.lng = data.lng
                        if(db.addFavorites(data2)) {
                            Toast.makeText(activity, "Se ha agregado a favoritos.", Toast.LENGTH_SHORT).show()
                            Picasso.get().load(R.drawable.ic_favorite_action).into(holder.favoriteBtn)
                        }
                    }
                }
            }else if(holder is FooterViewHolder){
                Handler().postDelayed({
                    loadData()
                    notifyDataSetChanged()
                },2000)

            }
        }

         inner class CardViewHolder constructor(v: View): RecyclerView.ViewHolder(v) {
            var viewHolder = View(activity)
            var favoriteBtn = ImageView(activity)
            var locationBtn = Button(activity)
            var infoBtn = Button(activity)
            var cardImage = ImageView(activity)
            var sueldoText = TextView(activity)
            var tituloText = TextView(activity)
            var uniText = TextView(activity)
            var institText = TextView(activity)

            init {
                viewHolder = v
                infoBtn = v.btn_card_main1_action1
                locationBtn = v.btn_card_main1_action2
                favoriteBtn = v.img_main_card1_favorite
                cardImage = v.img_main_card_1
                sueldoText = v.tv_card_main1_sueldo
                tituloText = v.tv_card_main_1_title
                uniText = v.tv_card_main1_subtitle2
                institText = v.tv_card_main1_subtitle
            }
        }

        inner class FooterViewHolder constructor(v: View): RecyclerView.ViewHolder(v) {
            init {

            }
        }
    }
}