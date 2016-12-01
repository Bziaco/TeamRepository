package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Guide;
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

	public Tourist selectByTid(String tid) {
		String sql = "select tid, tlocal, tintro, tenddate, tstartdate from tourlist where tid = ?";
		List<Tourist> list = jdbcTemplate.query(sql, new Object[]{tid}, new RowMapper<Tourist> () {

			@Override
			public Tourist mapRow(ResultSet rs, int row) throws SQLException {
				Tourist tourist = new Tourist();
				tourist.setTid(rs.getString("tid"));
				tourist.setTlocal(rs.getString("tlocal"));
				tourist.setTintro(rs.getString("tintro"));
				tourist.setTenddate(rs.getDate("tenddate"));
				tourist.setTstartdate(rs.getDate("tstartdate"));
				return tourist;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
}
