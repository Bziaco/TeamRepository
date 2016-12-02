package com.example.blueskii.myapplication.TouristMatching;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.attraction.AttractionAdapter;

public class TouristInfoActivity extends AppCompatActivity {
    private AttractionAdapter attractionAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tourist_info);
    }

  /*  public void fillItems(final String mid) {
        //HTTP 통신 코드
        Thread thread = new Thread() {
            @Override
            public void run() {
                try {
                    URL url = new URL("http://192.168.219.191:8080/mymatch/member/info+"+mid);
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
            URL url = new URL("http://192.168.219.191:8080/mymatch/getPhoto?savedfile=" + fileName);
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
}
