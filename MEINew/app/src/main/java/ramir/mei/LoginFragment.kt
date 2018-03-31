package ramir.mei

import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.*
import android.widget.Toast
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.fragment_login.*
import kotlinx.android.synthetic.main.fragment_login.view.*
import java.util.regex.Pattern

class LoginFragment : android.app.Fragment() {
    private var pagMEI = ""
    private val mJSIName : String = GlobalVar().getJSIName()
    private val mTAG = "Login Activity"

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.fragment_login, container, false)
        pagMEI = GlobalVar().getMeiURL(activity) + "login.php"

        activity.runOnUiThread { Picasso.with(activity.baseContext).load(pagMEI + "/../imgs/logo1.png").into(rootView.logoView) }

        val MEI = WebView(activity)

        val webSettings = MEI.settings
        webSettings.javaScriptEnabled = true
        webSettings.domStorageEnabled = true

        MEI.addJavascriptInterface(JavaScriptInterface(activity.baseContext), mJSIName)

        MEI.webViewClient = object : WebViewClient() {

            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)
                rootView.progressBar.visibility = View.VISIBLE
            }

            override fun onPageFinished(view: WebView, url: String) {
                rootView.progressBar.visibility = View.GONE
                rootView.scrollLogin.visibility = View.VISIBLE
            }

        }
        MEI.webChromeClient = object : WebChromeClient() {
            override fun onConsoleMessage(cm: ConsoleMessage): Boolean {
                Log.i(mTAG, cm.message())
                return true
            }
        }

        rootView.btn_login.setOnClickListener {
            val email = rootView.et_email.text.toString()
            val passw = rootView.et_pass.text.toString()

            var error: Boolean? = true

            if (!isValidEmail(email)) {
                rootView.et_email.error = "Correo electrónico inválido."
                error = false
            }

            if (!isValidPassword(passw)) {
                rootView.et_pass.error = "Contraseña inválida."
                error = false
            }

            if (error!!) {
                MEI.loadUrl("javascript:" +
                        "var usr = document.getElementById('input_usuario');" +
                        "var pass = document.getElementById('input_pass');" +
                        "usr.value='" + et_email.text.toString() + "';" +
                        "pass.value='" + et_pass.text.toString() + "';" +
                        "$('#btn_submit').click();")
            }
        }

        MEI.loadUrl(pagMEI)
        return rootView
    }



    private inner class JavaScriptInterface internal constructor(internal var context: Context) {

        @JavascriptInterface
        fun pageLoaded(i: Int) {
            if(i == 2){
                activity.runOnUiThread {
                    et_email.setText("")
                    et_pass.setText("")
                    startActivity(Intent(activity, LoggedFragment::class.java))
                    activity.finish()
                }
            }
        }

        @JavascriptInterface
        fun loginError() {
            Toast.makeText(context, "Correo electrónico o contraseña incorrectos, por favor, intentelo de nuevo.", Toast.LENGTH_SHORT).show()
            et_pass.setText("")
        }
    }

    private fun isValidPassword(pass: String?): Boolean {
        return pass != null && pass.length > 6
    }

    private fun isValidEmail(email: String): Boolean {
        val regex = resources.getString(R.string.valid_email_pattern)

        val pattern = Pattern.compile(regex)
        val matcher = pattern.matcher(email)
        return matcher.matches()
    }
}
