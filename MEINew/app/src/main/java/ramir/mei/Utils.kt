package ramir.mei

import android.content.Context
import android.content.res.Resources
import android.graphics.*
import android.preference.PreferenceManager
import android.view.View
import android.view.ViewGroup
import android.view.animation.AlphaAnimation
import android.view.animation.Animation
import android.view.animation.ScaleAnimation
import com.squareup.picasso.Transformation
import java.util.regex.Pattern
import kotlin.math.absoluteValue

/**
* Creado por Ramiro el 21/11/2017 a las 01:19 AM para MEINew.
*/

class Utils{
    fun getMeiURL() = "http://192.168.1.82/MEI-Final/MEI-Master/api/api.php"

    fun dpToPixel(resources: Resources, dp : Int) : Int{
        return (resources.displayMetrics.density * dp).toInt()
    }

    fun generateRecomId(lat : Double,lng: Double,name: String, uni : String, inst : String) : Int{
        return (lat.toInt() + lng.toInt() + name.hashCode() + uni.hashCode() + inst.hashCode()).absoluteValue
    }

    fun expand(v: View) {
        v.measure(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        val targetHeight = v.measuredHeight

        // Older versions of android (pre API 21) cancel animations for views with a height of 0.
        v.layoutParams.height = 1
        v.visibility = View.VISIBLE

        val a = object : Animation() {
            override fun applyTransformation(interpolatedTime: Float, t: android.view.animation.Transformation) {
                super.applyTransformation(interpolatedTime, t)
                v.layoutParams.height = if (interpolatedTime == 1f)
                    ViewGroup.LayoutParams.WRAP_CONTENT
                else
                    (targetHeight * interpolatedTime).toInt()
                v.requestLayout()
            }

            override fun willChangeBounds(): Boolean {
                return true
            }
        }

        // 1dp/ms
        a.duration = (targetHeight / v.context.resources.displayMetrics.density).toInt().toLong()
        v.startAnimation(a)
    }

    fun collapse(v: View) {
        val initialHeight = v.measuredHeight

        val a = object : Animation() {
            override fun applyTransformation(interpolatedTime: Float, t: android.view.animation.Transformation) {
                if (interpolatedTime == 1f) {
                    v.visibility = View.GONE
                } else {
                    v.layoutParams.height = initialHeight - (initialHeight * interpolatedTime).toInt()
                    v.requestLayout()

                }
            }

            override fun willChangeBounds(): Boolean {
                return true
            }
        }

        // 1dp/ms
        a.duration = (initialHeight / v.context.resources.displayMetrics.density).toInt().toLong()
        v.startAnimation(a)
    }

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

    fun isValidPassword(pass: String?) = (pass != null && pass.length >= 6)

    fun isValidEmail(email: String, resources: Resources): Boolean {
        val regex = resources.getString(R.string.valid_email_pattern)

        val pattern = Pattern.compile(regex)
        val matcher = pattern.matcher(email)
        return matcher.matches()
    }

    fun getKey(context: Context) = PreferenceManager.getDefaultSharedPreferences(context).getString("key", "")

    class CircleTransform : Transformation {

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