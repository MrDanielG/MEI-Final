package ramir.mei

import android.annotation.SuppressLint
import android.app.FragmentManager
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.View
import android.view.animation.AlphaAnimation
import android.view.animation.AnimationSet
import android.webkit.JavascriptInterface
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var mURL : String = ""
    private val mJSIName : String = Utils().getJSIName()
    private var pageMEI : WebView? = null

    @SuppressLint("SetJavaScriptEnabled")
    override fun onCreate(savedInstanceState: Bundle?) {
        mURL = Utils().getMeiURL()+"login.php"
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        Log.e("MAIN", "Iniciado...")

        Picasso.with(baseContext).load("$mURL/../imgs/logo1.png").into(this@MainActivity.logoLoading)

        pageMEI = WebView(this)

        val webSetting: WebSettings = pageMEI!!.settings
        webSetting.javaScriptEnabled = true
        webSetting.domStorageEnabled = true

        pageMEI!!.webViewClient = WebViewClient()

        pageMEI!!.loadUrl(mURL)

        pageMEI!!.addJavascriptInterface(JSI(fragmentManager), mJSIName)

    }

    override fun onResume() {
        super.onResume()
        pageMEI!!.reload()
    }

    private inner class JSI constructor(val fragmentManager: FragmentManager) {
        @JavascriptInterface
        fun pageLoaded(i: Int) {
            this@MainActivity.runOnUiThread {
                val fadeOut = AlphaAnimation(1f, 0f)
                fadeOut.startOffset = 1000
                fadeOut.duration = 200
                val animation = AnimationSet(true)
                animation.addAnimation(fadeOut)
                this@MainActivity.loadingLayout.animation = animation
                this@MainActivity.loadingLayout.visibility = View.GONE
                pb_main.visibility = View.GONE
            }

            when(i){
                1 -> fragmentManager.beginTransaction().add(R.id.frameContainer, NotLogFragment()).commit()
                2 -> {
                    startActivity(Intent(baseContext, LoggedFragment::class.java))
                    finish()
                }
            }
        }
    }
}
