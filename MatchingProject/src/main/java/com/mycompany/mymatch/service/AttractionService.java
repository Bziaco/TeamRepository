package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.AttractionDao;
import com.mycompany.mymatch.dto.Attraction;

@Component
public class AttractionService {
	   
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
		List<Attraction> list = attractionDao.selectKeywordByPage(keyword, pageNo, rowsPerPage);
		return list;
	}
	
	public int getCountKeyword(String keyword) {
		return attractionDao.countKeyword(keyword);
	}
	
	public Attraction getAttraction(int ano) {
		Attraction attraction = attractionDao.selectByAno(ano);
		return attraction;
	}
}
