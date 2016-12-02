package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.GuidePossible;

@Component
public class GuidePossibleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<GuidePossible> selectByGrno(int grno) {
		String sql = "select gid, grno from guidepossible where grno=?";
		List<GuidePossible> list = jdbcTemplate.query(
			sql,
			new Object[]{grno},
			new RowMapper<GuidePossible>(){

				@Override
				public GuidePossible mapRow(ResultSet rs, int row) throws SQLException {
					GuidePossible guidePossible = new GuidePossible();
					guidePossible.setGid(rs.getString("gid"));
					guidePossible.setGrno(rs.getInt("grno"));
					return guidePossible;
				}
			}
		);
		return list;
	}

	public int insert(GuidePossible guidePossible) {
		String sql = "insert into guidepossible(gid, grno) values(?,?)";
		int row = jdbcTemplate.update(
				sql,
				guidePossible.getGid(),
				guidePossible.getGrno()
				);
		return row;
	}
	
	
}
