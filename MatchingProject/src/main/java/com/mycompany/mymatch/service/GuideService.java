package com.mycompany.mymatch.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideDao;
import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Guide;

@Component
public class GuideService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	@Autowired
	private GuideDao guideDao;
	
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
	
}
