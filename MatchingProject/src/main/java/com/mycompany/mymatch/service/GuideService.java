package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideDao;
import com.mycompany.mymatch.dto.Guide;
import com.mycompany.myweb.dto.FreeBoard;

@Component
public class GuideService {

	public static final int ABLE_SUCCESS = 0;
	public static final int ABLE_FAIL = 1;
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private Guide guide;
	
	public List<Guide> list(){
	}
	
	public int able(){
		return ABLE_SUCCESS;
	}
	public int modify(){
		return MODIFY_SUCCESS;
	}
	public int remove(){
		return REMOVE_SUCCESS;
	}
	public Guide info(){
		
	}
}
