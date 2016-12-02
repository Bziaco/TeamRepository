package com.example.blueskii.myapplication.TouristMatching;

import android.graphics.Bitmap;

import java.io.Serializable;

public class TouristMatching implements Serializable {
    private String mid;
    private String mname;
    private String aname;
    private String savedfile;
    private Bitmap bitmap;
    private int grno;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getSavedfile() {
        return savedfile;
    }

    public void setSavedfile(String savedfile) {
        this.savedfile = savedfile;
    }

    public Bitmap getBitmap() {
        return bitmap;
    }

    public void setBitmap(Bitmap bitmap) {
        this.bitmap = bitmap;
    }

    public int getGrno() { return grno; }

    public void setGrno(int grno) { this.grno = grno; }
}
