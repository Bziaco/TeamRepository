package com.example.blueskii.myapplication.TouristMatching;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.attraction.AttractionAdapter;
import com.example.blueskii.myapplication.main.NetworkInfo;
import com.example.blueskii.myapplication.member.LoginActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;

public class TouristInfoActivity extends AppCompatActivity {
    private String mid;
    private int grno;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tourist_info);

        Intent intent = getIntent();
        mid = intent.getStringExtra("mid");
        grno = intent.getIntExtra("grno",0);
        Log.i("mylog", mid);
        Log.i("mylog", String.valueOf(grno));

        getTouristInfo(mid);
    }

    private void getTouristInfo(final String mid) {
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL(NetworkInfo.BASE_URL + "/member/info?mid=" + mid);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.connect();
                    if(conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                        InputStream is = conn.getInputStream();
                        Reader reader = new InputStreamReader(is);
                        BufferedReader br = new BufferedReader(reader);
                        while(true) {
                            String data = br.readLine();
                            if(data == null) break;
                            strJson += data;
                        }
                        br.close(); reader.close(); is.close();
                    }
                    conn.disconnect();
                } catch (Exception e) {
                    Log.i("mylog", e.getMessage());
                }
                return strJson;
            }

            @Override
            protected void onPostExecute(String strJson) {
                try {
                    JSONObject jsonObject = new JSONObject(strJson);
                    String result = jsonObject.getString("result");
                    if(result.equals("success")) {
                        JSONObject jo = jsonObject.getJSONObject("member");

                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
    }

    public void onClickBtnProposal(View view) {
        SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
        final String gid = pref.getString("login", "");
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL(NetworkInfo.BASE_URL + "/guide/addGuidePossible?gid=" + gid + "&grno=" + grno);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.connect();
                    if(conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                        InputStream is = conn.getInputStream();
                        Reader reader = new InputStreamReader(is);
                        BufferedReader br = new BufferedReader(reader);
                        while(true) {
                            String data = br.readLine();
                            if(data == null) break;
                            strJson += data;
                        }
                        br.close(); reader.close(); is.close();
                    }
                    conn.disconnect();
                } catch (Exception e) {
                    Log.i("mylog", e.getMessage());
                }
                return strJson;
            }

            @Override
            protected void onPostExecute(String strJson) {
                try {
                    JSONObject jsonObject = new JSONObject(strJson);
                    String result = jsonObject.getString("result");
                    if(result.equals("success")) {
                        Toast.makeText(TouristInfoActivity.this, "가이드로 신청 성공", Toast.LENGTH_SHORT).show();
                        finish();
                    } else {
                        Toast.makeText(TouristInfoActivity.this, "가이드로 신청 실패", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
    }

    public void onClickBtnCancel(View view) {
        finish();
    }
}
