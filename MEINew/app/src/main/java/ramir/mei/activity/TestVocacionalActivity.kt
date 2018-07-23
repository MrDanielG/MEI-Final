package ramir.mei.activity

import android.app.AlertDialog
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.TextView
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.activity_test_vocacional_fragment.*
import kotlinx.android.synthetic.main.sample_test_pregunta.view.*
import org.json.JSONArray
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.Utils
import java.util.*
import kotlin.collections.ArrayList

class TestVocacionalActivity : AppCompatActivity() {
    data class PreguntaData(val pregunta : String, val area : String, val respuestas : ArrayList<Pair<String,Int>>, var respData : Pair<String,Int>? = null)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test_vocacional_fragment)
        val url = Utils().getMeiURL()
        val queue = Volley.newRequestQueue(this)
        val preguntasList = ArrayList<PreguntaData>()
        ly_testvoca.adapter = PreguntaAdapter(preguntasList)
        ly_testvoca.layoutManager = object : LinearLayoutManager(this){
            override fun canScrollVertically(): Boolean {
                return false
            }
        }

        title = intent.getStringExtra("name")

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val response = JSONArray(it)

                for (i in 0 until response.length()){
                    val pregunta = JSONArray(response[i].toString())
                    val resData = ArrayList<Pair<String,Int>>()
                    for(z in 1 until pregunta.length()){
                        resData.add(Pair(JSONObject(pregunta[z].toString()).getString("res"),JSONObject(pregunta[z].toString()).getInt("value")))
                    }
                    preguntasList.add(PreguntaData(JSONObject(pregunta[0].toString()).getString("pregunta_examen"), JSONObject(pregunta[1].toString()).getString("name"), resData))
                }
                ly_testvoca.adapter.notifyDataSetChanged()
                ly_testvoca.scheduleLayoutAnimation()
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(this@TestVocacionalActivity),
                        "UID" to intent.getStringExtra("UID"),
                        "req" to "testForm")
            }
        }

        val sendResp = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                Log.e("asd", it)
                val response = JSONObject(it)
                if(response.getBoolean("send")){
                    AlertDialog.Builder(this).setTitle("Resultado: "+response.getString("result"))
                            .setMessage("Ve al apartado de recomendaciones para ver las carreras ofertadas con tus aptidutes.")
                            .setPositiveButton("Aceptar"){ _, _ ->
                                finish()
                            }
                            .create().show()
                }else{
                    Toast.makeText(this, "Error: Algo ocurrió al intentar mandar tus resultados.", Toast.LENGTH_SHORT).show()
                }
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                val area = HashMap<String, Int>()

                for(resp in preguntasList){
                    if(area.containsKey(resp.area)){
                        area[resp.respData!!.first]?.plus(resp.respData!!.second)
                    }else{
                        area[resp.respData!!.first] = resp.respData!!.second
                    }
                }

                var res = ""
                var temp = -100

                for(resultado in area){
                    val areaRes = resultado.toPair()
                    if(areaRes.second > temp){
                        res = areaRes.first
                        temp = areaRes.second
                    }
                }

                Log.e("asd", area.toString())

                return hashMapOf("device" to "",
                        "key" to Utils().getKey(this@TestVocacionalActivity),
                        "UID" to intent.getStringExtra("UID"),
                        "req" to "formSend",
                        "area" to res)
            }
        }

        enviarbt.setOnClickListener {
            var error = false
            for (item in preguntasList){
                if(item.respData == null){
                    error = true
                }
            }
            if(!error){
                queue.add(sendResp)
            }else{
                Toast.makeText(this, "Alguna de las preguntas no fue respondida.", Toast.LENGTH_SHORT).show()
            }
        }

        queue.add(req)
    }

    inner class PreguntaAdapter constructor(private val preguntasList: List<PreguntaData>) : RecyclerView.Adapter<PreguntaAdapter.ViewHolder>() {
        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
            return ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.sample_test_pregunta, parent,false))
        }

        override fun getItemCount(): Int {
            return preguntasList.size
        }

        override fun onBindViewHolder(holder: ViewHolder, position: Int) {
            val data = preguntasList[position]

            for(radioData in data.respuestas){
                val radioButton = RadioButton(this@TestVocacionalActivity)
                radioButton.text = radioData.first
                radioButton.id = View.generateViewId()
                holder.radioGroup.addView(radioButton)
            }

            holder.radioGroup.setOnCheckedChangeListener { _, i ->
                val radioButtonIndex = holder.radioGroup.indexOfChild(holder.radioGroup.findViewById(i))
                data.respData = Pair(data.respuestas[radioButtonIndex].first,data.respuestas[radioButtonIndex].second)
            }

            holder.pregunta.text = data.pregunta
        }

        inner class ViewHolder constructor(v: View): RecyclerView.ViewHolder(v) {
            var radioGroup = RadioGroup(this@TestVocacionalActivity)
            var pregunta = TextView(this@TestVocacionalActivity)
            init {
                radioGroup = v.test_radio_group
                pregunta = v.test_pregunta
            }
        }
    }

    override fun onBackPressed() {
        super.onBackPressed()
        overridePendingTransition(R.anim.pull_in_left, R.anim.push_out_right)
        finish()
    }
}
