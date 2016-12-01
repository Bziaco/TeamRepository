package com.example.blueskii.myapplication.matching;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.blueskii.myapplication.R;

import java.util.List;

public class MatchingAdapter extends BaseAdapter {
    private List<Matching> list;
    public void setList(List<Matching> list) {
        this.list = list;
    }

    private Context context;
    private LayoutInflater layoutInflater;

    public MatchingAdapter(Context context) {
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
            convertView = layoutInflater.inflate(R.layout.activity_matching_list_item, null);
        }

        //data setting
        Matching matching = list.get(position);

        ImageView MatchingImage = (ImageView) convertView.findViewById(R.id.MatchingImage);
        MatchingImage.setImageBitmap(matching.getImage());

        TextView MatchingName = (TextView) convertView.findViewById(R.id.MatchingName);
        MatchingName.setText(matching.getName());

        TextView MatchingLocation = (TextView) convertView.findViewById(R.id.MatchingLocation);
        MatchingLocation.setText(matching.getLocation());

        TextView Matchingcontent = (TextView) convertView.findViewById(R.id.MatchingContent);
        Matchingcontent.setText(matching.getContent());

        return convertView;
    }
}
