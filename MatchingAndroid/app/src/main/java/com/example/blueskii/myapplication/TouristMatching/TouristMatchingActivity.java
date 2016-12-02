package com.example.blueskii.myapplication.TouristMatching;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;

import com.example.blueskii.myapplication.R;
import com.perples.recosdk.RECOBeacon;
import com.perples.recosdk.RECOBeaconManager;
import com.perples.recosdk.RECOBeaconRegion;
import com.perples.recosdk.RECOErrorCode;
import com.perples.recosdk.RECORangingListener;
import com.perples.recosdk.RECOServiceConnectListener;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collection;

public class TouristMatchingActivity extends AppCompatActivity implements RECOServiceConnectListener, RECORangingListener{
    private ImageView imageLarge;
    private ListView tourlistMatchinglist;
    private TouristMatchingAdapter touristMatchingAdapter;

    private RECOBeaconManager recoBeaconManager;
    private RECOBeaconRegion currentRegion;
    private boolean requestedMatchingTourist;
    private Thread receiveTouristThread;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tourist_matching);

        imageLarge = (ImageView) findViewById(R.id.imageLarge);

        tourlistMatchinglist = (ListView) findViewById(R.id.touristMatchinglist);
        touristMatchingAdapter = new TouristMatchingAdapter(this);
        tourlistMatchinglist.setAdapter(touristMatchingAdapter);
    }
    public void onClickBtnFindTourist(View view){
        recoBeaconManager = RECOBeaconManager.getInstance(getApplicationContext(),true,false);
        recoBeaconManager.setScanPeriod(2000);
        recoBeaconManager.bind(this);
        requestedMatchingTourist = false;

        tourlistMatchinglist.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                view.setSelected(true);
            }
        });
    }
    @Override
    protected void onDestroy(){
        super.onDestroy();
        if(receiveTouristThread != null){
            receiveTouristThread.interrupt();
        }
        if(recoBeaconManager != null) {
            try {
                recoBeaconManager.stopRangingBeaconsInRegion(currentRegion);
                recoBeaconManager.unbind();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void didRangeBeaconsInRegion(Collection<RECOBeacon> collection, RECOBeaconRegion recoBeaconRegion) {
        for (RECOBeacon beacon : collection) {
            if (beacon.getAccuracy() < 1) {
                SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
                String mid = pref.getString("login", "");
                int bminor = beacon.getMinor();
                requestMatchingTourist(mid, bminor);
                requestedMatchingTourist = true;

            }
            if(requestedMatchingTourist) {
                try {
                    recoBeaconManager.stopRangingBeaconsInRegion(currentRegion);
                    recoBeaconManager.unbind();
                } catch (Exception e) {
                }
            }
        }
    }

    @Override
    public void rangingBeaconsDidFailForRegion(RECOBeaconRegion recoBeaconRegion, RECOErrorCode recoErrorCode) { }

    @Override
    public void onServiceConnect() {
        try {
            recoBeaconManager.setRangingListener(this);
            currentRegion = new RECOBeaconRegion("24DDF411-8CF1-440C-87CD-E368DAF9C93E", "currentRegion");
            recoBeaconManager.startRangingBeaconsInRegion(currentRegion);
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onServiceFail(RECOErrorCode recoErrorCode) {}

    private void requestMatchingTourist(final String mid, final int bminor) {
        Log.i("mylog", "매칭 관광객 요청: " + mid + "-" + bminor);
        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL("http://192.168.0.69:8080/mymatch/tourist/requestMatchingTourist?mid=" + mid + "&bminor=" + bminor);
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
                        Toast.makeText(TouristMatchingActivity.this, "관광객 요청이 되었습니다.", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
        /*신청한 가이드 목록 받아오기*/
        receiveMatchingTourist(mid, bminor);

    }

    private void receiveMatchingTourist(final String mid, final int bminor) {
        Log.i("mylog", "매칭 가이드 목록 요청");
        if(receiveTouristThread !=null ) {
            receiveTouristThread.interrupt();
        }
        receiveTouristThread = new Thread() {
            @Override
            public void run() {
                while(true) {
                    Log.i("mylog", "목록 수신...");
                    try {
                        URL url = new URL("http://192.168.0.69:8080/mymatch/tourist/receiveMatchingTourist?mid=" + mid + "&bminor=" + bminor);
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
                                touristMatching.setTid(jsonObject.getString("tid"));
                                touristMatching.setMname(jsonObject.getString("mname"));
                                touristMatching.setTlocal(jsonObject.getString("tlocal"));
                                touristMatching.setTintro(jsonObject.getString("tintro"));
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
            URL url = new URL("http://192.168.0.69:8080/mymatch/member/getPhoto?savedfile=" + savedfile);
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
        /*Bundle extras = new Bundle();

        extras.putString("tid", .getTid());*/

        Intent intent = new Intent(this, TouristInfoActivity.class);
    /*    intent.putExtras(extras);*/
        startActivity(intent);
    }
}
