package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.AttractionDao;
import com.mycompany.mymatch.dto.Attraction;

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
	
	public int write(Attraction attraction) {
		return WRITE_SUCESS;
	}
	
	public int modify(Attraction attraction) {
		return MODIFY_SUCESS;
	}
	
	public int remove(int ano) {
		return REMOVE_SUCESS;
	}
	
	public Attraction info(int ano) {
		return AttractionDao.selectByAno(ano);
	}
}
