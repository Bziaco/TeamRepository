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
    private String nickName;
    private String age;
    private String sex;
    private String location;
    private String email;
    private String tel;

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

    public int getGrno() {
        return grno;
    }

    public void setGrno(int grno) {
        this.grno = grno;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }


}
