package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.BoardDao;


@Component
public class BoardService {

	@Autowired
	public static final int WRITE_SUCCESS = 0;
	public static final int WRITE_FAIL =1;
	
	@Autowired
	private BoardDao boardDao;
	
}
