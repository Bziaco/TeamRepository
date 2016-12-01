package com.example.blueskii.myapplication.matching;

import android.graphics.Bitmap;

public class Matching {
    private String gid;
    private Bitmap bitmap;
    private String savedfile;
    private String mname;
    private String glocal;
    private String gintro;

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
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

    public String getGlocal() {
        return glocal;
    }

    public void setGlocal(String glocal) {
        this.glocal = glocal;
    }

    public String getGintro() {
        return gintro;
    }

    public void setGintro(String gintro) {
        this.gintro = gintro;
    }
}
