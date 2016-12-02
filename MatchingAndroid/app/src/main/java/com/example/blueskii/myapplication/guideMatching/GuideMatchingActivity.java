package com.example.blueskii.myapplication.guideMatching;

import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.RemoteException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
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

public class GuideMatchingActivity extends AppCompatActivity implements RECOServiceConnectListener, RECORangingListener {
    private ImageView imageLarge;
    private ListView guideMatchinglist;
    private GuideMatchingAdapter guidematchingAdapter;

    /*비콘신호를 수신하는 객체*/
    private RECOBeaconManager recoBeaconManager;
    /*어떤 비콘을 수신할 것인지 정의*/
    private RECOBeaconRegion currentRegion;

    /*가이드 찾기 요청을 했는지 여부*/
    private boolean requestedMatchingGuide;

    /*신청한 가이드 목록을 가져오는 스레드*/
    private Thread receiveGuideThread;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_guide_matching);
        imageLarge = (ImageView) findViewById(R.id.imageLarge);

        guideMatchinglist = (ListView) findViewById(R.id.guideMatchinglist);
        guidematchingAdapter = new GuideMatchingAdapter(this);
        guideMatchinglist.setAdapter(guidematchingAdapter);

        /*matchinglist.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            }
        });*/
    }

    /*가이드 찾기 버튼을 눌렀을 때 실행*/
    public void onClickBtnFindGuide(View view) {
        /*비콘신호를 수신하는 객체 얻기*/
        recoBeaconManager = RECOBeaconManager.getInstance(getApplicationContext(), true, false);
        /*1초동안 수신하기*/
        recoBeaconManager.setScanPeriod(1000);
        /*비콘신호의 수신을 준비*/
        recoBeaconManager.bind(this);
        requestedMatchingGuide = false;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(receiveGuideThread !=null ) {
            receiveGuideThread.interrupt();
        }
        if(recoBeaconManager != null) {
            try {
                recoBeaconManager.stopRangingBeaconsInRegion(currentRegion);
                recoBeaconManager.unbind();
            } catch (Exception e) {
            }
        }
    }

    //인터페이스 구현/////////////////////////////////////////////////////////////////////////////////
    @Override
    public void onServiceConnect() {
        Log.i("mylog", "onServiceConnect");
        try {
            /*수신이 되면 통지할 객체 설정*/
            recoBeaconManager.setRangingListener(this);
            /*어떤 비콘의 신호를 받을 것이냐*/
            currentRegion = new RECOBeaconRegion("24DDF411-8CF1-440C-87CD-E368DAF9C93E", "currentRegion");
            /*비콘신호를 수신해라*/
            recoBeaconManager.startRangingBeaconsInRegion(currentRegion);
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void onServiceFail(RECOErrorCode recoErrorCode) {}
    //-----------------------------------------------------------------
    @Override
    public void didRangeBeaconsInRegion(Collection<RECOBeacon> collection, RECOBeaconRegion recoBeaconRegion) {
        for(RECOBeacon beacon : collection) {
            if (beacon.getAccuracy() < 1) {
                SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
                String mid = pref.getString("login", "");
                int bminor = beacon.getMinor();
                requestMatchingGuide(mid, bminor);
                requestedMatchingGuide = true;
            }
        }
        if(requestedMatchingGuide) {
            try {
                recoBeaconManager.stopRangingBeaconsInRegion(currentRegion);
                recoBeaconManager.unbind();
            } catch (Exception e) {
            }
        }
    }

    @Override
    public void rangingBeaconsDidFailForRegion(RECOBeaconRegion recoBeaconRegion, RECOErrorCode recoErrorCode) {}
    ////////////////////////////////////////////////////////////////////////////////////////////////

    private void requestMatchingGuide(final String mid, final int bminor) {
        Log.i("mylog", "매칭 가이드 요청: " + mid + "-" + bminor);

        AsyncTask<Void, Void, String> asyncTask = new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... params) {
                String strJson = "";
                try {
                    URL url = new URL("http://192.168.0.69:8080/mymatch/guide/requestMatchingGuide?mid=" + mid + "&bminor=" + bminor);
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
                        Toast.makeText(GuideMatchingActivity.this, "가이드 요청이 되었습니다.", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Log.i("mylog", e.getMessage());
                }
            }
        };
        asyncTask.execute();
        /*신청한 가이드 목록 받아오기*/
        receiveMatchingGuide(mid, bminor);
    }

    private void receiveMatchingGuide(final String mid, final int bminor) {
        Log.i("mylog", "매칭 가이드 목록 요청");
        if(receiveGuideThread !=null ) {
            receiveGuideThread.interrupt();
        }
        receiveGuideThread = new Thread() {
            @Override
            public void run() {
                while(true) {
                    Log.i("mylog", "목록 수신...");
                    try {
                        URL url = new URL("http://192.168.0.69:8080/mymatch/guide/receiveMatchingGuide?mid=" + mid + "&bminor=" + bminor);
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
                                final GuideMatching guideMatching = new GuideMatching();
                                guideMatching.setGid(jsonObject.getString("gid"));
                                guideMatching.setMname(jsonObject.getString("mname"));
                                guideMatching.setGlocal(jsonObject.getString("glocal"));
                                guideMatching.setGintro(jsonObject.getString("gintro"));
                                guideMatching.setSavedfile(jsonObject.getString("savedfile"));
                                guideMatching.setBitmap(getBitmap(guideMatching.getSavedfile()));
                                //메인스레드로 하여금 UI를 업데이트하도록 요청
                                guideMatchinglist.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        guidematchingAdapter.addItem(guideMatching);
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
        receiveGuideThread.start();
    }

    public Bitmap getBitmap(String savedfile) {
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

    public void onClickBtnSelectGuide(View view) {
        Log.i("mylog", "가이드 선택");
        if(receiveGuideThread != null) {
            receiveGuideThread.interrupt();
        }
    }
}
