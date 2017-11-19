package com.example.ramir.meiv3;

import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.AnimRes;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

public class LoginActivity extends AppCompatActivity {

    GlobalVars globalVars = new GlobalVars();
    String PagMadre = globalVars.urlMEIMaster()+"login.php";
    private RelativeLayout rl;
    AppBarLayout appBarLayout;
    ImageView ivReconect;
    ProgressBar pbConnecting;
    boolean sinError=true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        SectionsPagerAdapter mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        final WebView wb = (WebView) findViewById(R.id.wb);
        rl = (RelativeLayout) findViewById(R.id.progressrl);
        appBarLayout = (AppBarLayout) findViewById(R.id.appbar);
        pbConnecting = (ProgressBar) findViewById(R.id.progressBar2);
        ivReconect = (ImageView) findViewById(R.id.ivDisconnect);

        WebSettings webSettings = wb.getSettings();
        webSettings.setJavaScriptEnabled(true); //Settings de MEIPage
        webSettings.setDomStorageEnabled(true);

        wb.setWebViewClient(new WebViewClient(){

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                if(sinError) {
                    appBarLayout.setVisibility(View.VISIBLE);
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            rl.setVisibility(View.GONE);
                            wb.destroy();
                            animar(R.anim.carga_inicio);
                        }
                    }, 100);
                }

                sinError = true;
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                super.onReceivedError(view, request, error);
                sinError = false;
                rl.setVisibility(View.GONE);
                pbConnecting.setVisibility(View.GONE);
                ivReconect.setVisibility(View.VISIBLE);
            }
        });

        wb.loadUrl(PagMadre);

        // Set up the ViewPager with the sections adapter.
        ViewPager mViewPager = (ViewPager) findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);


        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(mViewPager);

    }

    public void animar(@AnimRes int id){
        Animation animation = AnimationUtils.loadAnimation(getApplicationContext(),id);
        rl.startAnimation(animation);
    }

    private class SectionsPagerAdapter extends FragmentPagerAdapter {

        SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            switch(position){
                case 0:
                    return login_fragment.newInstance(position+1);
                case 1:
                    return regis_fragment.newInstance(position+1);
                default:
                    return login_fragment.newInstance(position+1);
            }

        }

        @Override
        public int getCount() {
            // Show 3 total pages.
            return 2;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            switch (position) {
                case 0:
                    return "INICIAR SESIÓN";
                case 1:
                    return "REGISTRARSE";
            }
            return null;
        }
    }
}
