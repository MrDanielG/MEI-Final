package ramir.mei

import android.content.Context
import android.database.Cursor
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.provider.BaseColumns



/**
 * Creado por Ramiro el 13/12/2017 a las 11:30 PM para MEINew.
 */
class FavoriteDB constructor(c: Context) : SQLiteOpenHelper(c, "favorite.db", null,1) {
    val col = DBCols()

    data class DBCols(val tableName : String = "favoritos",
                      val _id : String = "_id",
                      val id : String = "id",
                      val urlFoto : String = "urlFoto",
                      val nombre : String = "nombre",
                      val sueldo : String = "sueldo",
                      val uni : String = "uni",
                      val inst : String = "inst",
                      val lat : String = "lat",
                      val lng : String = "lng") : BaseColumns

    override fun onCreate(p0: SQLiteDatabase?) {

    }

    fun createDatabase(){
        val p0 = writableDatabase

        try {
            p0.execSQL("CREATE TABLE " + col.tableName + " ("
                    + col._id + " INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + col.id + " INTEGER NOT NULL,"
                    + col.urlFoto + " TEXT NOT NULL,"
                    + col.nombre + " TEXT NOT NULL,"
                    + col.sueldo + " TEXT NOT NULL,"
                    + col.uni + " TEXT NOT NULL,"
                    + col.inst + " TEXT NOT NULL,"
                    + col.lat + " DOUBLE NOT NULL,"
                    + col.lng + " DOUBLE NOT NULL)")
        }catch (e : Exception){

        }
    }

    fun getFavoriteById(id : Int) : Cursor{
        return readableDatabase.query(col.tableName,
                null,
                col.id + " LIKE ?",
                arrayOf(id.toString()), null, null, null)
    }

    fun deleteFavoriteById(Id : Int) : Boolean{
        val p0 = writableDatabase

        try {
            p0.execSQL("DELETE FROM "+ col.tableName +" WHERE id = "+Id)
            return true
        }catch (e : Exception){
            return false
        }
    }

    fun deleteTable(){
        val p0 = writableDatabase

        try {
            p0.execSQL("DROP TABLE IF EXISTS "+col.tableName)
        }catch (e : Exception){

        }
    }

    fun getAllFavorites() : Cursor{
        return readableDatabase.query(col.tableName,
                        null,
                        null,
                        null,
                        null,
                        null,
                        null);
    }

    fun addFavorites(data : FavoriteData) : Boolean{
        val p0 = writableDatabase

        return try {
            p0.insert(col.tableName, null, data.toContentValues())
            true
        }catch (e : Exception){
            false
        }
    }

    override fun onUpgrade(p0: SQLiteDatabase?, p1: Int, p2: Int) {
        //TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}