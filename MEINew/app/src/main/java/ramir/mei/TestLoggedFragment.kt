package ramir.mei

import android.app.Fragment
import android.app.ProgressDialog
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.SimpleAdapter
import kotlinx.android.synthetic.main.logged_test_fragment.view.*

/**
 * Creado por Ramiro el 22/11/2017 a las 07:37 PM para MEINew.
 */

class TestLoggedFragment : Fragment() {
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/test.php"
    private val mJSIName : String = GlobalVar().getJSIName()
    private val listItems = ArrayList<Map<String, String>>()
    private var isIntent = false

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_test_fragment, container, false)

        val adapter = SimpleAdapter(activity.baseContext , listItems,
                android.R.layout.simple_list_item_2,
                arrayOf("linea1", "linea2"),
                intArrayOf(android.R.id.text1, android.R.id.text2))

        rootView.listTest.adapter = adapter

        val progressDialog = ProgressDialog.show(activity,"", "Espere un momento...", true, true)

        val context = activity.baseContext
        val mMEIPage = WebView(context)

        mMEIPage.webViewClient = object : WebViewClient(){
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                progressDialog.cancel()
            }
        }
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true

        rootView.listTest.setOnItemClickListener { _, _, i, _ -> kotlin.run {
            mMEIPage.loadUrl("javascript: getHref($i);")
        }}

        mMEIPage.addJavascriptInterface(JSI(activity.baseContext, adapter), mJSIName)

        mMEIPage.loadUrl(mURL)
        return rootView
    }

    override fun onPause() {
        if(isIntent){
            activity.overridePendingTransition(R.anim.pull_in_right, R.anim.push_out_left)
            isIntent = false
        }
        super.onPause()
    }

    inner class JSI constructor (val context : Context, val adapter: SimpleAdapter) {
        @JavascriptInterface
        fun testPage(nameTest : String, numPreg : String){
            activity.runOnUiThread{
                val datum = HashMap<String, String>()
                datum.put("linea1", nameTest)
                datum.put("linea2","$numPreg preguntas")

                Log.e("Activity", nameTest)

                this@TestLoggedFragment.listItems.add(datum)
                adapter.notifyDataSetChanged()
            }
        }

        @JavascriptInterface
        fun openTest(url : String, name : String){
            isIntent = true
            val intent = Intent(activity, TestVocacionalFragment::class.java)
            intent.putExtra("url", url)
            intent.putExtra("name", name)
            startActivity(intent)
        }
    }
}