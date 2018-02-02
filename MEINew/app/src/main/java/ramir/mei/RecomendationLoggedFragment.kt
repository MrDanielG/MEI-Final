package ramir.mei

import android.app.ActivityOptions
import android.app.Fragment
import android.content.Context
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
import android.view.animation.Animation
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.SeekBar
import android.widget.Toast
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


/**
 * Creado por Ramiro el 22/11/2017 a las 07:38 PM para MEINew.
 */

class RecomendationLoggedFragment : Fragment() {
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/recomendaciones.php"
    private val mJSIName : String = GlobalVar().getJSIName()
    private var lat = 0.0
    private var lng = 0.0
    private var mGoogleApiClient : GoogleApiClient? = null
    private var mMEIPage : WebView? = null
    private var mFirst = true
    private var rootView : View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setHasOptionsMenu(true)
        mGoogleApiClient = GoogleApiClient.Builder(activity)
                .addConnectionCallbacks(object : GoogleApiClient.ConnectionCallbacks {
                    override fun onConnected(bundle: Bundle?) {

                    }

                    override fun onConnectionSuspended(i: Int) {

                    }
                })
                .addApi(LocationServices.API)
                .build()

        mGoogleApiClient!!.connect()
    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        rootView = inflater!!.inflate(R.layout.logged_rec_fragment, container, false)

        Log.e("Activity", "Recomendaciones en: "+mURL)

        val context = activity.baseContext
        mMEIPage = WebView(context)

        rootView!!.recomSwipe.isRefreshing = true

        val db = FavoriteDB(activity.baseContext)
        db.createDatabase()

        mMEIPage!!.webViewClient = object : WebViewClient() {
            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)
                rootView!!.moreLy.visibility = View.GONE
            }
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                rootView!!.recomSwipe.isRefreshing = false
            }
        }

        mMEIPage!!.settings.javaScriptEnabled = true
        mMEIPage!!.settings.domStorageEnabled = true

        rootView!!.recomSwipe.setOnRefreshListener {
            rootView!!.recomLayout.removeAllViews()
            mMEIPage!!.reload()
            collapse(rootView!!.rangeSeekBar)
            activity.runOnUiThread{
                activity.title = "Recomendaciones"
            }
        }

        mMEIPage!!.addJavascriptInterface(JSI(activity.baseContext, rootView!!), mJSIName)

        mMEIPage!!.loadUrl(mURL)

        rootView!!.rangeSeekBar.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            var seekBarValue = 0
            override fun onProgressChanged(seekBar: SeekBar, i: Int, b: Boolean) {
                seekBarValue = i

                activity.runOnUiThread({activity.title = (i + 10).toString() + " Km." })
            }

            override fun onStartTrackingTouch(seekBar: SeekBar) {}

            override fun onStopTrackingTouch(seekBar: SeekBar) {
                getDeviceLocation()
                getRecomendationRange(seekBarValue)
                mFirst = true
            }
        })

        rootView!!.moreLoad.visibility = View.GONE

        rootView!!.button2.setOnClickListener {
            mMEIPage!!.loadUrl("javascript: $('.more-btn').click()")
            rootView!!.moreLoad.visibility = View.VISIBLE
        }

        return rootView
    }

    override fun onCreateOptionsMenu(menu: Menu?, menuInflater: MenuInflater?) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater!!.inflate(R.menu.logged, menu)
        menu!!.getItem(0).isVisible = true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        rootView!!.scrollReco.smoothScrollTo(0,0)
        when (item.itemId) {
            R.id.range_loc -> {
                if (ContextCompat.checkSelfPermission(activity,
                        android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
                    if (rangeSeekBar.visibility == View.VISIBLE) {
                        collapse(rangeSeekBar)
                        mFirst = true
                        getRecomendationRange(4000)

                        activity.runOnUiThread({ activity.title = "Recomendaciones" })
                    } else {
                        expand(rangeSeekBar)

                        rangeSeekBar.max = 0
                        rangeSeekBar.max = 390
                        rangeSeekBar.progress = 0

                        mFirst = true

                        getDeviceLocation()
                        getRecomendationRange(0)
                        activity.runOnUiThread({ activity.title = "10 Km." })
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

    private fun expand(v: View) {
        v.measure(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        val targetHeight = v.measuredHeight

        // Older versions of android (pre API 21) cancel animations for views with a height of 0.
        v.layoutParams.height = 1
        v.visibility = View.VISIBLE

        val a = object : Animation() {
            override fun applyTransformation(interpolatedTime: Float, t: android.view.animation.Transformation) {
                super.applyTransformation(interpolatedTime, t)
                v.layoutParams.height = if (interpolatedTime == 1f)
                    ViewGroup.LayoutParams.WRAP_CONTENT
                else
                    (targetHeight * interpolatedTime).toInt()
                v.requestLayout()
            }

            override fun willChangeBounds(): Boolean {
                return true
            }
        }

        // 1dp/ms
        a.duration = (targetHeight / v.context.resources.displayMetrics.density).toInt().toLong()
        v.startAnimation(a)
    }

    private fun collapse(v: View) {
        val initialHeight = v.measuredHeight

        val a = object : Animation() {
            override fun applyTransformation(interpolatedTime: Float, t: android.view.animation.Transformation) {
                if (interpolatedTime == 1f) {
                    v.visibility = View.GONE
                } else {
                    v.layoutParams.height = initialHeight - (initialHeight * interpolatedTime).toInt()
                    v.requestLayout()

                }
            }

            override fun willChangeBounds(): Boolean {
                return true
            }
        }

        // 1dp/ms
        a.duration = (initialHeight / v.context.resources.displayMetrics.density).toInt().toLong()
        v.startAnimation(a)
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
            Log.e("asd", "Sin permisos men")
            ActivityCompat.requestPermissions(activity,
                    arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION),
                    99)
        }
    }

    private fun getRecomendationRange(range: Int) {
        mMEIPage!!.loadUrl("javascript: ajaxReco(" + lat + "," + lng + "," + (range + 10) + ");")
        rootView!!.recomSwipe.isRefreshing = true
    }

    inner class JSI constructor(val context : Context, private val rootView : View) {
        val db = FavoriteDB(activity.baseContext)

        @JavascriptInterface
        fun recPage(Nombre: String, Uni: String, urlInfo: String, iMaps: Int, urlFoto: String, Inst: String, mLast: Boolean, Id : Int, lat: Double, lng: Double, sueldo : String) {
            activity.runOnUiThread{
                Log.e("asd", Id.toString())
                if(mFirst){
                    rootView.recomLayout.removeAllViews()
                    rootView.recomSwipe.isRefreshing = false
                    mFirst = false
                    rootView.moreLy.visibility = View.VISIBLE

                    if(mLast){
                        val inflater = LayoutInflater.from(context)
                        inflater.inflate(R.layout.empty_sample,rootView.recomLayout , true)
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

                val inflater = LayoutInflater.from(context)
                val recCard : View = inflater.inflate(R.layout.recom_card_sample,rootView.recomLayout , false)

                Picasso.with(context).load(urlFoto).transform(object : Transformation {

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
                    Picasso.with(context).load(R.drawable.ic_favorite_action).into(recCard.img_main_card1_favorite)
                }

                recCard.img_main_card1_favorite.setOnClickListener {
                    c = db.getFavoriteById(Id)
                    if (c.count > 0){
                        if(db.deleteFavoriteById(Id)){
                            Toast.makeText(context, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                            Picasso.with(context).load(R.drawable.ic_favorite_border).into(recCard.img_main_card1_favorite)
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
                            Toast.makeText(context, "Se ha agregado a favoritos.", Toast.LENGTH_SHORT).show()
                            Picasso.with(context).load(R.drawable.ic_favorite_action).into(recCard.img_main_card1_favorite)
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
    }
}