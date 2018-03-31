package ramir.mei

import android.content.Context
import android.preference.PreferenceManager

/**
* Creado por Ramiro el 21/11/2017 a las 01:19 AM para MEINew.
*/

class GlobalVar{
    fun getMeiURL(activity : Context): String{
        var IP_MEI = ""
        val preferences = PreferenceManager.getDefaultSharedPreferences(activity)
        if(preferences.getString("IP_MEI", "") != ""){
            IP_MEI = preferences.getString("IP_MEI", "")
        }
        if (IP_MEI == "")
            return ""
       return "http://$IP_MEI/MEI-Final/MEI-Master/"
    }

    fun getJSIName():String{
        return "KOTLIN"
    }
}