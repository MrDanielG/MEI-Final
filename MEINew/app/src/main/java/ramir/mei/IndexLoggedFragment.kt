package ramir.mei

import android.app.Fragment
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.TextView
import com.daimajia.slider.library.SliderTypes.TextSliderView
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.MapsInitializer
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.TileOverlay
import com.google.android.gms.maps.model.TileOverlayOptions
import com.google.maps.android.heatmaps.HeatmapTileProvider
import com.twitter.sdk.android.core.DefaultLogger
import com.twitter.sdk.android.core.Twitter
import com.twitter.sdk.android.core.TwitterAuthConfig
import com.twitter.sdk.android.core.TwitterConfig
import com.twitter.sdk.android.tweetui.TweetTimelineRecyclerViewAdapter
import com.twitter.sdk.android.tweetui.UserTimeline
import kotlinx.android.synthetic.main.logged_index_fragment.*
import kotlinx.android.synthetic.main.logged_index_fragment.view.*








/**
 * Creado por Ramiro el 22/11/2017 a las 07:18 PM para MEINew.
 */

class IndexLoggedFragment : Fragment(), OnMapReadyCallback {
    private var mURL : String = ""
    private val mJSIName : String = GlobalVar().getJSIName()
    var mProvider : HeatmapTileProvider? = null
    var mOverlay : TileOverlay? = null
    var list = arrayListOf(LatLng(0.0,0.0))

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_index_fragment, container, false)
        val context = activity.baseContext
        val mMEIPage = WebView(context)
        mURL = GlobalVar().getMeiURL(activity)+"MEI/"

        val config = TwitterConfig.Builder(context)
                .logger(DefaultLogger(Log.DEBUG))
                .twitterAuthConfig(TwitterAuthConfig(resources.getString(R.string.com_twitter_sdk_android_CONSUMER_KEY),
                                                                resources.getString(R.string.com_twitter_sdk_android_CONSUMER_SECRET)))
                .debug(true)
                .build()

        Twitter.initialize(config)

        val userTimeline = UserTimeline.Builder().screenName("mei_mexico").build()

        rootView.tweetRV.layoutManager = LinearLayoutManager(context)

        val adapter = TweetTimelineRecyclerViewAdapter.Builder(context)
                .setTimeline(userTimeline)
                .setViewStyle(R.style.tw__TweetLightWithActionsStyle)
                .build()

        rootView.tweetRV.adapter = adapter

        mMEIPage.webViewClient =  WebViewClient()
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.addJavascriptInterface(JSI(rootView), mJSIName)


        /*
        rootView.map_fragment.onCreate(savedInstanceState)
        rootView.map_fragment.getMapAsync(this)
        rootView.map_fragment.onResume()
        */
        mMEIPage.loadUrl(mURL)

        return rootView
    }

    override fun onMapReady(googleMap: GoogleMap) {
        val lat = 24.0983213
        val lng = -101.5415634

        googleMap.uiSettings.isMyLocationButtonEnabled = false
        googleMap.uiSettings.isZoomControlsEnabled = false

        MapsInitializer.initialize(activity)

        googleMap.moveCamera(CameraUpdateFactory.newLatLngZoom(LatLng(lat,lng), 3.9f))

        googleMap.uiSettings.setAllGesturesEnabled(false)

        mProvider = HeatmapTileProvider.Builder().data(list).radius(10).build()
        mOverlay = googleMap.addTileOverlay( TileOverlayOptions().tileProvider(mProvider))
    }

    inner class JSI constructor (val v : View) {
        //val list = ArrayList<LatLng>()

        @JavascriptInterface
        fun indexPage(url : String, desc : String){
            activity.runOnUiThread {
                val sliderView = TextSliderView(activity.baseContext)
                sliderView.description(desc).image(url)
                v.slider.addSlider(sliderView)
            }
        }

        @JavascriptInterface
        fun bestInst(place : Int, name : String){
            activity.runOnUiThread {
                val tv = TextView(activity)
                val tct = place.toString()+" - "+name
                tv.text = tct
                top10.addView(tv)
            }
        }

        /*@JavascriptInterface
        fun mapStats(ciudad : String, mLast : Boolean){
            val geocoder = Geocoder(activity)

            val place = geocoder.getFromLocationName(ciudad, 1)[0]
            activity.runOnUiThread{

                list.add(LatLng(place.latitude, place.longitude))

                Log.e("Info", place.latitude.toString() + " " + place.longitude.toString())

                //val list = arrayListOf(LatLng(place.latitude, place.longitude))

                this@IndexLoggedFragment.mProvider!!.setData(list)
                this@IndexLoggedFragment.mOverlay!!.clearTileCache()
            }
        }*/
    }

}