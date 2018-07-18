package ramir.mei.fragment.logged

import android.app.ActivityOptions
import android.app.Fragment
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.logged_favorites_fragment.view.*
import kotlinx.android.synthetic.main.recom_card_sample.view.*
import ramir.mei.R
import ramir.mei.SQL.FavoriteDB
import ramir.mei.Utils
import ramir.mei.activity.CareerActivity
import ramir.mei.activity.MapsActivity

/**
 * Creado por Ramiro el 14/12/2017 a las 01:59 AM para MEINew.
 */
class FavoritesLoggedFragment : Fragment() {
    data class RecomendationData(val Nombre: String,val Uni: String,val urlFoto: String,val Inst: String,val Id : String,val lat: Double,val lng: Double,val sueldo : String)
    val RecomendationList = ArrayList<RecomendationData>()

    override fun onCreateView(inflaterI: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val rootView = inflaterI!!.inflate(R.layout.logged_favorites_fragment, container, false)
        val db = FavoriteDB(activity)
        rootView.favLayout.adapter = RecomendationAdapter(RecomendationList, db)
        rootView.favLayout.layoutManager = LinearLayoutManager(activity)
        val col = FavoriteDB.DBCols()

        db.createDatabase()

        val c = db.getAllFavorites()

        while(c.moveToNext()){
            val urlFoto = c.getString(c.getColumnIndex(col.urlFoto))
            val Nombre = c.getString(c.getColumnIndex(col.nombre))
            val Uni = c.getString(c.getColumnIndex(col.uni))
            val Inst = c.getString(c.getColumnIndex(col.inst))
            val Sueldo = c.getString(c.getColumnIndex(col.sueldo))
            val lat = c.getDouble(c.getColumnIndex(col.lat))
            val lng = c.getDouble(c.getColumnIndex(col.lng))
            val Id = c.getString(c.getColumnIndex(col.id))

            RecomendationList.add(RecomendationData(Nombre,Uni,urlFoto,Inst,Id,lat, lng,Sueldo))
        }
        rootView.favLayout.adapter.notifyDataSetChanged()
        rootView.favLayout.scheduleLayoutAnimation()

        return rootView
    }

    inner class RecomendationAdapter constructor(private val preguntasList: List<RecomendationData>, private val db : FavoriteDB) : RecyclerView.Adapter<RecomendationAdapter.ViewHolder>() {
        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
            return ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.recom_card_sample, parent,false))
        }

        override fun getItemCount(): Int {
            return preguntasList.size
        }

        override fun onBindViewHolder(holder: ViewHolder, position: Int) {
            val data = preguntasList[position]

            if(position == 0){
                val layoutParams = LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
                layoutParams.setMargins(Utils().dpToPixel(resources, 8), Utils().dpToPixel(resources, 7), Utils().dpToPixel(resources, 8), Utils().dpToPixel(resources, 7))
                holder.viewHolder.layoutParams = layoutParams
            }

            Picasso.get().load(data.urlFoto).transform(object : Transformation {

                override fun transform(source: Bitmap): Bitmap {
                    val targetHeight = 800
                    val aspectRatio = source.width.toDouble() / source.height.toDouble()
                    val targetWidth = (targetHeight * aspectRatio).toInt()
                    val result = Bitmap.createScaledBitmap(source, targetWidth, targetHeight, false)
                    if (result != source) {
                        source.recycle()
                    }
                    return result
                }

                override fun key(): String = "cropPosterTransformation720"
            }).into(holder.cardImage)

            holder.tituloText.text = data.Nombre
            holder.sueldoText.text = data.sueldo
            holder.uniText.text = data.Uni
            holder.institText.text = data.Inst

            Picasso.get().load(R.drawable.ic_favorite_action).into(holder.favoriteBtn)

            holder.infoBtn.setOnClickListener {
                val intent = Intent(activity, CareerActivity::class.java)
                intent.putExtra("img", data.urlFoto)
                intent.putExtra("name", data.Nombre)
                intent.putExtra("uni", data.Uni)
                intent.putExtra("inst", data.Inst)
                intent.putExtra("sueldo", data.sueldo)
                intent.putExtra("id", data.Id)
                intent.putExtra("lat", data.lat)
                intent.putExtra("lng", data.lng)
                val p1 = android.util.Pair(holder.cardImage as View , "recoImage")
                val p2 = android.util.Pair(holder.infoBtn as View, "recoTitle")
                activity.startActivity(intent, ActivityOptions.makeSceneTransitionAnimation(activity, p1, p2).toBundle())
            }

            holder.locationBtn.setOnClickListener{
                val intent = Intent(activity, MapsActivity::class.java)
                intent.putExtra("lat", data.lat)
                intent.putExtra("lon", data.lng)
                startActivity(intent)
            }

            holder.favoriteBtn.setOnClickListener {
                if(db.deleteFavoriteById(data.Id)){
                    Toast.makeText(activity, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                    RecomendationList.remove(data)
                    this.notifyDataSetChanged()
                }else{
                    Toast.makeText(activity, "Ocurrio un error al eliminar.", Toast.LENGTH_SHORT).show()
                }
            }
        }

        inner class ViewHolder constructor(v: View): RecyclerView.ViewHolder(v) {
            var viewHolder = View(this@FavoritesLoggedFragment.activity)
            var favoriteBtn = ImageView(this@FavoritesLoggedFragment.activity)
            var locationBtn = Button(this@FavoritesLoggedFragment.activity)
            var infoBtn = Button(this@FavoritesLoggedFragment.activity)
            var cardImage = ImageView(this@FavoritesLoggedFragment.activity)
            var sueldoText = TextView(this@FavoritesLoggedFragment.activity)
            var tituloText = TextView(this@FavoritesLoggedFragment.activity)
            var uniText = TextView(this@FavoritesLoggedFragment.activity)
            var institText = TextView(this@FavoritesLoggedFragment.activity)

            init {
                viewHolder = v
                infoBtn = v.btn_card_main1_action1
                locationBtn = v.btn_card_main1_action2
                favoriteBtn = v.img_main_card1_favorite
                cardImage = v.img_main_card_1
                sueldoText = v.tv_card_main1_sueldo
                tituloText = v.tv_card_main_1_title
                uniText = v.tv_card_main1_subtitle2
                institText = v.tv_card_main1_subtitle
            }
        }
    }
}