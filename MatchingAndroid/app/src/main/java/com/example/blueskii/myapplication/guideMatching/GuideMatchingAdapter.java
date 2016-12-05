package com.example.blueskii.myapplication.guideMatching;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.blueskii.myapplication.R;

import java.util.ArrayList;
import java.util.List;

public class GuideMatchingAdapter extends BaseAdapter {
    private List<GuideMatching> list = new ArrayList<>();

    private Context context;
    private LayoutInflater layoutInflater;

    public GuideMatchingAdapter(Context context) {
        this.context = context;
        layoutInflater = LayoutInflater.from(context);
    }
    //데이터 갯수
    @Override
    public int getCount() {
        return list.size();
    }
    //리스트중 몇번을 선택해서 이벤트를 줄걸지
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
            //inplation
            convertView = layoutInflater.inflate(R.layout.activity_guide_matching_list_item, null);
        }

        //data setting
        GuideMatching guideMatching = list.get(position);

        ImageView savedfile = (ImageView) convertView.findViewById(R.id.savedfile);
        savedfile.setImageBitmap(guideMatching.getBitmap());

        TextView mname = (TextView) convertView.findViewById(R.id.mname);
        mname.setText(guideMatching.getMname());

        TextView glocal = (TextView) convertView.findViewById(R.id.glocal);
        glocal.setText(guideMatching.getGlocal());

        TextView gintro = (TextView) convertView.findViewById(R.id.gintro);
        gintro.setText(guideMatching.getGintro());

        return convertView;
    }

    public void addItem(GuideMatching guideMatching) {
        boolean isExist = false;
        for(GuideMatching m : list) {
            if(m.getGid().equals(guideMatching.getGid())) {
                isExist = true;
                break;
            }
        }
        if(!isExist) {
            list.add(guideMatching);
            notifyDataSetChanged();
        }
    }

    public void removeAll() {
        Log.i("mylog", "###############removeAll");
        list.clear();
        notifyDataSetChanged();
    }
}
