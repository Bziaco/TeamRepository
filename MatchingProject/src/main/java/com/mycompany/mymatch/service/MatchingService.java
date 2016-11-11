package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MatchingDao;
import com.mycompany.mymatch.dto.Matching;

@Component
public class MatchingService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private MatchingDao matchingDao;
	
	public List<Matching> list(int pageNo, int rowsPerPage){
		return matchingDao.selectByPage(pageNo, rowsPerPage);
	}
	
	public int modify(Matching matching){
		int row = matchingDao.update(matching);
		if(row == 0){ return MODIFY_FAIL; }
		return MODIFY_SUCCESS;
	}
	
	public int remove(int matchno){
		int row = matchingDao.delete(matchno);
		if(row == 0) { return REMOVE_FAIL; }
		return REMOVE_SUCCESS;
	}
	
	public Matching info(int matchno){
		return matchingDao.selectByMatch(matchno);
		
	}
}
