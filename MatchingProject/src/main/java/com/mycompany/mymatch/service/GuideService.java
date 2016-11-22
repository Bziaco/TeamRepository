package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideDao;
import com.mycompany.mymatch.dto.Guide;

@Component
public class GuideService {

	@Autowired
	private GuideDao guideDao;

	public List<Guide> findGuide(String glocal) {
		List<Guide> list= guideDao.selectByGlocal(glocal);
		return list;
	}
	
}
