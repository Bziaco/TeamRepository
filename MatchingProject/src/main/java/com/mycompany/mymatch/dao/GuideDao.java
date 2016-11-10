package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Guide;

@Component
public class GuideDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Guide guide){
		String sql = "insert into guide(gid, glocal, gintro, gable) values(?,?,?,false)";
		int row = jdbcTemplate.update(
				sql,
				guide.getGid(),
				guide.getGlocal(),
				guide.getGintro()
		);
		return row;
	}
	public int update(Guide guide){
		String sql = "update guide set gable=? where gid=?";
		int row = jdbcTemplate.update(
				sql,
				guide.isGable(),
				guide.getGid()
		);
		return row;
	}
	
	public int delete(String gid){
		String sql = "delete from guide where gid = ?";
		int row = jdbcTemplate.update(sql, Integer.parseInt(gid));
		return row;
	}
	
	public Guide selectByGid(String gid) {
		String sql = "select gid, glocal, gintro from guide where gid = ?";
		List<Guide> list = jdbcTemplate.query(sql, new Object[]{gid}, new RowMapper<Guide> () {

			@Override
			public Guide mapRow(ResultSet rs, int row) throws SQLException {
				Guide guide = new Guide();
				guide.setGid(rs.getString("gid"));
				guide.setGlocal(rs.getString("glocal"));
				guide.setGintro(rs.getString("gintro"));
				return guide;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
}
