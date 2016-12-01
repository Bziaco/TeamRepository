package com.example.blueskii.myapplication;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Administrator on 2016-11-30.
 */

public class AttractionAdapter extends BaseAdapter {
    private List<MgetAttraction> list;
    public void setList(List<MgetAttraction> list) {
        this.list = list;
    }

    private Context context;
    private LayoutInflater layoutInflater;

    public AttractionAdapter(Context context) {
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
            convertView = layoutInflater.inflate(R.layout.attraction_1, null);
        }

        //data setting
        MgetAttraction mgetAttraction = list.get(position);

        TextView AttractionName = (TextView) convertView.findViewById(R.id.AttractionName);
        AttractionName.setText(mgetAttraction.getAname());

        TextView AttractionLocation = (TextView) convertView.findViewById(R.id.AttractionLocation);
        AttractionLocation.setText(mgetAttraction.getAlocation());

        TextView AttractionContent = (TextView) convertView.findViewById(R.id.AttractionContent);
        AttractionContent.setText(mgetAttraction.getAinfo());

        ImageView AttractionImage = (ImageView) convertView.findViewById(R.id.AttractionSavedfile);
        AttractionImage.setImageBitmap(mgetAttraction.getSavedfile());

        return convertView;
    }
}
