package ramir.mei.activity

import android.content.Intent
import android.os.Bundle
import android.preference.PreferenceManager
import android.support.design.widget.NavigationView
import android.support.v4.view.GravityCompat
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.app_bar_logged_fragment.*
import kotlinx.android.synthetic.main.fragment_logged.*
import kotlinx.android.synthetic.main.nav_header_logged_fragment.view.*
import org.json.JSONObject
import ramir.mei.R
import ramir.mei.SQL.FavoriteDB
import ramir.mei.Utils
import ramir.mei.fragment.logged.*

/**
    val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
        try {
            val response = JSONObject(it)
        }catch (e:Exception){
            Log.e("asd", e.toString())
        }
    }, Response.ErrorListener {
        Log.e("asd", it.toString())
    }){
        override fun getParams(): MutableMap<String, String> {
            return hashMapOf("device" to "", "key" to Utils().getKey(baseContext))
        }
    }
 */
class LoggedActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.fragment_logged)
        setSupportActionBar(toolbar)
        val queue = Volley.newRequestQueue(this)
        val url = Utils().getMeiURL()
        val toggle = ActionBarDrawerToggle(
                this, drawer_layout, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close)
        drawer_layout.addDrawerListener(toggle)
        toggle.syncState()
        nav_view.setNavigationItemSelectedListener(this)

        val req = object : StringRequest(Request.Method.POST, url, Response.Listener {
            try {
                val response = JSONObject(it)
                val hView = nav_view.getHeaderView(0)

                Picasso.get().load(Utils().getMeiURL() + response.getString("0")).transform(Utils.CircleTransform()).into(hView.ivProfile)

                hView.tvName.text = response.getString("name") + " " + response.getString("last_name")
                hView.tvEmail.text = response.getString("email")

            }catch (e:Exception){
                Log.e("asd", e.toString())
            }
        }, Response.ErrorListener {
            Log.e("asd", it.toString())
        }){
            override fun getParams(): MutableMap<String, String> {
                return hashMapOf("device" to "",
                        "key" to Utils().getKey(baseContext),
                        "req" to "perfil")
            }
        }

        fragmentManager.beginTransaction().replace(R.id.loggedContent, IndexLoggedFragment()).commit()

        queue.add(req)
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
                    Toast.makeText(this@LoggedActivity, "No hay clientes para enviar correo electrónico instalados.", Toast.LENGTH_SHORT).show()
                }

            }
            R.id.nav_cerrarc -> {
                val db = FavoriteDB(this)
                db.deleteTable()
                PreferenceManager.getDefaultSharedPreferences(this@LoggedActivity).edit().clear().apply()
                startActivity(Intent(this,MainActivity::class.java))
                finish()
            }
        }

        drawer_layout.closeDrawer(GravityCompat.START)
        return true
    }
}
