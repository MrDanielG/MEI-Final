package ramir.mei.fragment.logged

import android.app.Fragment
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.SimpleAdapter
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.logged_test_fragment.view.*
import org.json.JSONArray
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.Utils
import ramir.mei.activity.TestVocacionalActivity

/**
 * Creado por Ramiro el 22/11/2017 a las 07:37 PM para MEINew.
 */

class TestLoggedFragment : Fragment() {
    private val listItems = ArrayList<Map<String, String>>()
    private var isIntent = false

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_test_fragment, container, false)
        val url = Utils().getMeiURL()
        val queue = Volley.newRequestQueue(activity)
        val adapter = SimpleAdapter(activity.baseContext , listItems,
                android.R.layout.simple_list_item_2,
                arrayOf("linea1", "linea2"),
                intArrayOf(android.R.id.text1, android.R.id.text2))
        val itemUid = ArrayList<String>()

        rootView.listTest.adapter = adapter

        rootView.listTest.setOnItemClickListener { _, _, i, _ -> kotlin.run {
            isIntent = true
            val intent = Intent(activity, TestVocacionalActivity::class.java)
            intent.putExtra("UID", itemUid[i])
            intent.putExtra("name", listItems[i]["linea1"])
            startActivity(intent)
        }}

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val response = JSONArray(it)
                itemUid.clear()
                rootView.swipe_test.isRefreshing = false

                for(i in 0 until response.length()){
                    val item = JSONObject(response[i].toString())
                    val itemData = hashMapOf("linea1" to item.getString("name"), "linea2" to "${item.getInt("num")} preguntas.")
                    itemUid.add(item.getString("UID"))
                    this@TestLoggedFragment.listItems.add(itemData)
                }
                adapter.notifyDataSetChanged()
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "", "key" to Utils().getKey(activity), "req" to "listTest")
            }
        }

        rootView.swipe_test.setOnRefreshListener {
            listItems.clear()
            queue.add(req)
        }

        rootView.swipe_test.isRefreshing = true
        queue.add(req)
        return rootView
    }

    override fun onPause() {
        if(isIntent){
            activity.overridePendingTransition(R.anim.pull_in_right, R.anim.push_out_left)
            isIntent = false
        }
        super.onPause()
    }
}