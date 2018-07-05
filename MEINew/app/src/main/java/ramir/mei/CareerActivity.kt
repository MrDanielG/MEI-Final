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
import android.widget.Toast
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.activity_career.*
import kotlinx.android.synthetic.main.carrer_content.*


class CareerActivity : AppCompatActivity() {
    private var mURL : String = ""
    private val mJSIName : String = Utils().getJSIName()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_career)

        mURL = Utils().getMeiURL()+"MEI/carrera.php?carrera="

        val density = resources.displayMetrics.density

        window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)

        val mMEIPage = WebView(baseContext)

        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.settings.javaScriptEnabled = true

        mMEIPage.addJavascriptInterface(JSI(baseContext), mJSIName)

        mMEIPage.webViewClient = object : WebViewClient(){
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                careerLoad.visibility = View.INVISIBLE
            }
        }

        title = ""
        val name = intent.getStringExtra("name")
        val uni = intent.getStringExtra("uni")
        val Id = intent.getIntExtra("id", 0)

        val db = FavoriteDB(baseContext)
        if(db.getFavoriteById(Id).count > 0){
            Picasso.get().load(R.drawable.ic_favorite_action).into(fab_scrolling)
        }

        fab_scrolling.setOnClickListener {
            if(db.getFavoriteById(Id).count > 0){
                if(db.deleteFavoriteById(Id)){
                    Toast.makeText(baseContext, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                    Picasso.get().load(R.drawable.ic_favorite_border).into(fab_scrolling)
                }
            }else{
                val data = FavoriteData()
                data.id = Id
                data.urlFoto = intent.getStringExtra("img")
                data.inst = intent.getStringExtra("inst")
                data.sueldo = intent.getStringExtra("sueldo")
                data.nombre = name
                data.uni = uni
                data.lat = intent.getDoubleExtra("lat", 0.0)
                data.lng = intent.getDoubleExtra("lng", 0.0)
                if(db.addFavorites(data)) {
                    Toast.makeText(baseContext, "Se ha agregado a favoritos.", Toast.LENGTH_SHORT).show()
                    Picasso.get().load(R.drawable.ic_favorite_action).into(fab_scrolling)
                }
            }
        }

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

        Picasso.get().load(intent.getStringExtra("img")).transform(object : Transformation {

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

        mMEIPage.loadUrl("$mURL$name&uni=$uni")
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

        val animationAlpha = AlphaAnimation(1f, 0f)
        animationAlpha.duration = 200
        id_career_content.startAnimation(animationAlpha)
        id_career_content.visibility = View.GONE
    }

    inner class JSI constructor(val context : Context) {
        @Suppress("DEPRECATION")
        @JavascriptInterface
        fun infoCareer(info: String) {
            runOnUiThread {
                tv_carrera.text = Html.fromHtml(info)
                tv_carrera.movementMethod = LinkMovementMethod.getInstance()

                id_career_content.visibility = View.VISIBLE
                val fadein = AlphaAnimation(0.0f, 1.0f)
                fadein.duration = 500
                id_career_content.startAnimation(fadein)
            }
        }
    }
}
