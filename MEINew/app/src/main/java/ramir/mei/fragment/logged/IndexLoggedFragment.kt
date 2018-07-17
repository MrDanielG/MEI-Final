package ramir.mei.fragment.logged

import android.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ramir.mei.R
import ramir.mei.Utils


/**
 * Creado por Ramiro el 22/11/2017 a las 07:18 PM para MEINew.
 */

class IndexLoggedFragment : Fragment() {
    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val rootView = inflater!!.inflate(R.layout.logged_index_fragment, container, false)
        val url = Utils().getMeiURL()

        return rootView
    }


}