package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.FieldDao;
import com.mycompany.mymatch.dto.Field;
import com.mycompany.mymatch.dto.Member;

@Component
public class FieldService {
	@Autowired
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	private static final int REMOVE_SUCESS = 0; 
	private static final int REMOVE_FAIL =1; 
	
	private FieldDao fieldDao;
	
	public int modify(Field field) {
		/*Field dbField = fieldDao.selectByFname(field.getFno());
		if(member.getMpassword().equals(member.getMpassword())==false){return MODIFY_FAIL;};
		int row = fieldDao.update(field);
		if(row !=1) {return MODIFY_FAIL;}*/
		return MODIFY_SUCCESS;
		}//--관심분야 이름
	

	public int remove(int fno) {
		int row = fieldDao.delete(fno);
		if(row == 0) {return REMOVE_FAIL;}
		return REMOVE_SUCESS;
	}//--관심분야 삭제

}
