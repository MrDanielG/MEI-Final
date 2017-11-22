package com.example.ramir.meiv3;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * Created by ramir on 19/03/2017.
 */

public class login_fragment extends Fragment {
    private static final String ARG_SECTION_NUMBER = "section_number";
    private String TAG = "Login Activity";
    private String PagMadre = new GlobalVars().urlMEIMaster()+"login.php";
    private WebView MEIPage;
    private ProgressBar barra;
    private EditText user,pass;
    private LinearLayout linearLayout;
    private ImageView logo;

    public static login_fragment newInstance(int sectionNumber){
        login_fragment fragment = new login_fragment();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public View onCreateView(final LayoutInflater inflater, final ViewGroup container, Bundle savedInstanceState){
        View rootView = inflater.inflate(R.layout.fragment_login,container,false);

        MEIPage = (WebView) rootView.findViewById(R.id.webview);
        barra = (ProgressBar) rootView.findViewById(R.id.progressBar);
        user = (EditText) rootView.findViewById(R.id.et_email);
        pass = (EditText) rootView.findViewById(R.id.et_pass); //Declaraciones
        Button login = (Button) rootView.findViewById(R.id.btn_login);
        linearLayout = (LinearLayout) rootView.findViewById(R.id.til);
        logo = (ImageView) rootView.findViewById(R.id.logoView);

        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Picasso.with(getContext()).load(PagMadre+"/../imgs/logo1.png").into(logo);
            }
        });

        WebSettings webSettings = MEIPage.getSettings();
        webSettings.setJavaScriptEnabled(true); //Settings de MEIPage
        webSettings.setDomStorageEnabled(true);

        MEIPage.addJavascriptInterface(new JavaScriptInterface(getContext()), "KOTLIN");

        MEIPage.setWebViewClient(new WebViewClient() {//Cliente para funciones del WebView

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) { //Cuando la pagina empieza a cargar
                barra.setVisibility(View.VISIBLE); //La barra se muestra
            }

            @Override
            public void onPageFinished(final WebView view, String url) { //Cuando la pagina se cargo ejecuta esto
                barra.setVisibility(View.GONE); //La barra se esconde
                linearLayout.setVisibility(View.VISIBLE);
            }

        });
        MEIPage.setWebChromeClient(new WebChromeClient(){ //ChromeClient para leer la consola de JS

            public boolean onConsoleMessage(ConsoleMessage cm) {
                Log.i(TAG, cm.message());
                return true;
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
                            "usr.value='" + user.getText().toString() + "';" +
                            "pass.value='" + pass.getText().toString() + "';" +
                            "$('#btn_submit').click();");
                }
            }
        });

        MEIPage.loadUrl(PagMadre);
        return rootView;
    }

    private class JavaScriptInterface{
        Context context;

        JavaScriptInterface(Context c) {
            context = c;
        }

        @JavascriptInterface
        public void pageLoaded(int i){
            if(i == 2){
                getActivity().runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        user.setText("");
                        pass.setText("");
                        startActivity(new Intent(getActivity(), SesionActivity.class));
                        getActivity().finish();
                    }
                });
            }
        }

        @JavascriptInterface
        public void loginError(){
            Toast.makeText(getContext(),"Correo electrónico o contraseña incorrectos, por favor, intentelo de nuevo.", Toast.LENGTH_SHORT).show();
            pass.setText("");
        }
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
