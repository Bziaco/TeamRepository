package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.FavoriteFieldDao;

@Component
public class FavoriteFieldService {
	@Autowired
	
	private FavoriteFieldDao favoriteFieldDao;
	
	public int remove(int fno) {
		
		return ;
	}//--관심분야 삭제

}
