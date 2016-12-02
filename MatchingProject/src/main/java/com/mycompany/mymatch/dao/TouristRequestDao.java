package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.GuideRequest;
import com.mycompany.mymatch.dto.TouristRequest;

@Component
public class TouristRequestDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(TouristRequest touristRequest) {
		String sql="insert into touristrequest(trno, mid, bminor, requestdate) values(seq_guide_request_grno.nextval,?,?,sysdate)";
		int row=jdbcTemplate.update(
				sql,
				touristRequest.getMid(),
				touristRequest.getBminor()
				);
		return row;
	}

	public TouristRequest select(TouristRequest touristRequest) {
		String sql = "select trno, mid, bminor, requestdate from touristrequest where mid=? and bminor=?";
		List<TouristRequest> list = jdbcTemplate.query(sql, new Object[]{touristRequest.getMid(), touristRequest.getBminor()}, new RowMapper<TouristRequest>() {
			@Override
			public TouristRequest mapRow(ResultSet rs, int row) throws SQLException {
				TouristRequest touristRequest = new TouristRequest();
				touristRequest.setTrno(rs.getInt("trno"));
				touristRequest.setMid(rs.getString("mid"));
				touristRequest.setBminor(rs.getInt("bminor"));
				touristRequest.setRequestdate(rs.getDate("requestdate"));
			return touristRequest;
		}
	});
	return (list.size() !=0)? list.get(0) : null;
	}

	public Object selectBySysdate(Date requestdate) {
		
		String sql = "select trno, mid, bminor, requestdate from touristrequest where mid=? and bminor=?";
		List<TouristRequest> list = jdbcTemplate.query(sql, new Object[]{requestdate.getTime()}, new RowMapper<TouristRequest>() {
			@Override
			public TouristRequest mapRow(ResultSet rs, int row) throws SQLException {
				TouristRequest touristRequest = new TouristRequest();
				touristRequest.setTrno(rs.getInt("trno"));
				touristRequest.setMid(rs.getString("mid"));
				touristRequest.setBminor(rs.getInt("bminor"));
				touristRequest.setRequestdate(rs.getDate("requestdate"));
			return touristRequest;
		}
	});
	return (list.size() !=0)? list.get(0) : null;
	}

}
