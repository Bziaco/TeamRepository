package com.mycompany.mymatch.service;

import java.util.List;

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
	
	public List<Board> getList(int pageNo, int rowsPerPage) {
		List<Board> list = boardDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public List<Board> getListKeyword(String keyword, int pageNo, int rowsPerPage) {
		List<Board> list = boardDao.selectKeywordByPage(keyword, pageNo, rowsPerPage);
		return list;
	}	
	
	public int delete(int bno) {
		int row = boardDao.delete(bno);
		return row;
	}
	
	public Board getBoard(int bno) {
		Board board = boardDao.selectByBno(bno);
		return board;
	}
	
	public int update(Board board) {
		int row = boardDao.update(board);
		return row;
	}
	
	public int getCount() {
		return boardDao.count();
	}
	
	public int getCountKeyword(String keyword) {
		return boardDao.countKeyword(keyword);
	}	
		
}
