package ramir.mei

import android.animation.ArgbEvaluator
import android.animation.ObjectAnimator
import android.content.Context
import android.graphics.Bitmap
import android.graphics.Color
import android.os.Bundle
import android.support.v4.app.ActivityCompat
import android.support.v7.app.AppCompatActivity
import android.text.Html
import android.text.method.LinkMovementMethod
import android.view.MenuItem
import android.view.View
import android.view.WindowManager
import android.view.animation.AlphaAnimation
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.activity_career.*
import kotlinx.android.synthetic.main.carrer_content.*



class CareerActivity : AppCompatActivity() {
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/carrera.php?carrera="
    private val mJSIName : String = GlobalVar().getJSIName()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_career)
        val density = resources.displayMetrics.density

        window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)

        val mMEIPage = WebView(baseContext)

        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.settings.javaScriptEnabled = true

        mMEIPage.addJavascriptInterface(JSI(baseContext), mJSIName)

        mMEIPage.webViewClient = object : WebViewClient(){
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                careerLoad.visibility = View.GONE
            }
        }

        title = ""
        val name = intent.getStringExtra("name")
        val uni = intent.getStringExtra("uni")

        careerTitle.text = name
        careerTitle.setTextColor(Color.BLACK)

        val animation = ObjectAnimator.ofInt(careerTitle, "textColor", Color.BLACK, Color.WHITE)
        animation.setEvaluator(ArgbEvaluator())
        animation.duration = 500
        animation.start()

        setSupportActionBar(toolbar)
        if (supportActionBar != null) {
            supportActionBar!!.setDisplayHomeAsUpEnabled(true)
        }

        Picasso.with(baseContext).load(intent.getStringExtra("img")).transform(object : Transformation {

            override fun transform(source: Bitmap): Bitmap {
                val targetHeight = (density*200).toInt()
                val aspectRatio = source.width.toDouble() / source.height.toDouble()
                val targetWidth = (targetHeight * aspectRatio).toInt()
                val result = Bitmap.createScaledBitmap(source, targetWidth, targetHeight, false)
                if (result != source) {
                    source.recycle()
                }
                return result
            }

            override fun key(): String = "cropPosterTransformation720"
        }).into(image_scrolling_top)

        mMEIPage.loadUrl(mURL+"$name&uni=$uni")
    }

    override fun onBackPressed() {
        paTerminar()
        super.onBackPressed()
    }

    override fun onOptionsItemSelected(item: MenuItem?): Boolean {
        paTerminar()
        ActivityCompat.finishAfterTransition(this)
        return super.onOptionsItemSelected(item)
    }

    private fun paTerminar(){
        val animationColor = ObjectAnimator.ofInt(careerTitle, "textColor", Color.WHITE, Color.BLACK)
        animationColor.setEvaluator(ArgbEvaluator())
        animationColor.duration = 500
        animationColor.start()
    }

    inner class JSI constructor(val context : Context) {
        @Suppress("DEPRECATION")
        @JavascriptInterface
        fun infoCareer(info: String, i: Int) {
            runOnUiThread {
                when (i) {
                    0 -> id_univ.text = Html.fromHtml(info)
                    1 -> id_inst.text = Html.fromHtml(info)
                    2 -> id_area.text = Html.fromHtml(info)
                    3 -> id_descrip.text = Html.fromHtml(info)
                    4 ->{
                        id_plan.text = Html.fromHtml(info)
                        id_plan.movementMethod = LinkMovementMethod.getInstance()}
                    5 ->{
                        id_becas.text = Html.fromHtml(info)
                        id_becas.movementMethod = LinkMovementMethod.getInstance()}
                    6 ->{
                        id_perfil_egreso.text = Html.fromHtml(info)
                        id_perfil_egreso.movementMethod = LinkMovementMethod.getInstance()}
                    7 ->{
                        id_intercambios.text = Html.fromHtml(info)
                        id_intercambios.movementMethod = LinkMovementMethod.getInstance()
                        id_career_content.visibility = View.VISIBLE
                        val fadein = AlphaAnimation(0.0f, 1.0f)
                        fadein.duration = 500
                        id_career_content.startAnimation(fadein)}
                }
            }
        }
    }
}
