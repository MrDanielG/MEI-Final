package ramir.mei.fragment.notLogged

import android.content.Intent
import android.os.Bundle
import android.preference.PreferenceManager
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.fragment_login.view.*
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.Utils
import ramir.mei.activity.LoggedActivity

class LoginFragment : android.app.Fragment() {

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.fragment_login, container, false)
        val queue = Volley.newRequestQueue(activity)
        val url = Utils().getMeiURL()

        Picasso.get().load("file:///android_asset/logo.png").into(rootView.logoView)

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val resp = JSONObject(it)
                if(resp.getBoolean("login")){
                    PreferenceManager.getDefaultSharedPreferences(activity).edit().putBoolean("login", true).putString("key", resp.getString("key")).apply()
                            activity.startActivity(Intent(activity, LoggedActivity::class.java))
                    activity.finish()
                }else{
                    Toast.makeText(activity, "Correo electrónico o contraseña incorrectos.", Toast.LENGTH_SHORT).show()
                    rootView.et_pass.editText?.setText("")
                }
            }catch (e : Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("usr" to rootView.et_email.editText?.text.toString(),
                        "pass" to rootView.et_pass.editText?.text.toString(),
                        "req" to "login",
                        "device" to "")
            }
        }

        rootView.btn_login.setOnClickListener {
            val email = rootView.et_email.editText?.text.toString()
            val passw = rootView.et_pass.editText?.text.toString()
            var error = true

            if (!Utils().isValidEmail(email, resources)) {
                rootView.et_email.error = "Correo electrónico inválido."
                error = false
            }

            if (!Utils().isValidPassword(passw)) {
                rootView.et_pass.error = "Contraseña inválida."
                error = false
            }

            if (error) {
                queue.add(req)
                Toast.makeText(activity, "Iniciando sesión", Toast.LENGTH_SHORT).show()
            }
        }
        return rootView
    }
}
