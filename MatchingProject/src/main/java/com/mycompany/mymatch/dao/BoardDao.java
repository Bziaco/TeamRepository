package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Board;

@Component
public class BoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Board board) {
		String sql="insert into board(bno, btitle, bcontent, bhitcount, mid, bdate) values(seq_board_bno.nextval, ?, ?, 0, ?, sysdate)";
		int row=jdbcTemplate.update(
				sql,
				board.getBtitle(),
				board.getBcontent(), 
				board.getMid()
		);
		return row;
	}


	
//---------------------------------------------------------------------------------------------------------------------------------

		
//---------------------------------------------------------------------------------------------------------------------------------	
		

	

}