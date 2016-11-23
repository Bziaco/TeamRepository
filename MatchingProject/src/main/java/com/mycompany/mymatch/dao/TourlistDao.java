package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Tourist;

@Component
public class TourlistDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Tourist tourist) {
		String sql="insert into tourlist(tid, tlocal, tstartdate, tenddate, tintro) values(?,?,?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				tourist.getTid(),
				tourist.getTlocal(),
				tourist.getTstartdate(),
				tourist.getTenddate(),
				tourist.getTintro()
				);
		return row;
	}
}
