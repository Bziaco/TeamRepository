package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.AttractionDao;
import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Guide;

@Component
public class AttractionService {
	public static final int WRITE_SUCESS=0;
	public static final int WRITE_FAIL=1;
	   
	public static final int MODIFY_SUCESS=0;
	public static final int MODIFY_FAIL=1;
	
	public static final int REMOVE_SUCESS=0;
	public static final int REMOVE_FAIL=1;
	   
	@Autowired
	private  AttractionDao attractionDao;
	
	public List<Attraction> getList(int pageNo, int rowsPerPage) {
		List<Attraction> list = attractionDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public int getCount() {
		return attractionDao.count();
	}

	public List<Attraction> getListKeyword(String keyword, int pageNo, int rowsPerPage) {
		List<Attraction> list = attractionDao.selectByPage(keyword, pageNo, rowsPerPage);
		return list;
	}
	
	public int getCountKeyword(String keyword) {
		return attractionDao.count(keyword);
	}	
}
