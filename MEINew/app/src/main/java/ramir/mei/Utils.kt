package ramir.mei

import android.content.Context
import android.content.res.Resources
import android.graphics.*
import android.preference.PreferenceManager
import com.squareup.picasso.Transformation
import java.util.regex.Pattern

/**
* Creado por Ramiro el 21/11/2017 a las 01:19 AM para MEINew.
*/

class Utils{
    fun getMeiURL() = "http://192.168.1.71/MEI-Final/MEI-Master/api/"

    fun getJSIName():String{
        return "KOTLIN"
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