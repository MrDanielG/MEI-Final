package ramir.mei.activity

import android.animation.ArgbEvaluator
import android.animation.ObjectAnimator
import android.graphics.Bitmap
import android.graphics.Color
import android.os.Bundle
import android.support.v4.app.ActivityCompat
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.MenuItem
import android.view.View
import android.view.WindowManager
import android.view.animation.AlphaAnimation
import android.webkit.WebView
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.activity_career.*
import kotlinx.android.synthetic.main.carrer_content.*
import org.json.JSONArray
import ramir.mei.R
import ramir.mei.SQL.FavoriteDB
import ramir.mei.SQL.FavoriteData
import ramir.mei.Utils


class CareerActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_career)
        val url = Utils().getMeiURL()
        val density = resources.displayMetrics.density
        val queue = Volley.newRequestQueue(this)

        window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)

        title = ""
        val name = intent.getStringExtra("name")
        val uni = intent.getStringExtra("uni")
        val inst = intent.getStringExtra("inst")
        val Id = intent.getStringExtra("id")

        col_desc.isExpanded = false
        col_uni.isExpanded = false
        col_plan_est.isExpanded = false
        col_perf_egreso.isExpanded = false
        col_becas.isExpanded = false
        col_inter.isExpanded = false
        col_ref.isExpanded = false

        btn_uni.text = uni

        btn_desc.setOnClickListener { col_desc.toggle() }
        btn_uni.setOnClickListener { col_uni.toggle() }
        btn_plan_est.setOnClickListener { col_plan_est.toggle() }
        btn_perf_egreso.setOnClickListener { col_perf_egreso.toggle() }
        btn_becas.setOnClickListener { col_becas.toggle() }
        btn_inter.setOnClickListener { col_inter.toggle() }
        btn_ref.setOnClickListener { col_ref.toggle() }

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                careerLoad.visibility = View.INVISIBLE
                Log.e("asd", it)
                val response = JSONArray(it)
                val str = "<style>" +
                        "   a{text-decoration: none;color:#00DDFF;text-overflow: ellipsis;display: inline-block;max-width: 100%;overflow: hidden;white-space: nowrap;vertical-align: top} " +
                        "   body{margin:0px;}" +
                        "   .content{margin: 8px}" +
                        "</style>"
                for(i in 0 until response.length()){
                    when(i){
                        0 -> wv_desc
                        1 -> wv_uni
                        2 -> wv_plan_est
                        3 -> wv_perf_egreso
                        4 -> wv_becas
                        5 -> wv_inter
                        6 -> wv_ref
                        else -> WebView(this)
                    }.loadDataWithBaseURL(null,str+"<div class='content'>"+response[i].toString()+"</div>", "text/html", "utf-8", null)
                }

                id_career_content.visibility = View.VISIBLE
                val fadein = AlphaAnimation(0.0f, 1.0f)
                fadein.duration = 500
                id_career_content.startAnimation(fadein)
            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(baseContext),
                        "req" to "carrera",
                        "nombre" to name,
                        "uni" to uni,
                        "inst" to inst)
            }
        }

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

        queue.add(req)
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
        fab_scrolling.startAnimation(animationAlpha)
        id_career_content.visibility = View.GONE
        fab_scrolling.visibility = View.GONE
    }
}
