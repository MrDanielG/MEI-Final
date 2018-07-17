package ramir.mei.fragment.logged

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.View
import android.widget.RadioGroup
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.activity_test_vocacional_fragment.*
import kotlinx.android.synthetic.main.sample_test_pregunta.view.*
import kotlinx.android.synthetic.main.test_result_layout_sample.view.*
import org.json.JSONArray
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.Utils

class TestVocacionalFragment : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test_vocacional_fragment)
        val url = Utils().getMeiURL()
        val queue = Volley.newRequestQueue(this)
        val radioGroupId = ArrayList<RadioGroup>()

        title = intent.getStringExtra("name")

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val response = JSONArray(it)
                ly_testvoca.removeAllViews()

                for (i in 0 until response.length()){
                    val pregunta = JSONObject(response[i].toString())
                    val preguntaLayout = layoutInflater.inflate(R.layout.sample_test_pregunta, null)
                    radioGroupId.add(preguntaLayout.test_radio_group)

                    preguntaLayout.test_pregunta.text = pregunta.getString("pregunta_examen")
                    ly_testvoca.addView(preguntaLayout)
                }

                val sendResp = object : StringRequest(Request.Method.POST, url, Response.Listener {
                    try {
                        val response2 = JSONObject(it)

                        if(response2.getBoolean("send")){
                            val resCard : View = layoutInflater.inflate(R.layout.test_result_layout_sample, prueba , false)

                            resCard.tvTitle.text = response2.getString("result")
                            resCard.tvDescript.text = response2.getString("descrip")

                            this@TestVocacionalFragment.title = "Resultados"
                            prueba.removeAllViews()
                            prueba.addView(resCard)
                        }
                    }catch (e:Exception){
                        Log.e("asd", e.toString())
                    }
                }, Response.ErrorListener {
                    Log.e("asd", it.toString())
                }){
                    override fun getParams(): MutableMap<String, String> {
                        val attrs = hashMapOf("device" to "",
                                "key" to Utils().getKey(this@TestVocacionalFragment),
                                "UID" to intent.getStringExtra("UID"),
                                "req" to "testForm")

                        
                        return attrs
                    }
                }

                enviarbt.setOnClickListener {
                    var error = false
                    for (item in radioGroupId){
                        if(item.checkedRadioButtonId == -1){
                            error = true
                        }
                    }
                    if(!error){
                        queue.add(sendResp)
                    }else{
                        Toast.makeText(this, "Alguna de las preguntas no fue respondida.", Toast.LENGTH_SHORT).show()
                    }
                }

            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(this@TestVocacionalFragment),
                        "UID" to intent.getStringExtra("UID"),
                        "req" to "testForm")
            }
        }

        queue.add(req)
    }

    override fun onBackPressed() {
        super.onBackPressed()
        overridePendingTransition(R.anim.pull_in_left, R.anim.push_out_right)
    }
}
