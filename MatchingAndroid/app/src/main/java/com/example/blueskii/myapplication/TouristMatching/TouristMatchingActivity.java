package com.example.blueskii.myapplication.TouristMatching;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.main.NetworkInfo;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

public class TouristMatchingActivity extends AppCompatActivity {
    private ImageView imageLarge;
    private ListView tourlistMatchinglist;
    private TouristMatchingAdapter touristMatchingAdapter;

    private Thread receiveTouristThread;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tourist_matching);

        imageLarge = (ImageView) findViewById(R.id.imageLarge);

        tourlistMatchinglist = (ListView) findViewById(R.id.touristMatchinglist);
        touristMatchingAdapter = new TouristMatchingAdapter(this);
        tourlistMatchinglist.setAdapter(touristMatchingAdapter);

        tourlistMatchinglist.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Intent intent = new Intent(TouristMatchingActivity.this, TouristInfoActivity.class);
                TouristMatching touristMatching = (TouristMatching)touristMatchingAdapter.getItem(position);
                intent.putExtra("mid", touristMatching.getMid());
                intent.putExtra("grno", touristMatching.getGrno());
                startActivity(intent);
            }
        });
    }

    public void onClickBtnFindTourist(View view){
        SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
        String mid = pref.getString("login", "");
        receiveMatchingTourist(mid);
    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
        if(receiveTouristThread != null){
            receiveTouristThread.interrupt();
        }
    }

    private void receiveMatchingTourist(final String gid) {
        Log.i("mylog", "매칭 관광객 목록 요청");
        if(receiveTouristThread !=null ) {
            receiveTouristThread.interrupt();
        }
        receiveTouristThread = new Thread() {
            @Override
            public void run() {
                while(true) {
                    Log.i("mylog", "목록 수신...");
                    try {
                        URL url = new URL(NetworkInfo.BASE_URL + "/guide/receiveMatchingTourist?gid=" + gid);
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

                            Log.i("mylog:", strJson);
                            JSONArray jsonArray = new JSONArray(strJson);
                            for(int i=0;i<jsonArray.length();i++){
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                final TouristMatching touristMatching = new TouristMatching();
                                touristMatching.setMid(jsonObject.getString("mid"));
                                touristMatching.setMname(jsonObject.getString("mname"));
                                touristMatching.setAname(jsonObject.getString("aname"));
                                touristMatching.setGrno(jsonObject.getInt("grno"));
                                touristMatching.setSavedfile(jsonObject.getString("savedfile"));
                                touristMatching.setBitmap(getBitmap(touristMatching.getSavedfile()));

                                //메인스레드로 하여금 UI를 업데이트하도록 요청
                                tourlistMatchinglist.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        touristMatchingAdapter.addItem(touristMatching);
                                    }
                                });
                            }
                        }
                        conn.disconnect();
                        Thread.sleep(3000);
                    } catch (Exception e) {
                        break;
                    }
                }
            }
        };
        receiveTouristThread.start();
    }

    public Bitmap getBitmap(String savedfile){
        Bitmap bitmap = null;
        try {
            URL url = new URL(NetworkInfo.BASE_URL + "/member/getPhoto?savedfile=" + savedfile);
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

    public void onClickBtnSelectTourlist(View view) {
        Log.i("mylog", "관광객 선택");
        if(receiveTouristThread != null) {
            receiveTouristThread.interrupt();
        }
    }
}
