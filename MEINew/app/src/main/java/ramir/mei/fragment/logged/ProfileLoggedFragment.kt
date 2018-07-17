package ramir.mei.fragment.logged

import android.app.Fragment
import android.content.Context
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.TableRow
import android.widget.TextView
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.logged_profile_fragment.view.*
import kotlinx.android.synthetic.main.profile_content.view.*
import org.json.JSONArray
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.Utils

/**
 * Creado por Ramiro el 22/11/2017 a las 07:38 PM para MEINew.
 */
class ProfileLoggedFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_profile_fragment, container, false)
        val queue = Volley.newRequestQueue(activity)
        val url = Utils().getMeiURL()

        val tablaContent = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                rootView.swipeProfile.isRefreshing = false
                val response = JSONArray(it)

                rootView.tablaTest.removeAllViews()

                perfilTabla("Nombre",
                        "Fecha",
                        "Resultado",
                        activity, resources.displayMetrics.density,
                        rootView)

                for(i in 0 until response.length()){
                    val data = JSONObject(response[i].toString())

                    perfilTabla(data.getString("test"),
                            data.getString("fecha"),
                            data.getString("resu"),
                            activity, resources.displayMetrics.density,
                            rootView)
                }
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(activity),
                        "req" to "perfil",
                        "tabla" to "")
            }
        }

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val response = JSONObject(it)
                Picasso.get().load(Utils().getMeiURL() + response.getString("0")).transform(Utils.CircleTransform()).into(rootView.perfil_foto)
                rootView.textView.text = response.getString("name") + " " + response.getString("last_name")
                rootView.textView2.text = response.getString("email")
                rootView.textView3.text = response.getString("edad") + " años."
                rootView.textView4.text = response.getString("ciudad")
                queue.add(tablaContent)
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(activity),
                        "req" to "perfil")
            }
        }

        rootView.swipeProfile.setOnRefreshListener {
            queue.add(req)
        }

        rootView.swipeProfile.isRefreshing = true
        queue.add(req)
        return rootView
    }

    fun perfilTabla(test: String, fecha: String, resu: String, context: Context, density : Float, rootView : View) {
        val tvTest = TextView(context)
        val tvFecha = TextView(context)
        val tvResu = TextView(context)
        tvTest.text = test
        tvFecha.text = fecha
        tvResu.text = resu
        tvFecha.setTextColor(Color.BLACK)
        tvResu.setTextColor(Color.BLACK)
        tvTest.setTextColor(Color.BLACK)

        val param = TableRow.LayoutParams(
                TableRow.LayoutParams.WRAP_CONTENT,
                TableRow.LayoutParams.WRAP_CONTENT, 1f)

        param.setMargins((10 * density).toInt(), (16 * density).toInt(), (10 * density).toInt(), (16 * density).toInt())

        val tableRow = TableRow(context)
        tableRow.addView(tvTest, param)
        tableRow.addView(tvFecha, param)
        tableRow.addView(tvResu, param)
        rootView.tablaTest.addView(tableRow)

        val layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)

        val view2 = View(activity)
        view2.setBackgroundColor(Color.parseColor("#D0D0D0"))
        val dp1 = (1 * density).toInt()

        rootView.tablaTest.addView(view2, layoutParams)

        view2.layoutParams.height = dp1
    }
}