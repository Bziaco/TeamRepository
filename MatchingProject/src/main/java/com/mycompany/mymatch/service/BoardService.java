package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.BoardDao;
import com.mycompany.mymatch.dto.Board;


@Component
public class BoardService {	
	@Autowired
	private BoardDao boardDao;
	
	public void write(Board board) {
		boardDao.insert(board);
	}
	
}
