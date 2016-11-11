package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.AttractionDao;
import com.mycompany.mymatch.dao.AttractionPhotoDao;
import com.mycompany.mymatch.dto.AttractionPhoto;

@Component
public class AttractionPhotoService {
	public static final int WRITE_SUCESS=0;
	public static final int WRITE_FAIL=1;
	   
	public static final int MODIFY_SUCESS=0;
	public static final int MODIFY_FAIL=1;
	   
	public static final int REMOVE_SUCESS=0;
	public static final int REMOVE_FAIL=1;
	
	@Autowired
	private AttractionPhotoDao attractionPhotoDao;
	
	public int write(AttractionPhoto attractionPhoto) {
		return WRITE_SUCESS;
	}
	
	public int moodify(AttractionPhoto attractionPhoto) {
		return MODIFY_SUCESS;
	}
	
	public int remove(int pno) {
		return REMOVE_SUCESS;
	}
	
	public AttractionPhoto info(int pno) {
		return AttractionPhotoDao.selectByPno(pno);
	}
}
