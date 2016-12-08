package com.example.blueskii.myapplication.TouristMatching;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.main.NetworkInfo;

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
    private String nickName;
    private TouristMatchingAdapter touristMatchingAdapter;
    TouristMatching touristMatching;
    TextView txtName, txtNickname, txtAge, txtSex, txtLocation, txtEmail, txtTel;
    ImageView imgview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tourist_info);

        Intent intent = getIntent();
        mid = intent.getStringExtra("mid");
        grno = intent.getIntExtra("grno",0);
        Log.i("mylog", mid);
        Log.i("mylog", String.valueOf(grno));

        txtName = (TextView)findViewById(R.id.txtName);
        txtNickname = (TextView)findViewById(R.id.txtNickname);
        txtAge = (TextView)findViewById(R.id.txtAge);
        txtSex = (TextView)findViewById(R.id.txtSex);
        txtLocation = (TextView)findViewById(R.id.txtLocation);
        txtEmail = (TextView)findViewById(R.id.txtEmail);
        txtTel = (TextView)findViewById(R.id.txtTel);
/*        imgview = (ImageView)findViewById(R.id.imgview);*/


        getTouristInfo(mid);
    }

    private void getTouristInfo(final String mid) {
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL(NetworkInfo.BASE_URL + "/member/androidInfo?mid=" + mid);
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

                    Log.i("mylog json", strJson);
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

                        touristMatching = new TouristMatching();
                        touristMatching.setMname(jo.getString("mname"));
                        touristMatching.setNickName(jo.getString("mnickname"));
                        touristMatching.setAge(jo.getString("mage"));
                        touristMatching.setSex(jo.getString("msex"));
                        touristMatching.setLocation(jo.getString("mlocal"));
                        touristMatching.setEmail(jo.getString("memail"));
                        touristMatching.setTel(jo.getString("mtel"));
  /*                      touristMatching.setSavedfile(jo.getString("mphoto"));*/

                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.i("mylog", e.getMessage());
                }
                //----
/*                Log.i("mylog123", touristMatching.getSavedfile());*/
                txtName.setText(touristMatching.getMname());
                txtNickname.setText(touristMatching.getNickName());
                txtAge.setText(touristMatching.getAge());
                txtSex.setText(touristMatching.getSex());
                txtLocation.setText(touristMatching.getLocation());
                txtEmail.setText(touristMatching.getEmail());
                txtTel.setText(touristMatching.getTel());
/*                touristMatching.setBitmap(getBitmap(touristMatching.getSavedfile()));
                imgview.setImageBitmap(touristMatching.getBitmap());*/
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

 /*   public Bitmap getBitmap(String savedfile){
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
    }*/

    public void onClickBtnCancel(View view) {
        finish();
    }
}
