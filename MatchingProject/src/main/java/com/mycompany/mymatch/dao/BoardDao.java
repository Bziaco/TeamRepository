package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Member;

@Component
public class BoardDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Board board) {
		String sql="insert into board(bno, btitle, bcontent, bwriter, bcount) values(?,?,?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				board.getBno(),
				board.getBtitle(), 
				board.getBcontent(),
				board.getBwriter(),
				board.getBcount()
				);
		return row;
	}


	
//---------------------------------------------------------------------------------------------------------------------------------

		public int update(Board board) {
			String sql = "update board set btitle=?, bcontent=?, bwriter=?, bcount=? where bno=?";
			int row=jdbcTemplate.update(
					sql,
					board.getBtitle(), 
					board.getBcontent(),
					board.getBwriter(),
					board.getBcount(),
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