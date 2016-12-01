package com.example.blueskii.myapplication.main;


import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.support.design.widget.Snackbar;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.Toast;

import com.example.blueskii.myapplication.attraction.AttractionActivity;
import com.example.blueskii.myapplication.beacon.BeaconScanService;
import com.example.blueskii.myapplication.member.LoginActivity;
import com.example.blueskii.myapplication.matching.MatchingActivity;
import com.example.blueskii.myapplication.R;

public class DrawerActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {
    private RelativeLayout rootViewGroup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_drawer);
        rootViewGroup = (RelativeLayout) findViewById(R.id.content_drawer);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);



        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        //main에서 가져온것
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if(ActivityCompat.checkSelfPermission(getApplicationContext(), Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                Log.i("MainActivity", "The location permission (ACCESS_COARSE_LOCATION or ACCESS_FINE_LOCATION) is not granted.");
                this.requestLocationPermission();
            } else {
                Log.i("MainActivity", "The location permission (ACCESS_COARSE_LOCATION or ACCESS_FINE_LOCATION) is already granted.");
            }
        }

        BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();

        if(!mBluetoothAdapter.isEnabled()) {
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBtIntent, 1);
        }
        //----------------------------------------------------------------------------------------------------

    }

    private void requestLocationPermission() {
        if(!ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_COARSE_LOCATION)) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, 10);
            return;
        }
        Snackbar.make(rootViewGroup, "Location permission is needed to monitor or range beacons", Snackbar.LENGTH_INDEFINITE)
                .setAction("OK", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        ActivityCompat.requestPermissions(DrawerActivity.this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, 10);
                    }
                })
                .show();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if(requestCode == 10) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Snackbar.make(rootViewGroup, "Location permission has been granted. RECO SDK can now work properly", Snackbar.LENGTH_LONG)
                        .show();
            } else {
                Snackbar.make(rootViewGroup, "Location permission for this application is denied. RECO SDK may not work properly", Snackbar.LENGTH_LONG)
                        .show();
            }
        }
    }

    //-------------------------------------------------------------------------------------------------------------------

    //서비스를 실행하는 코드
    @Override
    protected void onStart() {
        super.onStart();

        //슬라이드 메뉴에서 로그인/로그아웃 항목 객체 얻기
        NavigationView navigationView = (NavigationView)findViewById(R.id.nav_view);
        Menu menu = navigationView.getMenu();
        MenuItem menuItem = menu.findItem(R.id.nav_login);

        //로그인/로그아웃 여부 확인
        SharedPreferences pref = getSharedPreferences("pref", MODE_PRIVATE);
        String mid = pref.getString("login", "");

        if(mid.equals("")) {
            //슬라이드 메뉴에서 Login으로 변경
            menuItem.setTitle("Loin");
        } else {
            //슬라이드 메뉴에서 Logout으로 변경
            menuItem.setTitle("Logout");
        }
    }

    //사용자가 어떤 화면을 사용할때 사용
    @Override
    protected void onResume() {
        super.onResume();
    }
    //화면이 보여지며 사용자가 사용할수 있는 단계
    //-------------------------------------------------------------------------------------
    //화면이 종료되면서 아래 실행

    //사용자가 당장 사용할수 없는 상태
    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onStop() {
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    public void onClickBeaconService(View view){
        Log.i("mylog", "onClickBeaconService()");
        new AlertDialog.Builder(this)
                .setIcon(R.mipmap.ic_launcher)
                .setTitle("BeaconService ")
                .setMessage("Are you start BeaconService?")
                .setPositiveButton("No", new DialogInterface.OnClickListener(){
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Toast.makeText(DrawerActivity.this, "BeaconService Stop", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(DrawerActivity.this, BeaconScanService.class);
                        stopService(intent);
                    }
                })
                .setNegativeButton("Yes", new DialogInterface.OnClickListener(){
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Toast.makeText(DrawerActivity.this, "BeaconService Start", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(DrawerActivity.this, BeaconScanService.class);
                        startService(intent);
                    }
                })
                .show();
    }

    //-------------------------------------------------------------------------------------------------------------------

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.drawer, menu);
        return true;
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        Fragment fragment = null;
        String title = getString(R.string.app_name);

        if (id == R.id.nav_login) {
            Intent intent = new Intent(this, LoginActivity.class);
            startActivity(intent);
            title="Login";
        }  else if (id == R.id.nav_livematching) {
            Intent intent =  new Intent(this, MatchingActivity.class);
            startActivity(intent);
            title = "Matching";
        } else if (id == R.id.nav_attractioninfo) {
            Intent intent =  new Intent(this, AttractionActivity.class);
            startActivity(intent);
            title = "Home";
        }

        if (fragment != null){
            FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
            ft.replace(R.id.content_drawer, fragment);
            ft.commit();
        }

        if (getSupportActionBar() != null){
            getSupportActionBar().setTitle(title);
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}
