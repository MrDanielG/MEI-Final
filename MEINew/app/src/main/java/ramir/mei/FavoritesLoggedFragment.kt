package ramir.mei

import android.app.ActivityOptions
import android.app.Fragment
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.squareup.picasso.Picasso
import com.squareup.picasso.Transformation
import kotlinx.android.synthetic.main.logged_rec_fragment.view.*
import kotlinx.android.synthetic.main.recom_card_sample.view.*

/**
 * Creado por Ramiro el 14/12/2017 a las 01:59 AM para MEINew.
 */
class FavoritesLoggedFragment : Fragment() {
    override fun onCreateView(inflaterI: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val rootView = inflaterI!!.inflate(R.layout.logged_favorites_fragment, container, false)

        val db = FavoriteDB(activity.baseContext)
        val col = FavoriteDB.DBCols()

        db.createDatabase()
        val c = db.getAllFavorites()

        while(c.moveToNext()){
            val urlFoto = c.getString(c.getColumnIndex(col.urlFoto))
            val Nombre = c.getString(c.getColumnIndex(col.nombre))
            val Uni = c.getString(c.getColumnIndex(col.uni))
            val Inst = c.getString(c.getColumnIndex(col.inst))
            val lat = c.getDouble(c.getColumnIndex(col.lat))
            val lng = c.getDouble(c.getColumnIndex(col.lng))
            val Id = c.getInt(c.getColumnIndex(col.id))

            activity.runOnUiThread{
                val inflater = LayoutInflater.from(activity.baseContext)
                val recCard : View = inflater.inflate(R.layout.recom_card_sample,rootView.recomLayout , false)

                Picasso.with(activity.baseContext).load(urlFoto).transform(object : Transformation {

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
                }).into(recCard.img_main_card_1)

                recCard.tv_card_main_1_title.text = Nombre
                recCard.tv_card_main1_subtitle2.text = Uni
                recCard.tv_card_main1_subtitle.text = Inst

                recCard.btn_card_main1_action1.setOnClickListener {
                    val intent = Intent(activity, CareerActivity::class.java)
                    intent.putExtra("img", urlFoto)
                    intent.putExtra("name", Nombre)
                    intent.putExtra("uni", Uni)
                    val p1 = android.util.Pair(recCard.img_main_card_1 as View , "recoImage")
                    val p2 = android.util.Pair(recCard.tv_card_main_1_title as View, "recoTitle")
                    activity.startActivity(intent, ActivityOptions.makeSceneTransitionAnimation(activity, p1, p2).toBundle())
                }

                recCard.btn_card_main1_action2.setOnClickListener{
                    val intent = Intent(activity, MapsActivity::class.java)
                    intent.putExtra("lat", lat)
                    intent.putExtra("lon", lng)
                    startActivity(intent)
                }

                Picasso.with(activity.baseContext).load(R.drawable.ic_favorite_action).into(recCard.img_main_card1_favorite)

                recCard.img_main_card1_favorite.setOnClickListener {
                    if(db.deleteFavoriteById(Id)){
                        Toast.makeText(activity.baseContext, "Se ha eliminado de favoritos.", Toast.LENGTH_SHORT).show()
                        Picasso.with(activity.baseContext).load(R.drawable.ic_favorite_border).into(recCard.img_main_card1_favorite)
                        recCard.visibility = View.GONE
                    }
                }

                rootView.recomLayout.addView(recCard)
            }
        }
        
        return rootView
    }
}