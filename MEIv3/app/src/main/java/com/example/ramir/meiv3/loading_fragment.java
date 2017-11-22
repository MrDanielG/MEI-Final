/*package com.example.ramir.meiv3;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.squareup.picasso.Picasso;

*
 * Created by ramir on 20/11/2017.


public class loading_fragment extends Fragment {
    private String PagMadre = (new GlobalVars().urlMEIMaster())+"login.php";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_loading,container,false);

        ImageView logo = (ImageView) rootView.findViewById(R.id.logoView);

        Picasso.with(getActivity().getBaseContext()).load(PagMadre+"/../imgs/logo1.png").into(logo);

        return rootView;
    }
}
*/

package com.example.ramir.meiv3;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;

import com.squareup.picasso.Picasso;

/*
 * Created by ramir on 19/03/2017.
 */

public class loading_fragment extends Fragment {
    private String PagMadre = new GlobalVars().urlMEIMaster()+"login.php";

    public View onCreateView(final LayoutInflater inflater, final ViewGroup container, Bundle savedInstanceState){
        View rootView = inflater.inflate(R.layout.fragment_loading,container,false);

        final WebView wb = (WebView) rootView.findViewById(R.id.wb);
        final ProgressBar pbConnecting = (ProgressBar) rootView.findViewById(R.id.progressBar2);
        final ImageView errorV = (ImageView) rootView.findViewById(R.id.ivDisconnect);
        final ImageView logo = (ImageView) rootView.findViewById(R.id.logoView);

        Picasso.with(getActivity().getBaseContext()).load(PagMadre+"/../imgs/logo1.png").into(logo);

        wb.setWebViewClient(new WebViewClient(){

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                pbConnecting.setVisibility(View.GONE);
                errorV.setVisibility(View.VISIBLE);
            }
        });

        wb.loadUrl(PagMadre);

        return rootView;
    }
}
