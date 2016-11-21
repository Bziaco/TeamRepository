package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

	public List<Board> selectByPage(int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select bno, btitle, bcontent, bhitcount, mid, bdate ";
		sql += "from ( ";
		sql += "	select rownum as rn, bno, btitle, bcontent, bhitcount, mid, bdate " ;
		sql += "	from (select bno, btitle, bcontent, bhitcount, mid, bdate from board order by bno desc) ";
		sql += "	where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<Board> list = jdbcTemplate.query(
				sql,  
				new Object[]{(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
				new RowMapper<Board>() {
					@Override
					public Board mapRow(ResultSet rs, int row) throws SQLException {
						Board board = new Board();
						board.setBno(rs.getInt("bno"));
						board.setBtitle(rs.getString("btitle"));
						board.setBcontent(rs.getString("bcontent"));
						board.setBhitcount(rs.getInt("bhitcount"));
						board.setMid(rs.getString("mid"));
						board.setBdate(rs.getDate("bdate"));
						return board;
					}
				}
		);
		return list;
	}
		
//---------------------------------------------------------------------------------------------------------------------------------	

	
	public int delete(int bno) {
		String sql = "delete from board where bno=?";
		int row = jdbcTemplate.update(sql, bno);
		return row;
	}

	
//---------------------------------------------------------------------------------------------------------------------------------		
	
	
	public Board selectByBno(int bno) {
		String sql = "select bno, btitle, bcontent, mid, bhitcount, bdate from board where bno=?";
		List<Board> list = jdbcTemplate.query(sql, new Object[] {bno}, new RowMapper<Board>() {
			@Override
			public Board mapRow(ResultSet rs, int row) throws SQLException {
				Board board = new Board();
				board.setBno(rs.getInt("bno"));
				board.setBtitle(rs.getString("btitle"));
				board.setBcontent(rs.getString("bcontent"));
				board.setMid(rs.getString("mid"));
				board.setBhitcount(rs.getInt("bhitcount"));
				board.setBdate(rs.getDate("bdate"));
				return board;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	

}






