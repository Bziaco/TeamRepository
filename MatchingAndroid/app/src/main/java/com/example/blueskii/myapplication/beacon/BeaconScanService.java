package com.example.blueskii.myapplication.beacon;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.v4.app.NotificationCompat;

import com.example.blueskii.myapplication.attraction.LocationInfo;
import com.example.blueskii.myapplication.attraction.LocationInfoActivity;
import com.example.blueskii.myapplication.R;
import com.perples.recosdk.RECOBeacon;
import com.perples.recosdk.RECOBeaconManager;
import com.perples.recosdk.RECOBeaconRegion;
import com.perples.recosdk.RECOErrorCode;
import com.perples.recosdk.RECORangingListener;
import com.perples.recosdk.RECOServiceConnectListener;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BeaconScanService extends Service implements RECOServiceConnectListener, RECORangingListener {
    private RECOBeaconManager recoBeaconManager;
    private ArrayList<RECOBeaconRegion> regions;

    public BeaconScanService() {
    }

    @Override
    public IBinder onBind(Intent intent) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        recoBeaconManager = RECOBeaconManager.getInstance(getApplicationContext(), true, false);
        recoBeaconManager.setScanPeriod(1000);
        recoBeaconManager.setRangingListener(this);

        regions = new ArrayList<RECOBeaconRegion>();
        RECOBeaconRegion recoRegion = new RECOBeaconRegion("24DDF411-8CF1-440C-87CD-E368DAF9C93E", "RECO Sample Region");
        regions.add(recoRegion);

        recoBeaconManager.bind(this);

        return START_STICKY;
    }

    @Override
    public void onServiceConnect() {
        for(RECOBeaconRegion region : regions) {
            try {
                recoBeaconManager.startRangingBeaconsInRegion(region);
            } catch (Exception e) {}
        }
    }

    @Override
    public void onServiceFail(RECOErrorCode recoErrorCode) {
    }

    @Override
    public void onDestroy() {
        for(RECOBeaconRegion region : regions) {
            try {
                recoBeaconManager.stopRangingBeaconsInRegion(region);
            } catch (Exception e) {}
        }
        try {
            recoBeaconManager.unbind();
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    private List<Integer> beacons = new ArrayList<>();
    @Override
    public void didRangeBeaconsInRegion(Collection<RECOBeacon> collection, RECOBeaconRegion recoBeaconRegion) {
        for(RECOBeacon beacon : collection) {
            int bminor = beacon.getMinor();
            if (beacon.getAccuracy() < 1) {
                if(!beacons.contains(bminor)) {
                    beacons.add(bminor);
                    LocationInfo locationInfo = getLocationInfo(bminor);
                    popupNotification(locationInfo);
                }
            } else {
                beacons.remove(new Integer(bminor));
            }
        }
    }

    @Override
    public void rangingBeaconsDidFailForRegion(RECOBeaconRegion recoBeaconRegion, RECOErrorCode recoErrorCode) {
    }

    private LocationInfo getLocationInfo(int bminor) {
        LocationInfo locationInfo = new LocationInfo();
        locationInfo.setBminor(bminor);
        locationInfo.setLid(1);
        locationInfo.setLname("유럽풍경");
        return locationInfo;
    }

    private void popupNotification(LocationInfo locationInfo) {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this);
        builder.setDefaults(Notification.DEFAULT_SOUND | Notification.DEFAULT_LIGHTS);
        builder.setSmallIcon(R.mipmap.ic_launcher);
        builder.setContentTitle(locationInfo.getLname() + ": " + locationInfo.getBminor());
        builder.setContentText("자세한 설명을 위해 클릭해 주세요.");

        PendingIntent pendingIntent = PendingIntent.getActivity(
            this, 0,
            new Intent(this, LocationInfoActivity.class),
            PendingIntent.FLAG_UPDATE_CURRENT
        );
        builder.setContentIntent(pendingIntent);

        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        nm.notify(locationInfo.getBminor(), builder.build());
    }
}
