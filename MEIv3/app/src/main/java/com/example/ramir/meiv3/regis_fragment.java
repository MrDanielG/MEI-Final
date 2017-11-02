package com.example.ramir.meiv3;

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
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
  Created by ramir on 19/03/2017.
 */

public class regis_fragment extends Fragment {
    private static final String ARG_SECTION_NUMBER = "section_number";

    public static regis_fragment newInstance(int sectionNumber){
        regis_fragment fragment = new regis_fragment();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public regis_fragment(){

    }

    boolean estadoErr;
    String valorEstado;

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState){
        View rootView = inflater.inflate(R.layout.fragment_regis,container,false);
        GlobalVars globalVars = new GlobalVars();
        final String PagMadre = globalVars.urlMEIMaster()+"Registro/";
        final WebView MEIPage = (WebView) rootView.findViewById(R.id.webviewr);
        final EditText user = (EditText) rootView.findViewById(R.id.et_r_email);
        final EditText pass = (EditText) rootView.findViewById(R.id.et_r_pass);
        final EditText pass2 = (EditText) rootView.findViewById(R.id.et_r_pass2);
        final EditText name = (EditText) rootView.findViewById(R.id.et_r_nombre);
        final EditText last = (EditText) rootView.findViewById(R.id.et_r_last);
        final EditText edad = (EditText) rootView.findViewById(R.id.et_r_edad);
        final Spinner lugar = (Spinner) rootView.findViewById(R.id.et_r_lugar);
        Button registro = (Button) rootView.findViewById(R.id.btn_registro);
        lugar.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                estadoErr=false;
                valorEstado = adapterView.getItemAtPosition(i).toString();
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

        MEIPage.setWebViewClient(new WebViewClient() {});

        MEIPage.setWebChromeClient(new WebChromeClient(){ //ChromeClient para leer la consola de JS

            public boolean onConsoleMessage(ConsoleMessage cm) { //Listener
                String[] msg = cm.message().split("\\|"); //Guardo el mensaje en un array string

                if(Arrays.asList(msg).contains("true")) {
                    Toast.makeText(getContext(),"Se ha registrado exitosamente.", Toast.LENGTH_SHORT).show();
                    name.setText("");
                    last.setText("");
                    user.setText("");
                    pass.setText("");
                    pass2.setText("");
                    edad.setText("0");
                }else if(Arrays.asList(msg).contains("false")){
                    Toast.makeText(getContext(),"Algo salió mal, intentelo de nuevo.", Toast.LENGTH_SHORT).show();
                }
                MEIPage.loadUrl(PagMadre);
                return true;
            }

        });


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

                if (Integer.parseInt(edad.getText().toString()) < 10) {
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
                            "    var x = document.getElementsByTagName('INPUT');" +
                            "    var form = document.getElementsByTagName('form')[0];" +
                            "    x[0].value='" + user.getText().toString() + "';" +
                            "    x[1].value='" + pass.getText().toString() + "';" +
                            "    x[2].value='" + nombre + "';" +
                            "    x[3].value='" + last.getText().toString() + "';" +
                            "    x[4].value=" + edad.getText().toString() + ";" +
                            "    x[5].value='" + valorEstado + "';" +
                            "    form.submit();");
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
        String EMAIL_PATTERN = getString(R.string.valid_email_pattern);

        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
