package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.dto.Tourlist;

@Component
public class TourlistService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private Guide guide;
	
	public List<Tourlist> list(){
	}
	
	public int modify(){
		return MODIFY_SUCCESS;
	}
	public int remove(){
		return REMOVE_SUCCESS;
	}
	public Tourlist info(){
		
	}
}
