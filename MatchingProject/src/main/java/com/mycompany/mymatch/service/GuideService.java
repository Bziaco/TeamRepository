package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideDao;
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

}
