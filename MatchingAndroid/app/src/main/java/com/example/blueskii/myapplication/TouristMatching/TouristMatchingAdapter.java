package com.example.blueskii.myapplication.TouristMatching;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.blueskii.myapplication.R;
import com.example.blueskii.myapplication.guideMatching.GuideMatching;

import java.util.ArrayList;
import java.util.List;

public class TouristMatchingAdapter extends BaseAdapter {
    private List<TouristMatching> list = new ArrayList<>();

    private Context context;
    private LayoutInflater layoutInflater;

    public TouristMatchingAdapter(Context context) {
        this.context = context;
        layoutInflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int position) {
        return list.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if(convertView == null) {

            convertView = layoutInflater.inflate(R.layout.activity_tourist_matching_list_item, null);
        }


        TouristMatching touristMatching = list.get(position);

        ImageView savedfile = (ImageView) convertView.findViewById(R.id.savedfile);
        savedfile.setImageBitmap(touristMatching.getBitmap());

        TextView mname = (TextView) convertView.findViewById(R.id.mname);
        mname.setText(touristMatching.getMname());

        TextView tlocal = (TextView) convertView.findViewById(R.id.tlocal);
        tlocal.setText(touristMatching.getTlocal());

        TextView tintro = (TextView) convertView.findViewById(R.id.tintro);
        tintro.setText(touristMatching.getTintro());

        return convertView;
    }

    public void addItem(TouristMatching touristMatching) {
        boolean isExist = false;
        for(TouristMatching m : list) {
            if(m.getTid().equals(touristMatching.getTid())) {
                isExist = true;
                break;
            }
        }
        if(!isExist) {
            list.add(touristMatching);
            notifyDataSetChanged();
        }
    }
}
