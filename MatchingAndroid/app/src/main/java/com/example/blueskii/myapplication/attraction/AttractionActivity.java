package com.example.blueskii.myapplication.attraction;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.main.NetworkInfo;

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

public class AttractionActivity extends AppCompatActivity {
    private ListView attractionList;
    private AttractionAdapter attractionAdapter;
    private ImageView imgSelected;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attraction);

        imgSelected = (ImageView) findViewById(R.id.imgSelected);

        attractionList = (ListView) findViewById(R.id.attractionList);
        attractionList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Attraction attraction = (Attraction) attractionAdapter.getItem(position);
                imgSelected.setImageBitmap(attraction.getSavedfile());
            }
        });


        fillItems(1);
    }

    public void fillItems(final int pageNo) {
        //HTTP 통신 코드
        Thread thread = new Thread() {
            @Override
            public void run() {
                try {
                    URL url = new URL(NetworkInfo.BASE_URL + "/mattraction/attractionlist?pageNo="+pageNo);
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
                        final List<Attraction> list = parseJson(strJson);
                        attractionList.post(new Runnable() {
                            @Override
                            public void run() {
                                attractionAdapter= new AttractionAdapter(AttractionActivity.this);
                                attractionAdapter.setList(list);
                                attractionList.setAdapter(attractionAdapter);
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

    public List<Attraction> parseJson(String strJson) {
        List<Attraction> list = new ArrayList<>();
        try {
            //[]로 시작하는건 Array로
            JSONArray jsonArray = new JSONArray(strJson);
            for(int i=0; i<jsonArray.length(); i++) {
                //{}로 시작하는건 object로
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Attraction attraction = new Attraction();
                attraction.setAno(jsonObject.getInt("ano"));
                attraction.setAname(jsonObject.getString("aname"));
                attraction.setAlocation(jsonObject.getString("alocation"));
                attraction.setAinfo(jsonObject.getString("ainfo"));
                attraction.setSavedfile(getBitmap(jsonObject.getString("savedfile")));
                list.add(attraction);
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return list;
    }

    public Bitmap getBitmap(String fileName) {
        Bitmap bitmap = null;
        try {
            URL url = new URL(NetworkInfo.BASE_URL + "/mattraction/getPhoto?savedfile=" + fileName);
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

