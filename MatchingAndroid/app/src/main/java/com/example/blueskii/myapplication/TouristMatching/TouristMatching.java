package com.example.blueskii.myapplication.TouristMatching;

import android.graphics.Bitmap;

public class TouristMatching {
    private String tid;
    private Bitmap bitmap;
    private String savedfile;
    private String mname;
    private String tlocal;
    private String tintro;

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public Bitmap getBitmap() {
        return bitmap;
    }

    public void setBitmap(Bitmap bitmap) {
        this.bitmap = bitmap;
    }

    public String getSavedfile() {
        return savedfile;
    }

    public void setSavedfile(String savedfile) {
        this.savedfile = savedfile;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getTlocal() {
        return tlocal;
    }

    public void setTlocal(String tlocal) {
        this.tlocal = tlocal;
    }

    public String getTintro() {
        return tintro;
    }

    public void setTintro(String tintro) {
        this.tintro = tintro;
    }
}
