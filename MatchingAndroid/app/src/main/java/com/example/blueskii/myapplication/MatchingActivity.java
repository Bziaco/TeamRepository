package com.example.blueskii.myapplication;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
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

public class MatchingActivity extends AppCompatActivity {
    private ImageView imageLarge;
    private ListView matchinglist;
    private MatchingAdapter matchingAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_matching);
        imageLarge = (ImageView) findViewById(R.id.imageLarge);

        matchinglist = (ListView) findViewById(R.id.matchinglist);
        matchinglist.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                final Matching matching = (Matching) matchingAdapter.getItem(position);
                Thread thread = new Thread() {
                    @Override
                    public void run() {
                        final Bitmap bitmap = getBitmap(matching.getImageLargeFileName());
                        imageLarge.post(new Runnable() {
                            @Override
                            public void run() {
                                imageLarge.setImageBitmap(bitmap);
                            }
                        });
                    }
                };
                thread.start();
            }
        });

        fillItems();
    }

    public void fillItems() {
        //HTTP 통신 코드
        Thread thread = new Thread() {
            @Override
            public void run() {
                try {
                    URL url = new URL("http://192.168.0.69:8080/myandroid/matchinglist");
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

                        final List<Matching> list = parseJson(strJson);
                        matchinglist.post(new Runnable() {
                            @Override
                            public void run() {
                                matchingAdapter = new MatchingAdapter(MatchingActivity.this);
                                matchingAdapter.setList(list);
                                matchinglist.setAdapter(matchingAdapter);
                                imageLarge.setImageBitmap(list.get(0).getImageLarge());
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

    public List<Matching> parseJson(String strJson) {
        List<Matching> list = new ArrayList<>();
        try {
            //[]로 시작하는건 Array로
            JSONArray jsonArray = new JSONArray(strJson);
            for(int i=0; i<jsonArray.length(); i++) {
                //{}로 시작하는건 object로
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                Matching matching = new Matching();
                matching.setImage(getBitmap(jsonObject.getString("image")));
                //첫 이미지를 보여주는 부분
                if(i==0) {
                    matching.setImageLarge(getBitmap(jsonObject.getString("imageLarge")));
                }
                // matching.setImageFileName(jsonObject.getString("image"));
                matching.setImageLargeFileName(jsonObject.getString("imageLarge"));
                matching.setName(jsonObject.getString("name"));
                matching.setContent(jsonObject.getString("content"));
                list.add(matching);
            }
        } catch (JSONException e) {
            Log.i("mylog", e.getMessage());
        }
        return list;
    }

    public Bitmap getBitmap(String fileName) {
        Bitmap bitmap = null;
        try {
            URL url = new URL("http://192.168.0.69:8080/myandroid/getImage?fileName=" + fileName);
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
