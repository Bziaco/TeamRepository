package com.example.blueskii.myapplication.attraction;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

/**
 * Created by Administrator on 2016-11-28.
 */

public class TabPagerAdapters extends FragmentStatePagerAdapter {
    // Count number of tabs
    private int tabCount;

    public TabPagerAdapters(FragmentManager fm, int tabCount) {
        super(fm);
        this.tabCount = tabCount;
    }

    @Override
    public Fragment getItem(int position) {

        // Returning the current tabs
        switch (position) {
            case 0:
                TabFragment tabFragment1 = new TabFragment();
                return tabFragment1;
            case 1:
                TabFragment tabFragment2 = new TabFragment();
                return tabFragment2;
            case 2:
                TabFragment tabFragment3 = new TabFragment();
                return tabFragment3;
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return tabCount;
    }
}
