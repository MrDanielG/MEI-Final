package ramir.mei

import android.app.ProgressDialog
import android.content.Intent
import android.graphics.*
import android.os.Bundle
import android.preference.PreferenceManager
import android.support.design.widget.NavigationView
import android.support.v4.view.GravityCompat
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.webkit.JavascriptInterface
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Toast
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.app_bar_logged_fragment.*
import kotlinx.android.synthetic.main.fragment_logged.*
import kotlinx.android.synthetic.main.nav_header_logged_fragment.view.*



class LoggedFragment : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {
    private var mURL : String = ""
    private val mJSIName : String = Utils().getJSIName()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.fragment_logged)
        setSupportActionBar(toolbar)
        mURL = Utils().getMeiURL()+"MEI/index.php"

        val toggle = ActionBarDrawerToggle(
                this, drawer_layout, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close)
        drawer_layout.addDrawerListener(toggle)
        toggle.syncState()

        fragmentManager.beginTransaction().add(R.id.loggedContent, IndexLoggedFragment()).commit()

        val mMEIPage = WebView(baseContext)

        mMEIPage.webViewClient = WebViewClient()
        mMEIPage.settings.javaScriptEnabled = true
        mMEIPage.settings.domStorageEnabled = true
        mMEIPage.addJavascriptInterface(JSI(), mJSIName)

        mMEIPage.loadUrl(mURL)

        nav_view.setNavigationItemSelectedListener(this)
    }

    override fun onBackPressed() {
        if (drawer_layout.isDrawerOpen(GravityCompat.START)) {
            drawer_layout.closeDrawer(GravityCompat.START)
        } else {
            super.onBackPressed()
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return super.onOptionsItemSelected(item)
    }

    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        // Handle navigation view item clicks here.
        when (item.itemId) {
            R.id.nav_inicio -> {
                fragmentManager.beginTransaction().replace(R.id.loggedContent, IndexLoggedFragment()).commit()
                title = "Página principal"
            }
            R.id.nav_test -> {
                fragmentManager.beginTransaction().replace(R.id.loggedContent, TestLoggedFragment()).commit()
                title = "Test"
            }
            R.id.nav_perfil -> {
                fragmentManager.beginTransaction().replace(R.id.loggedContent, ProfileLoggedFragment()).commit()
                title = "Perfil"
            }
            R.id.nav_recomendaciones -> {
                fragmentManager.beginTransaction().replace(R.id.loggedContent, RecomendationLoggedFragment()).commit()
                title = "Recomendaciones"
            }
            R.id.nav_favs -> {
                fragmentManager.beginTransaction().replace(R.id.loggedContent, FavoritesLoggedFragment()).commit()
                title = "Favoritos"
            }
            R.id.nav_contacto -> {
                val i = Intent(Intent.ACTION_SEND)
                i.type = "message/rfc822"
                i.putExtra(Intent.EXTRA_EMAIL, arrayOf("ramiroestradag@gmail.com"))
                i.putExtra(Intent.EXTRA_SUBJECT, "Mi Escuela Ideal")

                try {
                    startActivity(Intent.createChooser(i, "Enviar correo electrónico..."))
                } catch (ex: android.content.ActivityNotFoundException) {
                    Toast.makeText(this@LoggedFragment, "No hay clientes para enviar correo electrónico instalados.", Toast.LENGTH_SHORT).show()
                }

            }
            R.id.nav_cerrarc -> {
                val db = FavoriteDB(baseContext)
                db.deleteTable()
                val editor = PreferenceManager.getDefaultSharedPreferences(this@LoggedFragment).edit()
                editor.clear()
                editor.apply()
                val logout = WebView(baseContext)
                val progressDialog = ProgressDialog(this@LoggedFragment)
                progressDialog.setMessage("Cerrando sesión...")
                progressDialog.show()
                logout.webViewClient = object : WebViewClient(){
                    override fun onPageFinished(view: WebView?, url: String?) {
                        startActivity(Intent(baseContext, MainActivity::class.java))
                        finish()
                        super.onPageFinished(view, url)
                    }
                }
                logout.loadUrl(Utils().getMeiURL()+"MEI/logout.php")
            }
        }

        drawer_layout.closeDrawer(GravityCompat.START)
        return true
    }

    private inner class JSI {
        @JavascriptInterface
        fun navBar(img : String, name:String, email:String){
            runOnUiThread {
                val navigationView = nav_view
                val hView = navigationView.getHeaderView(0)

                Picasso.with(baseContext).load(mURL + "/../../resourses/profile_pics/" + img).transform(CircleTransform()).into(hView.ivProfile)

                Log.e("Img", mURL + "/../resourses/profile_pics/" + img)

                hView.tvName.text = name
                hView.tvEmail.text = email
            }
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
