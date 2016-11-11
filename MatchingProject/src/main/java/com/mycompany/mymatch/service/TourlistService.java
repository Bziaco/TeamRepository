package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.TourlistDao;
import com.mycompany.mymatch.dto.Tourlist;

@Component
public class TourlistService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private TourlistDao tourlistDao;
	
	public List<Tourlist> list(int pageNo, int rowsPerPage){
		return tourlistDao.selectByPage(pageNo, rowsPerPage); 
	}
	
	public int modify(Tourlist tourlist){
		int row = tourlistDao.update(tourlist);
		if(row == 0) {return MODIFY_FAIL ; }
		return MODIFY_SUCCESS;
	}
	public int remove(String tid){
		int row = tourlistDao.delete(tid);
		if(row == 0) { return REMOVE_FAIL; }
		return REMOVE_SUCCESS;
	}
	public Tourlist info(String tid){
		return tourlistDao.selectByTid(tid);
		
	}
}
