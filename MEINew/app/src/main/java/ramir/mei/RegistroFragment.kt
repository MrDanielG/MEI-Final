package ramir.mei

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.TextView
import android.widget.Toast
import kotlinx.android.synthetic.main.fragment_registro.view.*
import java.util.regex.Pattern


class RegistroFragment : android.app.Fragment() {
    private var mURL = ""
    private var sinError : Boolean = true
    private val mJSIName : String = GlobalVar().getJSIName()
    var cityValue : Int = 0

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        val view: View = inflater!!.inflate(R.layout.fragment_registro, container, false)
        mURL = GlobalVar().getMeiURL(activity) + "signin.php"
        val wbMEI = WebView(activity)

        view.et_r_lugar.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(adapterView: AdapterView<*>, view: View, i: Int, l: Long) {
                sinError = false
                cityValue = i
            }

            override fun onNothingSelected(adapterView: AdapterView<*>) {
                sinError = true
            }
        }

        val adapter = ArrayAdapter.createFromResource(activity.baseContext,
                R.array.estados_array, android.R.layout.simple_spinner_item)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        view.et_r_lugar.adapter = adapter

        val webSettings = wbMEI.settings
        webSettings.javaScriptEnabled = true //Settings de wbMEI
        webSettings.domStorageEnabled = true

        wbMEI.addJavascriptInterface(JavaScriptInterfaceRegis(activity.baseContext), mJSIName)

        wbMEI.webViewClient = WebViewClient()

        view.btn_registro.setOnClickListener {
            val email = view.et_r_email.text.toString()
            val passw = view.et_r_pass.text.toString()
            var error: Boolean? = true

            if (!isValidEmail(email)) {
                view.et_r_email.error = "Correo electrónico inválido."
                error = false
            }
            if (!isValidPassword(passw)) {
                view.et_r_pass.error = "Contraseña inválida."
                error = false
            }
            if (!view.et_r_pass.text.toString().trim({ it <= ' ' }).matches(view.et_r_pass2.text.toString().trim({ it <= ' ' }).toRegex())) {
                view.et_r_pass2.error = "Las contraseñas no coinciden."
                error = false
            }
            if (view.et_r_nombre.length() < 1) {
                view.et_r_nombre.error = "Ingrese un nombre."
                error = false
            }
            if (view.et_r_last.length() < 1) {
                view.et_r_last.error = "Ingrese apellidos."
                error = false
            }

            val edadV: Int = try {
                Integer.parseInt(view.et_r_edad.text.toString())
            } catch (e: Exception) {
                9
            }

            if (edadV < 10) {
                view.et_r_edad.error = "Necesitas al menos 10 años para registrarte."
                error = false
            }
            if (sinError) {
                val errorText = view.et_r_lugar.selectedView as TextView
                errorText.error = "Seleccione una localidad."
                error = false
            }
            if (error!!) {
                val nombre = view.et_r_nombre.text.toString()
                wbMEI.loadUrl("javascript:" +
                        "    var x = document.getElementsByTagName('input');" +
                        "    var op =  document.getElementsByTagName('option');" +
                        "    var form = document.getElementsByTagName('button')[0];" +
                        "    x[0].value='" + view.et_r_email.text.toString() + "';" +
                        "    x[1].value='" + view.et_r_pass.text.toString() + "';" +
                        "    x[2].value='" + view.et_r_pass2.text.toString() + "';" +
                        "    x[3].value='" + nombre + "';" +
                        "    x[4].value='" + view.et_r_last.text.toString() + "';" +
                        "    x[5].value=" + view.et_r_edad.text.toString() + ";" +
                        "    op[" + (cityValue + 1) + "].selected = true;" +
                        "    $(form).click();")
            }
        }

        wbMEI.loadUrl(mURL)
        
        return view
    }

    inner class JavaScriptInterfaceRegis internal constructor(internal var context: Context) {

        @JavascriptInterface
        fun isRegis() {
            activity.runOnUiThread {
                Toast.makeText(activity.baseContext, "Se ha registrado exitosamente.", Toast.LENGTH_SHORT).show()
                view.et_r_nombre.setText("")
                view.et_r_last.setText("")
                view.et_r_email.setText("")
                view.et_r_pass.setText("")
                view.et_r_pass2.setText("")
                view.et_r_edad.setText("10")
            }
        }

        @JavascriptInterface
        fun errorRegis() {
            activity.runOnUiThread { Toast.makeText(activity.baseContext, "Algo salió mal, es posible que el correo ya esté siendo utilizado o alguno de los campos no cumpla con los requerimientos.", Toast.LENGTH_LONG).show() }
        }
    }

    private fun isValidPassword(pass: String?): Boolean {
        return pass != null && pass.length >= 6
    }

    private fun isValidEmail(email: String): Boolean {
        val regex = getString(R.string.valid_email_pattern)

        val pattern = Pattern.compile(regex)
        val matcher = pattern.matcher(email)
        return matcher.matches()
    }
}
