package com.example.blueskii.myapplication.member;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.blueskii.myapplication.R;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;


public class LoginActivity extends Activity {
    private EditText txtMid,txtMpassword;
    private Button btnLogin,btnCancel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        txtMid = (EditText)findViewById(R.id.txtMid);
        txtMpassword = (EditText)findViewById(R.id.txtMpassword);

        btnCancel = (Button)findViewById(R.id.btnCancel);
        btnLogin = (Button)findViewById(R.id.btnLogin);


        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                login();
            }
        });

        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void login() {
        final String mid = txtMid.getText().toString();
        final String mpassword = txtMpassword.getText().toString();
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL("http://192.168.0.69:8080/mymatch/member/login?mid=" + mid + "&mpassword=" + mpassword);
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
                    if(result.equals("LOGIN_SUCCESS")) {
                        SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        editor.putString("login", mid);
                        editor.commit();
                        finish();
                    } else if(result.equals("LOGIN_FAIL_MPASSWORD")) {
                        Toast.makeText(LoginActivity.this, "패스워드가 틀립니다.", Toast.LENGTH_SHORT).show();
                    } else if(result.equals("LOGIN_FAIL_MID")) {
                        Toast.makeText(LoginActivity.this, "아이디가 없습니다.", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
    }


}

