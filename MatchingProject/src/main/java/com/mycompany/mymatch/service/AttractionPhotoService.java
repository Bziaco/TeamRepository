package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
		int row = attractionPhotoDao.insert(attractionPhoto);
		return WRITE_SUCESS;
	}
	
	public int moodify(AttractionPhoto attractionPhoto) {
		int row = attractionPhotoDao.update(attractionPhoto);
		if(row == 0) { return MODIFY_FAIL; }
		return MODIFY_SUCESS;
	}
	
	public int remove(int pno) {
		int row = attractionPhotoDao.delete(pno);
		if(row == 0) { return REMOVE_FAIL; }
		return REMOVE_SUCESS;
	}
	
/*	public AttractionPhoto info(int pno) {
		return attractionPhotoDao.selectByPno(pno);
	}*/
}
