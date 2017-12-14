package ramir.mei

import android.content.ContentValues


/**
 * Creado por Ramiro el 14/12/2017 a las 12:00 AM para MEINew.
 */
class FavoriteData {
    var id : Int = 0
    var nombre : String = "nombre"
    var urlFoto : String = "url"
    var uni : String = "uni"
    var inst : String = "inst"
    var lat : Double = 0.0
    var lng : Double = 0.0

    fun toContentValues(): ContentValues {
        val col = FavoriteDB.DBCols()

        val values = ContentValues()
        values.put(col.id, id)
        values.put(col.urlFoto, urlFoto)
        values.put(col.nombre, nombre)
        values.put(col.uni, uni)
        values.put(col.inst, inst)
        values.put(col.lat, lat)
        values.put(col.lng, lng)

        return values
    }
}