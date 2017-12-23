package ramir.mei

import android.content.Context
import android.content.res.ColorStateList
import android.graphics.Color
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.text.Html
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.animation.AlphaAnimation
import android.view.animation.ScaleAnimation
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.*
import kotlinx.android.synthetic.main.activity_test_vocacional_fragment.*
import kotlinx.android.synthetic.main.test_result_layout_sample.view.*

class TestVocacionalFragment : AppCompatActivity() {
    private val mJSIName : String = GlobalVar().getJSIName()
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test_vocacional_fragment)

        val mMEIPage = WebView(baseContext)

        title = intent.getStringExtra("name")

        mMEIPage.webViewClient = WebViewClient()
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true

        mMEIPage.addJavascriptInterface(JSI(baseContext, mMEIPage), mJSIName)

        enviarbt.setOnClickListener {
            mMEIPage.loadUrl("javascript: $('#boton').click();")
        }

        mMEIPage.loadUrl(mURL+intent.getStringExtra("url"))
    }

    override fun onBackPressed() {
        super.onBackPressed()
        overridePendingTransition(R.anim.pull_in_left, R.anim.push_out_right)
    }

    inner class JSI constructor (val context : Context, val mei : WebView) {
        private val density = this@TestVocacionalFragment.resources.displayMetrics.density
        private var Rbindex = 0
        private var respuestas: RadioGroup? = null

        fun scaleView(v: View) {
            val anim = ScaleAnimation(
                    1f, 1f,
                    0f, 1f)
            anim.fillAfter = true
            anim.duration = 1000
            v.startAnimation(anim)
        }

        fun alphaView(v: View) {
            val anim = AlphaAnimation(0f, 1f)
            anim.fillAfter = true
            anim.duration = 1000
            v.startAnimation(anim)
        }

        @JavascriptInterface
        fun pregunta(pregunta: String) {
            runOnUiThread {
                testLoad.visibility = View.GONE
                val param = TableRow.LayoutParams(
                        TableRow.LayoutParams.WRAP_CONTENT,
                        TableRow.LayoutParams.WRAP_CONTENT, 1f)

                val textView = TextView(context)
                textView.text = pregunta
                textView.setTextColor(Color.BLACK)
                textView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f)
                ly_testvoca.addView(textView, param)
                scaleView(textView)
                alphaView(textView)
            }
        }

        @JavascriptInterface
        fun radioGCreate() {
            runOnUiThread {
                respuestas = RadioGroup(context)
                ly_testvoca.addView(respuestas)

                respuestas!!.setOnCheckedChangeListener { _, i -> mei.loadUrl("javascript:document.getElementsByTagName('input')[" + i.toString() + "].checked = true;") }
            }
        }

        @JavascriptInterface
        fun numradio(num: Int?) {
            Rbindex = 0
        }

        @JavascriptInterface
        fun radioCreate(valor: String) {
            runOnUiThread {
                val radioButton = RadioButton(context)
                radioButton.text = valor
                radioButton.setTextColor(Color.BLACK)
                val colorStateList = ColorStateList(
                        arrayOf(intArrayOf(-android.R.attr.state_enabled), //disabled
                                intArrayOf(android.R.attr.state_enabled) //enabled
                        ), intArrayOf(Color.GRAY, //disabled
                        Color.DKGRAY //enabled
                )
                )
                radioButton.buttonTintList = colorStateList
                radioButton.id = Rbindex++

                respuestas!!.addView(radioButton)
                scaleView(radioButton)
                alphaView(radioButton)
            }
        }

        @JavascriptInterface
        fun separador() {
            runOnUiThread {
                val layoutParams = LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)

                val view2 = View(context)
                val dp16 = (16 * density).toInt()

                ly_testvoca.addView(view2, layoutParams)

                view2.layoutParams.height = dp16

                scaleView(view2)
            }
        }

        @JavascriptInterface
        fun testResult(title : String, html : String){
            val inflater = LayoutInflater.from(baseContext)
            val resCard : View = inflater.inflate(R.layout.test_result_layout_sample, prueba , false)

            resCard.tvTitle.text = title
            resCard.tvDescript.text = Html.fromHtml(html)

            runOnUiThread {
                this@TestVocacionalFragment.title = "Resultados"
                prueba.removeAllViews()
                prueba.addView(resCard)
            }
        }
    }
}
