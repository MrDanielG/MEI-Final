package ramir.mei

import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import com.daimajia.slider.library.SliderTypes.TextSliderView
import kotlinx.android.synthetic.main.logged_index_fragment.view.*

/**
 * Creado por Ramiro el 22/11/2017 a las 07:18 PM para MEINew.
 */

class IndexLoggedFragment : Fragment() {
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/"
    private val mJSIName : String = GlobalVar().getJSIName()

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_index_fragment, container, false)
        val context = activity.baseContext
        val mMEIPage = WebView(context)

        mMEIPage.webViewClient = WebViewClient()
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.addJavascriptInterface(JSI(rootView), mJSIName)

        mMEIPage.loadUrl(mURL)
        return rootView
    }

    inner class JSI constructor (val v : View) {
        @JavascriptInterface
        fun indexPage(url : String, desc : String){
            activity.runOnUiThread {
                val sliderView = TextSliderView(activity.baseContext)
                sliderView.description(desc).image(url)
                v.slider.addSlider(sliderView)
            }
        }
    }

}