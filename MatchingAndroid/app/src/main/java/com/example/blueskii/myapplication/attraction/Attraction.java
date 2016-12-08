package com.example.blueskii.myapplication.attraction;


import android.graphics.Bitmap;

public class Attraction {

    private int ano;
    private String aname;
    private String alocation;
    private String ainfo;
    private Bitmap savedfile;

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAlocation() {
        return alocation;
    }

    public void setAlocation(String alocation) {
        this.alocation = alocation;
    }

    public String getAinfo() {
        return ainfo;
    }

    public void setAinfo(String ainfo) {
        this.ainfo = ainfo;
    }

    public Bitmap getSavedfile() {
        return savedfile;
    }

    public void setSavedfile(Bitmap savedfile) {
        this.savedfile = savedfile;
    }
}
