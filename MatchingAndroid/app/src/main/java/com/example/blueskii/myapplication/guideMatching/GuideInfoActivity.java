package com.example.blueskii.myapplication.guideMatching;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
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

public class GuideInfoActivity extends AppCompatActivity {
    private String gid;
    private int grno;
    private String nickName;
    private GuideMatchingAdapter guideMatchingAdapter;
    GuideMatching guideMatching;
    TextView txtName, txtNickname, txtAge, txtSex, txtLocation, txtEmail, txtTel;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_guide_info);

        Intent intent = getIntent();
        gid = intent.getStringExtra("gid");
        grno = intent.getIntExtra("grno",0);
        Log.i("mylog", gid);
        Log.i("mylog", String.valueOf(grno));

        txtName = (TextView)findViewById(R.id.txtName);
        txtNickname = (TextView)findViewById(R.id.txtNickname);
        txtAge = (TextView)findViewById(R.id.txtAge);
        txtSex = (TextView)findViewById(R.id.txtSex);
        txtLocation = (TextView)findViewById(R.id.txtLocal);
        txtEmail = (TextView)findViewById(R.id.txtEmail);
        txtTel = (TextView)findViewById(R.id.txtTel);

        getGuideInfo(gid);
    }

    private void getGuideInfo(final String mid) {
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

                        guideMatching = new GuideMatching();
                        guideMatching.setMname(jo.getString("mname"));
                        guideMatching.setNickName(jo.getString("mnickname"));
                        guideMatching.setAge(jo.getString("mage"));
                        guideMatching.setSex(jo.getString("msex"));
                        guideMatching.setLocation(jo.getString("mlocal"));
                        guideMatching.setEmail(jo.getString("memail"));
                        guideMatching.setTel(jo.getString("mtel"));
  /*                      touristMatching.setSavedfile(jo.getString("mphoto"));*/

                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
                //----
/*                Log.i("mylog123", touristMatching.getSavedfile());*/
                txtName.setText(guideMatching.getMname());
                txtNickname.setText(guideMatching.getNickName());
                txtAge.setText(guideMatching.getAge());
                txtSex.setText(guideMatching.getSex());
                txtLocation.setText(guideMatching.getLocation());
                txtEmail.setText(guideMatching.getEmail());
                txtTel.setText(guideMatching.getTel());
/*              touristMatching.setBitmap(getBitmap(touristMatching.getSavedfile()));
                imgview.setImageBitmap(touristMatching.getBitmap());*/
            }
        };
        asyncTask.execute();
    }

    public void onClickBtnGuideSelect(View view) {
        SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
        final String mid = pref.getString("login", "");
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL(NetworkInfo.BASE_URL + "/guide/selectGuide?mid=" + mid + "&gid=" + gid + "&grno=" + grno);
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
                    e.printStackTrace();
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
                        Toast.makeText(GuideInfoActivity.this, "가이드 선택 성공", Toast.LENGTH_SHORT).show();
                        setResult(Activity.RESULT_OK);
                        finish();
                    } else {
                        Toast.makeText(GuideInfoActivity.this, "가이드 선택 실패", Toast.LENGTH_SHORT).show();
                        setResult(Activity.RESULT_CANCELED);
                        finish();
                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
    }

    public void onClickBtnCancel(View view) {
        setResult(Activity.RESULT_CANCELED);
        finish();
    }
}
