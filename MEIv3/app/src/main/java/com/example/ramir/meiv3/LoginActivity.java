package com.example.ramir.meiv3;

import android.os.Bundle;
import android.support.annotation.AnimRes;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CoordinatorLayout;
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
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

public class LoginActivity extends AppCompatActivity {

    private String PagMadre = (new GlobalVars().urlMEIMaster())+"login.php";
    private RelativeLayout rl;
    private AppBarLayout appBarLayout;
    private ImageView ivReconect;
    private ProgressBar pbConnecting;
    private CoordinatorLayout mainLy;
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
        mainLy = (CoordinatorLayout) findViewById(R.id.main_content);

        final FrameLayout frameLayout = new FrameLayout(getBaseContext());
        frameLayout.setId(View.generateViewId());

        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT);

        getSupportFragmentManager().beginTransaction().add(frameLayout.getId(), new loading_fragment()).commit();

        mainLy.addView(frameLayout,layoutParams);

        WebSettings webSettings = wb.getSettings();
        webSettings.setJavaScriptEnabled(true); //Settings de MEIPage
        webSettings.setDomStorageEnabled(true);

        wb.setWebViewClient(new WebViewClient(){

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                if(sinError) {
                    appBarLayout.setVisibility(View.VISIBLE);
                    wb.destroy();
                    animar(R.anim.carga_inicio, frameLayout);
                    frameLayout.setVisibility(View.GONE);
                }

                sinError = true;
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                super.onReceivedError(view, request, error);
                sinError = false;
            }
        });

        wb.loadUrl(PagMadre);

        ViewPager mViewPager = (ViewPager) findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);


        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(mViewPager);

    }

    public void animar(@AnimRes int id, FrameLayout Fl){
        Animation animation = AnimationUtils.loadAnimation(getApplicationContext(),id);
        Fl.startAnimation(animation);
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
