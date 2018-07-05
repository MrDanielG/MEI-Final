package ramir.mei

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.fragment_registro.view.*
import org.json.JSONObject

class RegistroFragment : android.app.Fragment() {
    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view: View = inflater!!.inflate(R.layout.fragment_registro, container, false)
        val queue = Volley.newRequestQueue(activity)
        val url = Utils().getMeiURL() + "signin.php"

        val adapter = ArrayAdapter.createFromResource(activity.baseContext, R.array.estados_array, android.R.layout.simple_spinner_item)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        view.et_r_lugar.adapter = adapter

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val resp = JSONObject(it)
                if(resp.getBoolean("signed")){
                    Toast.makeText(activity.baseContext, "Se ha registrado exitosamente.", Toast.LENGTH_SHORT).show()
                    view.et_r_nombre.setText("")
                    view.et_r_last.setText("")
                    view.et_r_email.setText("")
                    view.et_r_pass.setText("")
                    view.et_r_pass2.setText("")
                    view.et_r_edad.setText("")
                }else{
                    Toast.makeText(activity, resp.getString("error"), Toast.LENGTH_SHORT).show()
                }
            }catch (e : Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("signin" to "",
                        "usr" to view.et_r_email.text.toString(),
                        "pass" to view.et_r_pass.text.toString(),
                        "nombre" to view.et_r_nombre.text.toString(),
                        "apellido" to view.et_r_last.text.toString(),
                        "edad" to view.et_r_edad.text.toString(),
                        "city" to view.et_r_lugar.selectedItem.toString())
            }
        }

        view.btn_registro.setOnClickListener {
            val email = view.et_r_email.text.toString()
            val passw = view.et_r_pass.text.toString()
            var error: Boolean? = true

            if (!Utils().isValidEmail(email, resources)) {
                view.et_r_email.error = "Correo electrónico inválido."
                error = false
            }
            if (!Utils().isValidPassword(passw)) {
                view.et_r_pass.error = "Contraseña inválida."
                error = false
            }
            if (!view.et_r_pass.text.toString().trim { it <= ' ' }.matches(view.et_r_pass2.text.toString().trim { it <= ' ' }.toRegex())) {
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

            if (view.et_r_edad.text.toString().toInt() < 10) {
                view.et_r_edad.error = "Necesitas al menos 10 años para registrarte."
                error = false
            }

            if (error!!) {
                queue.add(req)
            }
        }
        return view
    }
}
