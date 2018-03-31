package ramir.mei

import android.annotation.SuppressLint
import android.app.FragmentManager
import android.content.Intent
import android.os.Bundle
import android.preference.PreferenceManager
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.animation.AlphaAnimation
import android.view.animation.AnimationSet
import android.webkit.JavascriptInterface
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Toast
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    private var mURL : String = ""
    private val mJSIName : String = GlobalVar().getJSIName()
    private var pageMEI : WebView? = null

    @SuppressLint("SetJavaScriptEnabled")
    override fun onCreate(savedInstanceState: Bundle?) {
        mURL = GlobalVar().getMeiURL(baseContext)+"login.php"
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setSupportActionBar(iptoolbar)
        if(GlobalVar().getMeiURL(baseContext) != ""){
            iptoolbar.visibility = View.GONE
        }

        Log.e("MAIN", "Iniciado...")

        Picasso.with(baseContext).load(mURL + "/../imgs/logo1.png").into(this@MainActivity.logoLoading)

        pageMEI = WebView(this)

        val webSetting: WebSettings = pageMEI!!.settings
        webSetting.javaScriptEnabled = true
        webSetting.domStorageEnabled = true

        pageMEI!!.webViewClient = WebViewClient()

        pageMEI!!.loadUrl(mURL)

        pageMEI!!.addJavascriptInterface(JSI(fragmentManager), mJSIName)

        imageButton.setOnClickListener({
            val pref = PreferenceManager.getDefaultSharedPreferences(baseContext)
            pref.edit().putString("IP_MEI", editText.text.toString()).apply()
            Toast.makeText(baseContext, "IP principal configurada en http://"+editText.text.toString()+"/", Toast.LENGTH_SHORT).show()
            pageMEI!!.reload()
        })
    }

    override fun onResume() {
        super.onResume()
        pageMEI!!.reload()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.ip_menu, menu)

        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem?): Boolean {
        return when (item!!.itemId) {
            R.id.ip_config -> {
                if(ip_config_ly.visibility == View.GONE){
                    ip_config_ly.visibility = View.VISIBLE
                }else if (ip_config_ly.visibility == View.VISIBLE){
                    ip_config_ly.visibility = View.GONE
                }
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
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
