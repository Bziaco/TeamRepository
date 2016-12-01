package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.GuideSchedule;

@Component
public class GuideScheduleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(GuideSchedule guideSchedule) {
		String sql="insert into guideSchedule(sno, gid) values(?, ?)";
		int row=jdbcTemplate.update(
				sql,
				guideSchedule.getSno(),
				guideSchedule.getGid(),
				guideSchedule.getMid()
		);
		return row;
	}

	public List<GuideSchedule> selectByGid(String gid) {
		String sql = "select gid, sno from guideschedule where gid=?";
		List<GuideSchedule> list = jdbcTemplate.query(sql, new Object[] {gid}, new RowMapper<GuideSchedule>() {
			@Override
			public GuideSchedule mapRow(ResultSet rs, int index) throws SQLException {
				GuideSchedule guideSchedule = new GuideSchedule();
				guideSchedule.setGid(rs.getString("gid"));
				guideSchedule.setSno(rs.getInt("sno"));
				return guideSchedule;
			}
		});
		return list;
	}

	public GuideSchedule selectByGidSno(String gid, int sno) {
		String sql = "select gid, sno from guideschedule where gid=? and sno=?";
		List<GuideSchedule> list = jdbcTemplate.query(sql, new Object[] {gid, sno}, new RowMapper<GuideSchedule>() {
			@Override
			public GuideSchedule mapRow(ResultSet rs, int index) throws SQLException {
				GuideSchedule guideSchedule = new GuideSchedule();
				guideSchedule.setGid(rs.getString("gid"));
				guideSchedule.setSno(rs.getInt("sno"));
				return guideSchedule;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}

	public int delete(GuideSchedule guideSchedule) {
		String sql="delete from guideschedule where gid=? and sno=?";
		int row=jdbcTemplate.update(
				sql,
				guideSchedule.getGid(),
				guideSchedule.getSno()
		);
		return row;
	}


//------------추가-----------------------------------------------------------------------------------------------------
	public List<GuideSchedule> selectByMid(String mid) {
		String sql = "select mid, sno from guideschedule where mid=?";
		List<GuideSchedule> list = jdbcTemplate.query(sql, new Object[] {mid}, new RowMapper<GuideSchedule>() {
			@Override
			public GuideSchedule mapRow(ResultSet rs, int index) throws SQLException {
				GuideSchedule guideSchedule = new GuideSchedule();
				guideSchedule.setGid(rs.getString("mid"));
				guideSchedule.setSno(rs.getInt("sno"));
				return guideSchedule;
			}
		});
		return list;
	}
	
	
	
}






