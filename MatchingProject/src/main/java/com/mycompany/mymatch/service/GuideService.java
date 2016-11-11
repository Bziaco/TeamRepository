package com.mycompany.mymatch.service;

import java.util.List;

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
	
	@Autowired
	private GuideDao guideDao;
	
	public List<Guide> list(int pageNo, int rowsPerPage){
		return guideDao.selectByPage(pageNo, rowsPerPage);
	}
	
	public boolean able(String gid){
		int row = guideDao.delete(gid);
		if(row == 0){ return false; }
		return true;
	}
	public int modify(Guide guide){
		int row = guideDao.update(guide);
		if(row == 0) { return MODIFY_FAIL; }
		return MODIFY_SUCCESS;
	}
	public int remove(String gid){
		int row = guideDao.delete(gid);
		if(row == 0){ return REMOVE_FAIL; }
		return REMOVE_SUCCESS;
	}
	public Guide info(String gid){
		return guideDao.selectByGid(gid);
	}
}
