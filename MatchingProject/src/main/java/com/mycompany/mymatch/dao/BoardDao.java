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
		String sql="insert into board(bwriter, btitle, bcontent) values(?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				board.getBwriter(),
				board.getBtitle(), 
				board.getBcontent()
				);
		return row;
	}


	
//---------------------------------------------------------------------------------------------------------------------------------

		public int update(Board board) {
			String sql = "update board set bwriter=?, btitle=?, bcontent=? where bno=?";
			int row=jdbcTemplate.update(
					sql,
					board.getBwriter(),
					board.getBtitle(), 
					board.getBcontent(),
					board.getBno()
					);
			return row;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------	
		
		public int delete(int bno) {
			String sql = "delete from board where bno=?";
			int row =jdbcTemplate.update(sql, bno);
			return row;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------	

	

}