package com.example.blueskii.myapplication;


import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class TabFragment1 extends Fragment{
    private ListView MgetAttractionlist;
    private AttractionAdapter attractionAdapter;
    private boolean mLockListView;
    private LayoutInflater mInflater;

    private int pageNo=1;



    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        fillItems(pageNo);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.tab_fragment_1, container, false);
        MgetAttractionlist = (ListView)view.findViewById(R.id.MgetAttractionlist);


        return view;
    }


    public void fillItems(final int pageNo) {
        //HTTP 통신 코드
        Thread thread = new Thread() {
            @Override
            public void run() {
                try {
                    URL url = new URL("http://192.168.0.69:8080/mymatch/MgetAttractionlist?pageNo="+pageNo);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.connect();

                    if(conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                        InputStream is = conn.getInputStream();
                        Reader reader = new InputStreamReader(is);
                        BufferedReader br = new BufferedReader(reader);
                        String strJson = "";
                        while(true) {
                            String data = br.readLine();
                            if(data == null) break;
                            strJson += data;
                        }
                        br.close(); reader.close(); is.close();
                        Log.i("mylog",strJson);
                        final List<MgetAttraction> list = parseJson(strJson);
                        Log.i("mylog list",list.toString());
                        MgetAttractionlist.post(new Runnable() {
                            @Override
                            public void run() {

                                attractionAdapter= new AttractionAdapter(getContext());
                                attractionAdapter.setList(list);
                                MgetAttractionlist.setAdapter(attractionAdapter);
                            }
                        });
                    }

                    conn.disconnect();
                } catch (Exception e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        thread.start();
    }

    public List<MgetAttraction> parseJson(String strJson) {
        List<MgetAttraction> list = new ArrayList<>();
        try {
            //[]로 시작하는건 Array로
            JSONArray jsonArray = new JSONArray(strJson);
            for(int i=0; i<jsonArray.length(); i++) {
                //{}로 시작하는건 object로
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                MgetAttraction mgetAttraction = new MgetAttraction();
                mgetAttraction.setAno(jsonObject.getInt("ano"));
                mgetAttraction.setAname(jsonObject.getString("aname"));
                mgetAttraction.setAlocation(jsonObject.getString("alocation"));
                mgetAttraction.setAinfo(jsonObject.getString("ainfo"));
                mgetAttraction.setSavedfile(getBitmap(jsonObject.getString("savedfile")));
                list.add(mgetAttraction);
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return list;
    }

    public Bitmap getBitmap(String fileName) {
        Bitmap bitmap = null;
        try {
            URL url = new URL("http://192.168.0.69:8080/mymatch/getPhoto?savedfile=" + fileName);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.connect();

            if(conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                InputStream is = conn.getInputStream();
                bitmap = BitmapFactory.decodeStream(is);
            }

            conn.disconnect();
        } catch (Exception e) {
            Log.i("mylog", e.getMessage());
        }
        return bitmap;
    }
}

