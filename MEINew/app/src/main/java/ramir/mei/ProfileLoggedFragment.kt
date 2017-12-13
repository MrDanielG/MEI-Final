package ramir.mei

import android.app.Fragment
import android.content.Context
import android.graphics.*
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.LinearLayout
import android.widget.TableRow
import android.widget.TextView
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.logged_profile_fragment.view.*
import kotlinx.android.synthetic.main.profile_content.view.*

/**
 * Creado por Ramiro el 22/11/2017 a las 07:38 PM para MEINew.
 */
class ProfileLoggedFragment : Fragment() {
    private val mURL : String = GlobalVar().getMeiURL()+"MEI/perfil.php"
    private val mJSIName : String = GlobalVar().getJSIName()

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_profile_fragment, container, false)
        val context = activity.baseContext
        val mMEIPage = WebView(context)

        rootView.swipeProfile.isRefreshing = true

        rootView.swipeProfile.setOnRefreshListener {
            mMEIPage.reload()
        }

        mMEIPage.webViewClient = object : WebViewClient(){
            override fun onPageFinished(view: WebView?, url: String?) {
                super.onPageFinished(view, url)
                rootView.swipeProfile.isRefreshing = false
            }
        }
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.addJavascriptInterface(JSI(activity.baseContext, rootView), mJSIName)

        mMEIPage.loadUrl(mURL)
        return rootView
    }

    inner class JSI constructor(val context : Context, private val rootView : View) {

        val density = resources.displayMetrics.density

        @JavascriptInterface
        fun perfil(url: String, name: String, correo: String, edad: String, ciudad: String) {
            activity.runOnUiThread({
                Picasso.with(context).load(mURL + "/../../resourses/profile_pics/" + url).transform(CircleTransform()).into(rootView.perfil_foto)
                rootView.textView.text = name
                rootView.textView2.text = correo
                rootView.textView3.text = edad
                rootView.textView4.text = ciudad
            })
        }

        @JavascriptInterface
        fun perfilTabla(test: String, fecha: String, resu: String) {
            activity.runOnUiThread({
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

                val view2 = View(context)
                view2.setBackgroundResource(R.color.material_grey_600)
                val dp1 = (1 * density).toInt()

                rootView.tablaTest.addView(view2, layoutParams)

                view2.layoutParams.height = dp1
            })
        }
    }

    inner class CircleTransform : Transformation {

        private var x: Int = 0
        private var y: Int = 0

        override fun transform(source: Bitmap): Bitmap {
            val size = Math.min(source.width, source.height)

            x = (source.width - size) / 2
            y = (source.height - size) / 2

            val squaredBitmap = Bitmap.createBitmap(source, x, y, size, size)
            if (squaredBitmap !== source) source.recycle()
            val bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)

            val canvas = Canvas(bitmap)
            val paint = Paint()
            val shader = BitmapShader(squaredBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP)
            paint.shader = shader
            paint.isAntiAlias = true

            val r = size / 2f
            canvas.drawCircle(r, r, r, paint)

            squaredBitmap.recycle()
            return bitmap
        }

        override fun key() = "circle(x=$x,y=$y)"
    }
}