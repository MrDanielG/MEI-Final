package ramir.mei.activity

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.preference.PreferenceManager
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.View
import android.view.animation.AlphaAnimation
import android.view.animation.AnimationSet
import com.android.volley.DefaultRetryPolicy
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_main.*
import ramir.mei.R
import ramir.mei.Utils
import ramir.mei.fragment.notLogged.NotLogFragment

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val queue = Volley.newRequestQueue(this)
        val url = Utils().getMeiURL()

        Picasso.get().load("file:///android_asset/logo.png").into(logoLoading)

        val req = StringRequest(Request.Method.GET, url, Response.Listener {
            val fadeOut = AlphaAnimation(1f, 0f)
            fadeOut.startOffset = 1000
            fadeOut.duration = 200
            val animation = AnimationSet(true)
            animation.addAnimation(fadeOut)

            loadingLayout.animation = animation
            loadingLayout.visibility = View.GONE
            pb_main.visibility = View.GONE
            fragmentManager.beginTransaction().replace(R.id.frameContainer, NotLogFragment()).commit()
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
            pb_main.visibility = View.GONE
        })

        req.retryPolicy = DefaultRetryPolicy(5000,2,DefaultRetryPolicy.DEFAULT_BACKOFF_MULT)

        Handler().postDelayed({
            if(PreferenceManager.getDefaultSharedPreferences(this).getBoolean("login", false)){
                startActivity(Intent(this, LoggedActivity::class.java))
                finish()
            }else{
                queue.add(req)
                pb_main.visibility = View.GONE
            }
        }, 2000)
    }
}
