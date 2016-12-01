package com.mycompany.mymatch.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.AttractionDao;
import com.mycompany.mymatch.dao.GuideDao;
import com.mycompany.mymatch.dao.GuidePossibleDao;
import com.mycompany.mymatch.dao.GuideRequestDao;
import com.mycompany.mymatch.dao.MemberDao;
import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.dto.GuidePossible;
import com.mycompany.mymatch.dto.GuideRequest;
import com.mycompany.mymatch.dto.Member;

@Component
public class GuideService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	public static final int GUIDE_REQUEST_SUCCESS = 0;
	public static final int GUIDE_REQUEST_FAIL = 1;
	
	@Autowired
	private GuideDao guideDao;
	
	@Autowired
	private GuideRequestDao guideRequestDao;
	
	@Autowired
	private AttractionDao attractionDao;
	
	@Autowired
	private GuidePossibleDao guidePossibleDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Guide guide) {
		guideDao.insert(guide);
		return JOIN_SUCCESS;
	}

	public List<Guide> findGuide(String glocal) {
		List<Guide> list= guideDao.selectByGlocal(glocal);
		return list;
	}
	
	public Guide getList(String gid) {
		Guide guide = guideDao.selectByGid(gid);
		return guide;
	}
	
	public int requestMatchingGuide(GuideRequest guideRequest){
		guideRequestDao.insert(guideRequest);
		return GUIDE_REQUEST_SUCCESS;
	}

	public List<Guide> receiveMatchingGuide(GuideRequest guideRequest) {
		GuideRequest dbGuideRequest = guideRequestDao.select(guideRequest);
		List<GuidePossible> guidePossibleList = guidePossibleDao.selectByGrno(dbGuideRequest.getGrno());
		List<Guide> guideList = new ArrayList<Guide>();
		for(GuidePossible guidePossible : guidePossibleList){
			Guide guide = guideDao.selectByGid(guidePossible.getGid());
			Member member = memberDao.selectByMid(guide.getGid());
			guide.setMname(member.getMname());
			guide.setSavedfile(member.getSavedfile());
			guideList.add(guide);
		}
		return guideList;
	}
	
}
