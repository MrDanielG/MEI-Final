package com.example.ramir.meiv3;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
  Created by ramir on 19/03/2017.
 */

public class regis_fragment extends Fragment {
    private static final String ARG_SECTION_NUMBER = "section_number";
    boolean estadoErr;
    int valorEstado;
    String PagMadre = new GlobalVars().urlMEIMaster()+"signin.php";
    WebView MEIPage;
    EditText user, pass, pass2, name, last, edad;
    Spinner lugar;
    Button registro;

    public static regis_fragment newInstance(int sectionNumber){
        regis_fragment fragment = new regis_fragment();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
        View rootView = inflater.inflate(R.layout.fragment_regis,container,false);

        MEIPage = (WebView) rootView.findViewById(R.id.webviewr);
        user = (EditText) rootView.findViewById(R.id.et_r_email);
        pass = (EditText) rootView.findViewById(R.id.et_r_pass);
        pass2 = (EditText) rootView.findViewById(R.id.et_r_pass2);
        name = (EditText) rootView.findViewById(R.id.et_r_nombre);
        last = (EditText) rootView.findViewById(R.id.et_r_last);
        edad = (EditText) rootView.findViewById(R.id.et_r_edad);
        lugar = (Spinner) rootView.findViewById(R.id.et_r_lugar);
        registro = (Button) rootView.findViewById(R.id.btn_registro);

        lugar.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                estadoErr=false;
                valorEstado = i;
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                estadoErr = true;
            }
        });

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(getContext(),
                R.array.estados_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        lugar.setAdapter(adapter);

        WebSettings webSettings = MEIPage.getSettings();
        webSettings.setJavaScriptEnabled(true); //Settings de MEIPage
        webSettings.setDomStorageEnabled(true);

        MEIPage.addJavascriptInterface(new JavaScriptInterfaceRegis(getContext()), "REGIS");

        MEIPage.setWebViewClient(new WebViewClient() {});

        registro.setOnClickListener(new View.OnClickListener() {
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
                if(!pass.getText().toString().trim().matches(pass2.getText().toString().trim())){
                    pass2.setError("Las contraseñas no coinciden.");
                    error = false;
                }
                if (name.length()<1) {
                    name.setError("Ingrese un nombre.");
                    error = false;
                }
                if (last.length()<1) {
                    last.setError("Ingrese apellidos.");
                    error = false;
                }
                int edadV;
                try {
                    edadV = Integer.parseInt(edad.getText().toString());
                }catch (Exception e){
                    edadV = 9;
                }
                if (edadV < 10) {
                    edad.setError("Necesitas al menos 10 años para registrarte.");
                    error = false;
                }
                if(estadoErr){
                    TextView errorText = (TextView) lugar.getSelectedView();
                    errorText.setError("Seleccione una localidad.");
                    error = false;
                }
                if(error){
                    String nombre = name.getText().toString();
                    MEIPage.loadUrl("javascript:" +
                            "    var x = document.getElementsByTagName('input');" +
                            "    var op =  document.getElementsByTagName('option');" +
                            "    var form = document.getElementsByTagName('button')[0];" +
                            "    x[0].value='" + user.getText().toString() + "';" +
                            "    x[1].value='" + pass.getText().toString() + "';" +
                            "    x[2].value='" + pass2.getText().toString() + "';" +
                            "    x[3].value='" + nombre + "';" +
                            "    x[4].value='" + last.getText().toString() + "';" +
                            "    x[5].value=" + edad.getText().toString() + ";" +
                            "    op[" + (valorEstado + 1) + "].selected = true;" +
                            "    $(form).click();");
                }
            }
        });

        MEIPage.loadUrl(PagMadre);
        return rootView;
    }

    private boolean isValidPassword(String pass) {
        return pass != null && pass.length() >= 6;
    }

    private boolean isValidEmail(String email) {
        String EMAIL_PATTERN = getString(R.string.valid_email_pattern);

        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public class JavaScriptInterfaceRegis{
        Context context;

        JavaScriptInterfaceRegis(Context c){
            context = c;
        }

        @JavascriptInterface
        public void isRegis(){
            getActivity().runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(getContext(),"Se ha registrado exitosamente.", Toast.LENGTH_SHORT).show();
                    name.setText("");
                    last.setText("");
                    user.setText("");
                    pass.setText("");
                    pass2.setText("");
                    edad.setText("10");
                }
            });
        }

        @JavascriptInterface
        public void errorRegis(){
            getActivity().runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(getContext(),"Algo salió mal, es posible que el correo ya esté siendo utilizado.", Toast.LENGTH_SHORT).show();
                }
            });
        }
    }
}
