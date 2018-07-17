package ramir.mei.fragment.notLogged

import android.app.Fragment
import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ramir.mei.R

class NotLogFragment : Fragment() {
    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?, savedInstanceState: Bundle?): View {
        val view : View = inflater!!.inflate(R.layout.fragment_not_log, container, false)
        view.findViewById<BottomNavigationView>(R.id.navigation).setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener)
        childFragmentManager.beginTransaction().add(R.id.loginContainer, LoginFragment()).commit()
        return view
    }

    private val mOnNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.navigation_home -> {
                childFragmentManager.beginTransaction().replace(R.id.loginContainer, LoginFragment()).commit()
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_dashboard -> {
                childFragmentManager.beginTransaction().replace(R.id.loginContainer, RegistroFragment()).commit()
                return@OnNavigationItemSelectedListener true
            }
        }
        false
    }
}
