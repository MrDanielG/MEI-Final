package com.example.ramir.meiv3;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;
import com.squareup.picasso.Transformation;

import java.util.Arrays;

public class SesionActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    GlobalVars globalVars = new GlobalVars();
    String PagMadre = globalVars.urlMEIMaster()+"MEI/";
    WebView mei;
    ImageView publicidad, portada, foto, univ_foto;
    TextView tvUniv,tvCarrer,tvDesrip,tvPlan,tvInterc,tvPerfilE,tvArea, tvResultado,tvResultado_detalles,tvNombreUsuario,tvCorreo,tvBecas, tvInst;
    RelativeLayout rlempty, rloffline, rlResultados;
    LinearLayout lyreco, lytest, lytestvoca, lyPerfil, lyTablaTest, lyTablaFecha, lyTablaResu;
    ScrollView lyinicio,sv_reco,sv_test,sv_testvoca,sv_perfil,sv_carrera;
    ProgressBar PageLoad;
    Button redirect,btEnviar, btRecomendacion;
    Integer num_radio=0, Rbindex=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.e("pag",PagMadre);
        setContentView(R.layout.activity_sesion);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        setTitle("Inicio");

        /*Web views*/
        mei = (WebView) findViewById(R.id.mei_sesion);
        PageLoad = (ProgressBar) findViewById(R.id.progressBar3);

        /*Text views*/
        tvUniv= (TextView) findViewById(R.id.id_univ);
        tvCarrer= (TextView) findViewById(R.id.id_carrera);
        tvDesrip= (TextView) findViewById(R.id.id_descrip);
        tvPlan= (TextView) findViewById(R.id.id_plan);
        tvInterc= (TextView) findViewById(R.id.id_intercambios);
        tvPerfilE= (TextView) findViewById(R.id.id_perfil_egreso);
        tvArea= (TextView) findViewById(R.id.id_area);
        tvResultado = (TextView) findViewById(R.id.id_resultado);
        tvResultado_detalles = (TextView) findViewById(R.id.id_resu_detalles);
        tvNombreUsuario = (TextView) findViewById(R.id.perfil_usuario);
        tvCorreo = (TextView) findViewById(R.id.perfil_correo);
        tvBecas = (TextView) findViewById(R.id.id_becas);
        tvInst = (TextView) findViewById(R.id.id_inst);

        /*Scroll views*/
        lyinicio = (ScrollView) findViewById(R.id.InicioLayout);
        sv_reco = (ScrollView) findViewById(R.id.sv_reco);
        sv_testvoca =(ScrollView) findViewById(R.id.sv_testvoca);
        sv_test = (ScrollView) findViewById(R.id.sv_test);
        sv_perfil = (ScrollView) findViewById(R.id.sv_perfil);
        sv_carrera = (ScrollView) findViewById(R.id.sv_carrera);

        /*Relative layouts*/
        rlempty = (RelativeLayout) findViewById(R.id.rl_empty);
        rloffline = (RelativeLayout) findViewById(R.id.rl_offline);
        rlResultados = (RelativeLayout) findViewById(R.id.rl_resultado_test);

        /*Botones*/
        redirect = (Button) findViewById(R.id.btredirect);
        btEnviar = (Button) findViewById(R.id.enviarbt);
        btRecomendacion = (Button) findViewById(R.id.bt_Recomendaciones);

        /*Linear Layouts*/
        lyreco = (LinearLayout) findViewById(R.id.RecomLayout);
        lytest = (LinearLayout) findViewById(R.id.TestLayout);
        lytestvoca = (LinearLayout) findViewById(R.id.ly_testvoca);
        lyPerfil = (LinearLayout) findViewById(R.id.ly_perfil);
        lyTablaFecha = (LinearLayout) findViewById(R.id.tablaFecha);
        lyTablaResu = (LinearLayout) findViewById(R.id.tablaResu);
        lyTablaTest = (LinearLayout) findViewById(R.id.tablaTest);

        /*Image views*/
        foto = (ImageView) findViewById(R.id.perfil_foto);
        portada = (ImageView) findViewById(R.id.perfil_portada);
        publicidad = (ImageView) findViewById(R.id.publicidad);
        univ_foto = (ImageView) findViewById(R.id.univ_foto);

        /*Web views settings*/
        WebSettings webSettings = mei.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDomStorageEnabled(true);

        /*---------------------------------Web view Client----------------------------------*/
        mei.setWebViewClient(new WebViewClient(){
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);

                lyreco.removeAllViews();
                lytestvoca.removeAllViews();
                lytest.removeAllViews();
                lyTablaFecha.removeAllViews();
                lyTablaResu.removeAllViews();
                lyTablaTest.removeAllViews();

                sv_testvoca.setVisibility(View.GONE);
                sv_perfil.setVisibility(View.GONE);
                sv_carrera.setVisibility(View.GONE);
                lyinicio.setVisibility(View.GONE);
                sv_reco.setVisibility(View.GONE);
                sv_test.setVisibility(View.GONE);

                rlempty.setVisibility(View.GONE);
                rloffline.setVisibility(View.GONE);
                rlResultados.setVisibility(View.GONE);

                PageLoad.setVisibility(View.VISIBLE);
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                setTitle(mei.getTitle());
                PageLoad.setVisibility(View.GONE);
                sv_carrera.scrollTo(0,0);
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                super.onReceivedError(view, request, error);
                rloffline.setVisibility(View.VISIBLE);
                Log.e("MenError", error.toString());
                final Handler handler = new Handler();
                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        setTitle("Sin conexion");
                    }
                },20);
            }
        });


        /*-----------------------------------Chrome client-----------------------------------*/
        mei.setWebChromeClient(new WebChromeClient(){ //ChromeClient para leer la consola de JS

            public boolean onConsoleMessage(ConsoleMessage cm) { //Listener
                String[] msg = {};
                try {
                    msg = cm.message().split("\\|"); //Guardo el mensaje en un array string
                }catch (Exception e) {
                    Log.e("SesionConsole", e.toString());
                }
                Log.i("MensajeSesion", msg[0]);
                if(Arrays.asList(msg).contains("sesion")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:" +
                                    "   var el = document.getElementById('dataUser');" +
                                    "   var img = el.dataset.picture;" +
                                    "   var name = el.dataset.name;" +
                                    "   var email = el.dataset.email;" +
                                    "   window.HTMLOUT.navbar(img,name,email);");
                        }
                    }, 200);

                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            lyinicio.setVisibility(View.VISIBLE);
                        }
                    }, 300);
                } else if(Arrays.asList(msg).contains("recomendaciones")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:window.onload = rec;" +
                                    "function rec(){" +
                                    "var carrera = document.getElementsByClassName('reco_carrera');" +
                                    "var uni = document.getElementsByClassName('reco_universidad');" +
                                    "var info = document.getElementsByClassName('reco_info');" +
                                    "var maps = document.getElementsByClassName('reco_maps');" +
                                    "var foto = document.getElementsByClassName('reco_foto');" +
                                    "if(carrera.length){" +
                                    "for(var i = 0 ; i < carrera.length ; ++i)" +
                                    "   window.HTMLOUT.recomienda(carrera[i].innerText,uni[i].innerText,info[i].href, i , foto[i].dataset.content);" +
                                    "}else{" +
                                    "   window.HTMLOUT.empty();" +
                                    "}}");
                        }
                    }, 0);
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            sv_reco.setVisibility(View.VISIBLE);
                        }
                    }, 300);
                } else if(Arrays.asList(msg).contains("resultados")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:" +
                                    "window.HTMLOUT.test_result(document.getElementById('resu').innerText);" +
                                    "window.HTMLOUT.test_result_detalles(document.getElementById('resu_info').innerHTML)");
                        }
                    }, 200);
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            rlResultados.setVisibility(View.VISIBLE);
                        }
                    }, 300);
                } else if(Arrays.asList(msg).contains("carrera")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:" +
                                    "var info = document.getElementsByClassName('carrera');" +
                                    "window.HTMLOUT.carrerafoto(document.getElementsByClassName('carrera_img')[0].src);" +
                                    "for(var i = 0 ; i < info.length ; ++i){" +
                                    "   window.HTMLOUT.carrerainfo(info[i].innerText,i);" +
                                    "}");
                        }
                    }, 200);

                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            sv_carrera.setVisibility(View.VISIBLE);
                        }
                    }, 400);
                } else if(Arrays.asList(msg).contains("test")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:" +
                                    "var tests = document.getElementsByClassName('test');" +
                                    "for(var i = 0 ; i < tests.length ; ++i)" +
                                    "   window.HTMLOUT.test(tests[i].innerText,tests[i].href);");
                        }
                    }, 200);
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            sv_test.setVisibility(View.VISIBLE);
                        }
                    }, 300);
                } else if(Arrays.asList(msg).contains("testvoca")) {
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            mei.loadUrl("javascript:" +
                                    "var pregdiv = document.getElementsByClassName('pregs');" +
                                    "var radioB = document.getElementsByClassName('option');" +
                                    "window.HTMLOUT.numradio(radioB.length);" +
                                    "for(var i = 0 ; i < pregdiv.length ; ++i){" +
                                    "   window.HTMLOUT.pregunta(pregdiv[i].getElementsByClassName('preg')[0].innerText);" +
                                    "   window.HTMLOUT.radioGCreate();" +
                                    "   var radioBs = pregdiv[i].getElementsByClassName('option');" +
                                    "   for(var e = 0 ; e < radioBs.length ; ++e){" +
                                    "       window.HTMLOUT.radioCreate(radioBs[e].innerText);" +
                                    "   }" +
                                    "   window.HTMLOUT.separador();" +
                                    "}");
                        }
                    }, 200);
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            sv_testvoca.setVisibility(View.VISIBLE);
                        }
                    }, 300);
                } else if(Arrays.asList(msg).contains("mapa")){
                    Intent intent = new Intent(SesionActivity.this, MapsActivity.class);
                    intent.putExtra("lat",Double.parseDouble(msg[1]));
                    intent.putExtra("lon",Double.parseDouble(msg[2]));
                    startActivity(intent);
                    mei.loadUrl(PagMadre+"recomendaciones.php");
                } else if(Arrays.asList(msg).contains("perfil")){
                    sv_perfil.setVisibility(View.VISIBLE);
                    mei.loadUrl("javascript: var imgUrl = document.getElementById('dataUser').dataset.picture;" +
                                            "var name = document.getElementById('profile-nombre').innerText;" +
                                            "var email = document.getElementById('profile-correo').innerText;" +
                                            "var edad = document.getElementById('profile-edad').innerText;" +
                                            "var city = document.getElementById('profile-ciudad').innerText;" +
                                            "window.HTMLOUT.perfil(imgUrl,name,email,edad,city);" +
                                            "var test = document.getElementsByClassName('testName');" +
                                            "var fecha = document.getElementsByClassName('testFecha');" +
                                            "var resu = document.getElementsByClassName('testResu');" +
                                            "for(var i = 0 ; i < test.length ; ++i){" +
                                                "window.HTMLOUT.perfilTabla(test[i].innerText,fecha[i].innerText,resu[i].innerText);" +
                                            "}");
                } else if(Arrays.asList(msg).contains("login")){
                    Intent intent = new Intent(SesionActivity.this, LoginActivity.class);
                    startActivity(intent);
                    SesionActivity.this.finish();
                }

                return true;
            }

        });

        mei.addJavascriptInterface(new JavaScriptInterface(getApplicationContext()), "HTMLOUT");

        btEnviar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mei.loadUrl("javascript:document.getElementById('boton').click();");
            }
        });

        btRecomendacion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mei.loadUrl(PagMadre+"mostrar_reco.php");
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        //noinspection deprecation
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            sv_perfil.setOnScrollChangeListener(new View.OnScrollChangeListener() {
                @Override
                public void onScrollChange(View view, int i, int i1, int i2, int i3) {
                    portada.setY(i1/2);
                }
            });
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            sv_carrera.setOnScrollChangeListener(new View.OnScrollChangeListener() {
                @Override
                public void onScrollChange(View view, int i, int i1, int i2, int i3) {
                    univ_foto.setY(i1/2);
                }
            });
        }


        mei.loadUrl(PagMadre);
    }

    private class JavaScriptInterface {
        Context context;

        JavaScriptInterface(Context c) {
            context = c;
        }

        @JavascriptInterface
        public void navbar(final String img, final String name, final String email){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
                    View hView =  navigationView.getHeaderView(0);
                    ImageView imgView = (ImageView) hView.findViewById(R.id.profile_image);
                    TextView textViewName = (TextView) hView.findViewById(R.id.tvName);
                    TextView textViewEmail = (TextView) hView.findViewById(R.id.tvEmail);
                    Picasso.with(getBaseContext()).load(PagMadre+"../resourses/profile_pics/"+img).transform(new CircleTransform()).into(imgView);

                    textViewName.setText(name);
                    textViewEmail.setText(email);
                }
            });
        }

        @JavascriptInterface
        public void test(final String nombre, final String urlTest) {
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Button btTest = new Button(context);
                    btTest.setGravity(3);

                    btTest.setBackgroundTintList(ColorStateList.valueOf(Color.argb(0,255,255,255)));
                    btTest.setTextColor(Color.BLACK);
                    btTest.getBackground().setColorFilter(0x00FFFFFF, PorterDuff.Mode.SRC);

                    ImageView arrow = new ImageView(context);
                    arrow.setBackgroundResource(R.drawable.ic_arrow);

                    RelativeLayout rlTest = new RelativeLayout(context);

                    float density = context.getResources().getDisplayMetrics().density;
                    int dp_10 = (int)(-10 * density);
                    int dp_8 = (int)(-8 * density);

                    RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(
                            RelativeLayout.LayoutParams.MATCH_PARENT, RelativeLayout.LayoutParams.WRAP_CONTENT);
                    layoutParams.setMargins(dp_10,dp_8,dp_10,0);

                    rlTest.addView(arrow);
                    rlTest.addView(btTest,layoutParams);

                    lytest.addView(rlTest);

                    int dp20 = (int)(25 * density);
                    int dp60 = (int)(60 * density);

                    arrow.getLayoutParams().height = dp60;
                    arrow.getLayoutParams().width = dp60;
                    arrow.requestLayout();

                    rlTest.setPadding(0,0,0,0);

                    btTest.setPadding(dp20,dp20,dp20,dp20);

                    RelativeLayout.LayoutParams paramsarrow = (RelativeLayout.LayoutParams) arrow.getLayoutParams();
                    paramsarrow.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);
                    paramsarrow.addRule(RelativeLayout.CENTER_VERTICAL);

                    btTest.setText(nombre);

                    btTest.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            mei.loadUrl(urlTest);
                        }
                    });
                }
            });
        }

        @JavascriptInterface
        public void publicidad(String html) {
            String[] msg = html.split("\"");
            final String url = msg[1];
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Picasso.with(getBaseContext()).load(url).into(publicidad);
                }
            });
        }

        @JavascriptInterface
        public void empty() {
            runOnUiThread(new Runnable() {
                @RequiresApi(api = Build.VERSION_CODES.M)
                @Override
                public void run() {
                    rlempty.setVisibility(View.VISIBLE);

                    redirect.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            mei.loadUrl(PagMadre+"listaencuestas.php");
                        }
                    });
                }
            });
        }

        @JavascriptInterface
        public void recomienda(final String Nombre, final String Uni, final String urlInfo,final int iMaps, final String urlFoto) {
            runOnUiThread(new Runnable() {
                @RequiresApi(api = Build.VERSION_CODES.M)
                @Override
                public void run() {

                    float density = context.getResources().getDisplayMetrics().density;

                    CardView cardView =  new CardView(context);
                    cardView.setElevation(4);
                    cardView.setRadius(3);
                    cardView.setBackgroundColor(Color.WHITE);
                    cardView.setPadding(16,16,16,16);

                    LinearLayout cvLinLy = new LinearLayout(context);
                    cvLinLy.setOrientation(LinearLayout.VERTICAL);

                    RelativeLayout rlEscuela = new RelativeLayout(context);
                    rlEscuela.setPadding(0,0,0,0);

                    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);

                    layoutParams.setMargins(22,22,22,22);

                    TextView tvName = new TextView(context);
                    tvName.setTextSize(TypedValue.COMPLEX_UNIT_SP,24);
                    tvName.setTextColor(Color.BLACK);
                    tvName.setText(Nombre);

                    final ImageView ivescuela = new ImageView(context);

                    TextView tvUni = new TextView(context);
                    tvUni.setText(Uni);
                    tvUni.setTextColor(Color.rgb(200,200,200));

                    TextView btInfo = new TextView(context);
                    btInfo.setText(R.string.uni_info);
                    btInfo.setTextColor(Color.RED);

                    TextView btMaps = new TextView(context);
                    btMaps.setText(R.string.uni_place);
                    btMaps.setTextColor(Color.RED);

                    RelativeLayout rlUni = new RelativeLayout(context);
                    int dp16 = (int)(16 * density);
                    int dp24 = (int)(24 * density);
                    rlUni.setPadding(dp16,0,dp16,dp16);

                    RelativeLayout rlName = new RelativeLayout(context);
                    rlName.setPadding(dp16,dp24,dp16,0);

                    LinearLayout actions = new LinearLayout(context);
                    actions.setOrientation(LinearLayout.HORIZONTAL);
                    actions.setPadding(dp16, 0, dp16, dp16);

                    rlEscuela.addView(ivescuela);
                    rlName.addView(tvName);
                    rlUni.addView(tvUni);
                    cvLinLy.addView(rlEscuela);
                    cvLinLy.addView(rlName);
                    cvLinLy.addView(rlUni);
                    actions.addView(btInfo);
                    actions.addView(btMaps);
                    cvLinLy.addView(actions);
                    cardView.addView(cvLinLy);
                    lyreco.addView(cardView, layoutParams);

                    LinearLayout.LayoutParams llp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
                    llp.setMargins(dp24, 0, 0, 0); // llp.setMargins(left, top, right, bottom);
                    btMaps.setLayoutParams(llp);
                    btMaps.setTextSize(TypedValue.COMPLEX_UNIT_SP,15);
                    btInfo.setTextSize(TypedValue.COMPLEX_UNIT_SP,15);

                    RelativeLayout.LayoutParams paramsIVe = (RelativeLayout.LayoutParams)ivescuela.getLayoutParams();
                    paramsIVe.setMargins(0,0,0,0);

                    ivescuela.getLayoutParams().width = DrawerLayout.LayoutParams.MATCH_PARENT;
                    ivescuela.getLayoutParams().height = (int)(175 * density);
                    Picasso.with(context).load(urlFoto).transform(new Transformation() {

                        @Override public Bitmap transform(Bitmap source) {
                            int targetHeight = 800;
                            double aspectRatio =  (double) source.getWidth() / (double) source.getHeight();
                            int targetWidth = (int) (targetHeight * aspectRatio);
                            Bitmap result = Bitmap.createScaledBitmap(source, targetWidth, targetHeight, false);
                            if (result != source) {
                                source.recycle();
                            }
                            return result;
                        }

                        @Override public String key() {
                            return "cropPosterTransformation720";
                        }
                    }).into(ivescuela);

                    ivescuela.setScaleType(ImageView.ScaleType.CENTER_CROP);

                    btMaps.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            mei.loadUrl("javascript: $(\".reco_maps\").get("+iMaps+").click()");
                        }
                    });

                    btInfo.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            mei.loadUrl(urlInfo);
                        }
                    });
                }
            });
        }

        @JavascriptInterface
        public void separador(){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);

                    View view2 = new View(context);
                    view2.setBackgroundResource(R.color.grey);
                    float density = context.getResources().getDisplayMetrics().density;
                    int dp1 = (int) (1 * density);

                    lytestvoca.addView(view2, layoutParams);

                    view2.getLayoutParams().height = dp1;

                }
            });
        }

        @JavascriptInterface
        public void numradio(Integer num) {
            num_radio = num;
            Rbindex = 0;
        }

        @JavascriptInterface
        public void pregunta(final String pregunta) {
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    TextView textView = new TextView(context);
                    textView.setText(pregunta);
                    textView.setTextColor(Color.BLACK);
                    textView.setTextSize(TypedValue.COMPLEX_UNIT_SP,16);
                    lytestvoca.addView(textView);
                }
            });
        }

        RadioGroup respuestas;

        @JavascriptInterface
        public void radioGCreate() {
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    respuestas = new RadioGroup(context);
                    lytestvoca.addView(respuestas);

                    respuestas.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
                        @Override
                        public void onCheckedChanged(RadioGroup radioGroup, @IdRes int i) {
                            mei.loadUrl("javascript:document.getElementsByTagName('input')["+String.valueOf(i)+"].checked = true;");
                        }
                    });
                }
            });
        }

        @JavascriptInterface
        public void radioCreate(final String valor) {
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    RadioButton radioButton = new RadioButton(context);
                    radioButton.setText(valor);
                    radioButton.setTextColor(Color.BLACK);
                    ColorStateList colorStateList = new ColorStateList(
                            new int[][]{
                                    new int[]{-android.R.attr.state_enabled}, //disabled
                                    new int[]{android.R.attr.state_enabled} //enabled
                            }, new int[] {
                                    Color.BLACK, //disabled
                                    Color.BLACK //enabled
                            }
                    );
                    radioButton.setButtonTintList(colorStateList);
                    radioButton.setId(Rbindex++);

                    respuestas.addView(radioButton);
                }
            });
        }

        @JavascriptInterface
        public void carrerafoto(final String url){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Picasso.with(context).load(url).into(univ_foto);
                }
            });
        }

        @JavascriptInterface
        public void carrerainfo(final String info, final int i){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    switch (i) {
                        case 0:
                            tvCarrer.setText(info);
                        case 1:
                            tvUniv.setText(info);
                        case 2:
                            tvInst.setText(info);
                        case 3:
                            tvArea.setText(info);
                        case 4:
                            tvDesrip.setText(info);
                        case 5:
                            tvPlan.setText(info);
                        case 6:
                            tvBecas.setText(info);
                        case 7:
                            tvPerfilE.setText(info);
                        case 8:
                            tvInterc.setText(info);

                    }
                }
            });
        }

        @JavascriptInterface
        public void test_result(final String resultado){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    tvResultado.setText(resultado);
                }
            });
        }

        @JavascriptInterface
        public void test_result_detalles(final String html){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    //noinspection deprecation
                    tvResultado_detalles.setText(Html.fromHtml(html));
                }
            });
        }

        @JavascriptInterface
        public  void perfil(final String url, final String name, final String correo, final String edad, final String ciudad){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Picasso.with(getBaseContext()).load(PagMadre+"../resourses/profile_pics/"+url).transform(new CircleTransform()).into(foto);
                    tvNombreUsuario.setText(name);
                    tvCorreo.setText(correo);
                }
            });
        }

        @JavascriptInterface
        public void perfilTabla(final String test, final String fecha, final String resu){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    TextView tvTest = new TextView(context);
                    TextView tvFecha = new TextView(context);
                    TextView tvResu = new TextView(context);
                    tvTest.setText(test);
                    tvFecha.setText("   "+fecha);
                    tvResu.setText(resu);
                    lyTablaTest.addView(tvTest);
                    lyTablaFecha.addView(tvFecha);
                    lyTablaResu.addView(tvResu);
                }
            });
        }
    }

    private class CircleTransform implements Transformation {
        @Override
        public Bitmap transform(Bitmap source) {
            int size = Math.min(source.getWidth(), source.getHeight());

            int x = (source.getWidth() - size) / 2;
            int y = (source.getHeight() - size) / 2;

            Bitmap squaredBitmap = Bitmap.createBitmap(source, x, y, size, size);
            if (squaredBitmap != source) {
                source.recycle();
            }

            Bitmap bitmap = Bitmap.createBitmap(size, size, source.getConfig());

            Canvas canvas = new Canvas(bitmap);
            Paint paint = new Paint();
            BitmapShader shader = new BitmapShader(squaredBitmap,
                    BitmapShader.TileMode.CLAMP, BitmapShader.TileMode.CLAMP);
            paint.setShader(shader);
            paint.setAntiAlias(true);

            float r = size / 2f;
            canvas.drawCircle(r, r, r, paint);

            squaredBitmap.recycle();
            return bitmap;
        }

        @Override
        public String key() {
            return "circle";
        }
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            switch (keyCode) {
                case KeyEvent.KEYCODE_BACK:
                    if (mei.canGoBack()) {
                        mei.goBack();
                    } else {
                        finish();
                    }
                    return true;
            }

        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();
            if (id == R.id.nav_inicio) {
                mei.loadUrl(PagMadre);
                setTitle("Página principal");
            } else if (id == R.id.nav_test) {
                mei.loadUrl(PagMadre + "test.php");
                setTitle("Test");
            } else if (id == R.id.nav_perfil) {
                mei.loadUrl(PagMadre + "perfil.php");
                setTitle("Perfil");
            } else if (id == R.id.nav_recomendaciones) {
                mei.loadUrl(PagMadre + "recomendaciones.php");
                setTitle("Recomendaciones");
            } else if (id == R.id.nav_cerrarc) {
                mei.loadUrl(PagMadre + "logout.php");
                setTitle("Cerrando sesión...");
            }
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}
