package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.TouristPossible;

@Component
public class TouristPossibleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<TouristPossible> selectByTrno(int trno) {
		String sql = "select tid, trno from touristpossible where trno=?";
		List<TouristPossible> list = jdbcTemplate.query(
			sql,
			new Object[]{trno},
			new RowMapper<TouristPossible>(){

				@Override
				public TouristPossible mapRow(ResultSet rs, int row) throws SQLException {
					TouristPossible touristPossible = new TouristPossible();
					touristPossible.setTid(rs.getString("tid"));
					touristPossible.setTrno(rs.getInt("trno"));
					return touristPossible;
				}
			}
		);
		return list;
	}
	
	
}
