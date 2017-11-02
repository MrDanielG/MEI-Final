package com.example.ramir.meiv3;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * Created by ramir on 19/03/2017.
 */

public class login_fragment extends Fragment {
    private static final String ARG_SECTION_NUMBER = "section_number";

    public static login_fragment newInstance(int sectionNumber){
        login_fragment fragment = new login_fragment();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public login_fragment(){

    }

    public View onCreateView(final LayoutInflater inflater,final ViewGroup container, Bundle savedInstanceState){
        View rootView = inflater.inflate(R.layout.fragment_login,container,false);

        GlobalVars globalVars = new GlobalVars();
        String PagMadre = globalVars.urlMEIMaster();
        final WebView MEIPage = (WebView) rootView.findViewById(R.id.webview);
        final ProgressBar barra = (ProgressBar) rootView.findViewById(R.id.progressBar);
        final EditText user = (EditText) rootView.findViewById(R.id.et_email);
        final EditText pass = (EditText) rootView.findViewById(R.id.et_pass); //Declaraciones
        Button login = (Button) rootView.findViewById(R.id.btn_login);

        WebSettings webSettings = MEIPage.getSettings();
        webSettings.setJavaScriptEnabled(true); //Settings de MEIPage
        webSettings.setDomStorageEnabled(true);

        MEIPage.setWebChromeClient(new WebChromeClient(){ //ChromeClient para leer la consola de JS

            public boolean onConsoleMessage(ConsoleMessage cm) { //Listener
                String[] msg = cm.message().split("\\|"); //Guardo el mensaje en un array string
                Log.i("Mensaje", msg[0]); //Imprimo el mensaje en consola de Android Studio para debugeo

                if(Arrays.asList(msg).contains("sesion")) {
                    Log.i("Mensaje","Sesion start");
                    user.setText("");
                    pass.setText("");
                    Intent intent = new Intent(getActivity(), SesionActivity.class);
                    startActivity(intent);
                    getActivity().finish();
                }else if(Arrays.asList(msg).contains("false")){
                    Toast.makeText(getContext(),"Correo electrónico o contraseña incorrectos, por favor, intentelo de nuevo.", Toast.LENGTH_SHORT).show();
                    pass.setText("");
                }
                return true;
            }

        });

        MEIPage.setWebViewClient(new WebViewClient() {//Cliente para funciones del WebView

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) { //Cuando la pagina empieza a cargar
                barra.setVisibility(View.VISIBLE); //La barra se muestra
            }

            @Override
            public void onPageFinished(final WebView view, String url) { //Cuando la pagina se cargo ejecuta esto
                barra.setVisibility(View.GONE); //La barra se esconde

            }

        });


        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String email = user.getText().toString();
                final String passw = pass.getText().toString();
                Boolean error=true;
                if (!isValidEmail(email)) {
                    user.setError("Correo electrónico inválido.");
                    error = false;
                }
                if (!isValidPassword(passw)) {
                    pass.setError("Contraseña inválida.");
                    error = false;
                }

                if(error){
                    MEIPage.loadUrl("javascript:" +
                            "var usr = document.getElementById('input_usuario');" +
                            "var pass = document.getElementById('input_pass');" +
                            "var form = document.getElementsByTagName('form')[0];" +
                            "usr.value='" + user.getText().toString() + "';" +
                            "pass.value='" + pass.getText().toString() + "';" +
                            "form.submit();");
                }
            }
        });

        MEIPage.loadUrl(PagMadre);
        return rootView;
    }



    private boolean isValidPassword(String pass) {
        return pass != null && pass.length() > 6;
    }

    private boolean isValidEmail(String email) {
        String EMAIL_PATTERN = getResources().getString(R.string.valid_email_pattern);

        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
