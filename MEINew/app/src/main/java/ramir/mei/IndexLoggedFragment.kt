package ramir.mei

import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient

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
        mMEIPage.addJavascriptInterface(JSI(), mJSIName)

        mMEIPage.loadUrl(mURL)
        return rootView
    }

    inner class JSI {
        @JavascriptInterface
        fun indexPage(){

        }
    }

}