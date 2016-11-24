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
	
	/*public int write(Attraction attraction) {
		int row = attractionDao.insert(attraction);
		return WRITE_SUCESS;
	}
	
	public int modify(Attraction attraction) {
		int row = attractionDao.update(attraction);
		if(row == 0) { return MODIFY_FAIL; }
		return MODIFY_SUCESS;
	}
	
	public int remove(int ano) {
		int row = attractionDao.delete(ano);
		if(row == 0) { return REMOVE_FAIL; }
		return REMOVE_SUCESS;
	}*/
	
	/*public Attraction attrac(int ano) {
		Attraction attraction = attractionDao.selectByAno(ano);
		return attraction;
	}*/
	
	public List<Attraction> attrac(String aname) {
		List<Attraction> list= attractionDao.selectByAname(aname);
		return list;
	}
	
	public List<Attraction> getList(int pageNo, int rowsPerPage) {
		List<Attraction> list = attractionDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public int getCount() {
		return attractionDao.count();
	}
}
