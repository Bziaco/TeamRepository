package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.FieldDao;
import com.mycompany.mymatch.dto.Field;

@Component
public class FieldService {
	@Autowired
	
	private FieldDao fieldDao;
	
	public int modify(Field field) {
		
		return ;
		}//--관심분야 이름(변경)
	

	public int remove(int fno) {
		
		return ;
	}//--관심분야 삭제

}
