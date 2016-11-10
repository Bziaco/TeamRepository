package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Matching;

@Component
public class MatchingService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	@Autowired
	private Matching matching;
	
	public List<Matching> list(){
	}
	
	public int modify(){

		return MODIFY_SUCCESS;
	}
	
	public Matching info(){
		
	}
}
