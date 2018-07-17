package ramir.mei.fragment.logged

import android.app.ActivityOptions
import android.app.Fragment
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Bundle
import android.preference.PreferenceManager
import android.support.design.widget.Snackbar
import android.support.v4.app.ActivityCompat
import android.support.v4.content.ContextCompat
import android.util.Log
import android.view.*
import android.widget.SeekBar
import android.widget.Toast
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.getkeepsafe.taptargetview.TapTarget
import com.getkeepsafe.taptargetview.TapTargetView
import com.google.android.gms.common.api.GoogleApiClient
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
import ramir.mei.activity.MapsActivity


/**
 * Creado por Ramiro el 22/11/2017 a las 07:38 PM para MEINew.
 */

class RecomendationLoggedFragment : Fragment() {
    private var lat = 0.0
    private var lng = 0.0
    private var mGoogleApiClient : GoogleApiClient? = null
    private var mFirst = true
    var root : View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)

        mGoogleApiClient = GoogleApiClient.Builder(activity)
                .addConnectionCallbacks(object : GoogleApiClient.ConnectionCallbacks {
                    override fun onConnected(bundle: Bundle?) {}
                    override fun onConnectionSuspended(i: Int) {}
                })
                .addApi(LocationServices.API)
                .build()

        mGoogleApiClient!!.connect()
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_rec_fragment, container, false)
        root = rootView
        val url = Utils().getMeiURL()
        val queue = Volley.newRequestQueue(activity)

        val db = FavoriteDB(activity)
        db.createDatabase()

        rootView.recomSwipe.setOnRefreshListener {
            rootView.moreLy.visibility = View.GONE
            rootView.recomLayout.removeAllViews()
            queue.add(getRecomendationRange(100000, url, rootView, db))
            Utils().collapse(rootView.rangeSeekBar)
            activity.title = "Recomendaciones"
            mFirst = true
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
                queue.add(getRecomendationRange(seekBarValue, url, rootView, db))
                mFirst = true
            }
        })

        rootView.moreLoad.visibility = View.GONE

        rootView.button2.setOnClickListener {
            //mMEIPage!!.loadUrl("javascript: $('.more-btn').click()")
            rootView.moreLoad.visibility = View.VISIBLE
        }

        rootView.recomSwipe.isRefreshing = true
        rootView.moreLy.visibility = View.GONE
        queue.add(getRecomendationRange(100000, url, rootView, db))
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
        val db = FavoriteDB(activity)

        when (item.itemId) {
            R.id.range_loc -> {
                if (ContextCompat.checkSelfPermission(activity,
                        android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
                    if (rangeSeekBar.visibility == View.VISIBLE) {
                        Utils().collapse(rangeSeekBar)
                        mFirst = true
                        if(root != null)
                            queue.add(getRecomendationRange(100000, url, root!!, db))
                        activity.runOnUiThread { activity.title = "Recomendaciones" }
                    } else {
                        Utils().expand(rangeSeekBar)

                        rangeSeekBar.max = 0
                        rangeSeekBar.max = 390
                        rangeSeekBar.progress = 0

                        mFirst = true

                        getDeviceLocation()

                        activity.runOnUiThread { activity.title = "10 Km." }
                        if(root != null)
                            queue.add(getRecomendationRange(10, url, root!!, db))
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

            val mLastKnownLocation = LocationServices.FusedLocationApi
                    .getLastLocation(mGoogleApiClient)

            if (mLastKnownLocation != null) {
                lat = mLastKnownLocation.latitude
                lng = mLastKnownLocation.longitude
            } else {
                Toast.makeText(activity, "No se pudo obtener la ubicación.", Toast.LENGTH_SHORT).show()
            }

        } else {
            ActivityCompat.requestPermissions(activity,
                    arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION),
                    99)
        }
    }

    private fun getRecomendationRange(range: Int, url : String, rootView: View, db: FavoriteDB) : StringRequest {
        rootView.recomSwipe.isRefreshing = true

        return object : StringRequest(Method.POST, url, Response.Listener {
            try {
                val response = JSONArray(it)
                rootView.recomSwipe.isRefreshing = false

                for(i in 0 until response.length()){
                    val data = JSONArray(response[i].toString())
                    recPage(data[1].toString(),data[2].toString(),data[0].toString(),
                            data[3].toString(), i == response.length()-1, 0,
                            data[4].toString().toDouble(),data[5].toString().toDouble(),
                            "$"+data[6].toString()+" - $"+data[7].toString(), rootView, db)
                }
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
                        "range" to range.toString(),
                        "limit" to "10")
            }
        }
    }

    fun recPage(Nombre: String, Uni: String, urlFoto: String, Inst: String, mLast: Boolean, Id : Int, lat: Double, lng: Double, sueldo : String, rootView: View, db : FavoriteDB) {
        if(mFirst){
            rootView.recomLayout.removeAllViews()
            rootView.recomSwipe.isRefreshing = false
            mFirst = false
            rootView.moreLy.visibility = View.VISIBLE

            if(mLast){
                activity.layoutInflater.inflate(R.layout.empty_sample, rootView.recomLayout, false)
            }else{
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

        }

        rootView.moreLoad.visibility = View.GONE

        val recCard = activity.layoutInflater.inflate(R.layout.recom_card_sample,rootView.recomLayout , false)

        Picasso.get().load(urlFoto).transform(object : Transformation {

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
        }).into(recCard.img_main_card_1)

        recCard.tv_card_main_1_title.text = Nombre
        recCard.tv_card_main1_sueldo.text = sueldo
        recCard.tv_card_main1_subtitle2.text = Uni
        recCard.tv_card_main1_subtitle.text = Inst

        recCard.btn_card_main1_action1.setOnClickListener {
            val intent = Intent(activity, CareerActivity::class.java)
            intent.putExtra("img", urlFoto)
            intent.putExtra("name", Nombre)
            intent.putExtra("uni", Uni)
            intent.putExtra("inst", Inst)
            intent.putExtra("sueldo", sueldo)
            intent.putExtra("id", Id)
            intent.putExtra("lat", lat)
            intent.putExtra("lng", lng)
            val p1 = android.util.Pair(recCard.img_main_card_1 as View , "recoImage")
            val p2 = android.util.Pair(recCard.tv_card_main_1_title as View, "recoTitle")
            activity.startActivity(intent, ActivityOptions.makeSceneTransitionAnimation(activity, p1, p2).toBundle())
        }

        recCard.btn_card_main1_action2.setOnClickListener{
            val intent = Intent(activity, MapsActivity::class.java)
            intent.putExtra("lat", lat)
            intent.putExtra("lon", lng)
            startActivity(intent)
        }

        var c = db.getFavoriteById(Id)

        if (c.count > 0){
            Picasso.get().load(R.drawable.ic_favorite_action).into(recCard.img_main_card1_favorite)
        }

        recCard.img_main_card1_favorite.setOnClickListener {
            c = db.getFavoriteById(Id)
            if (c.count > 0){
                if(db.deleteFavoriteById(Id)){
                    Toast.makeText(activity, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                    Picasso.get().load(R.drawable.ic_favorite_border).into(recCard.img_main_card1_favorite)
                }
            }else{
                val data = FavoriteData()
                data.id = Id
                data.urlFoto = urlFoto
                data.inst = Inst
                data.nombre = Nombre
                data.sueldo = sueldo
                data.uni = Uni
                data.lat = lat
                data.lng = lng
                if(db.addFavorites(data)) {
                    Toast.makeText(activity, "Se ha agregado a favoritos.", Toast.LENGTH_SHORT).show()
                    Picasso.get().load(R.drawable.ic_favorite_action).into(recCard.img_main_card1_favorite)
                }
            }
        }

        if(!mLast) {
            recomLayout.addView(recCard)
        }else{
            rootView.moreLy.visibility = View.GONE
        }
    }
}