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

class TestVocacionalActivity : AppCompatActivity() {
    data class PreguntaData(val pregunta : String, val area : String, val value : Int, var resp : Boolean? = null)
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
                    val pregunta = JSONObject(response[i].toString())
                    val prop = JSONObject(pregunta.getString("0"))
                    preguntasList.add(PreguntaData(pregunta.getString("pregunta_examen"), prop.getString("name"), prop.getInt("value")))
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
                            .setPositiveButton("Aceptar", null)
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
                var mult: Int

                for(resp in preguntasList){
                    mult = if(resp.resp == true) 1 else -1

                    if(area.containsKey(resp.area)){
                        area[resp.area]?.plus(resp.value*mult)
                    }else{
                        area[resp.area] = resp.value*mult
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
                if(item.resp == null){
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

            holder.radioGroup.setOnCheckedChangeListener { _, i ->
                data.resp = (i == 0)
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
    }
}
