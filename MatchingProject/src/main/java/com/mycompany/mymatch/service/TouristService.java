package com.mycompany.mymatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MemberDao;
import com.mycompany.mymatch.dao.TouristPossibleDao;
import com.mycompany.mymatch.dao.TouristRequestDao;
import com.mycompany.mymatch.dao.TourlistDao;
import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.dto.Tourist;
import com.mycompany.mymatch.dto.TouristPossible;
import com.mycompany.mymatch.dto.TouristRequest;

@Component
public class TouristService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	public static final int TOURIST_REQUEST_SUCCESS = 0;
	public static final int TOURIST_REQUEST_FAIL = 1;
	
	@Autowired
	private TourlistDao touristDao;
	
	@Autowired
	private TouristRequestDao touristRequestDao;
	
	@Autowired
	private TouristPossibleDao touristPossibleDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Tourist tourist) {
		touristDao.insert(tourist);
		return JOIN_SUCCESS;
	}
	
	public int requestMatchingTourist(TouristRequest touristRequest){
		touristRequestDao.insert(touristRequest);
		return TOURIST_REQUEST_SUCCESS;
	}

	public List<Tourist> receiveMatchingTourist(TouristRequest touristRequest) {
		TouristRequest dbTouristRequest = touristRequestDao.select(touristRequest);
		List<TouristPossible> touristPossibleList = touristPossibleDao.selectByTrno(dbTouristRequest.getTrno());
		List<Tourist> touristList = new ArrayList<Tourist>();
		for(TouristPossible touristPossible : touristPossibleList){
			Tourist tourist = touristDao.selectByTid(touristPossible.getTid());
			Member member = memberDao.selectByMid(tourist.getTid());
			tourist.setMname(member.getMname());
			tourist.setSavedfile(member.getSavedfile());
			touristList.add(tourist);
		}
		return touristList;
	}
}
