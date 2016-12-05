package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.GuideRequest;
import com.mycompany.mymatch.dto.Member;

@Component
public class GuideRequestDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int insert(GuideRequest guideRequest) {
		String sql = "insert into guiderequest(grno, mid, bminor, requestdate) values(seq_guide_request_grno.nextval,?,?,sysdate)";
		int row = jdbcTemplate.update(sql, guideRequest.getMid(), guideRequest.getBminor());
		return row;
	}

	public GuideRequest select(GuideRequest guideRequest) {
		String sql = "select grno, mid, bminor, requestdate from guideRequest where mid=? and bminor=?";
		List<GuideRequest> list = jdbcTemplate.query(sql,
				new Object[] { guideRequest.getMid(), guideRequest.getBminor() }, new RowMapper<GuideRequest>() {
					@Override
					public GuideRequest mapRow(ResultSet rs, int row) throws SQLException {
						GuideRequest guideRequest = new GuideRequest();
						guideRequest.setGrno(rs.getInt("grno"));
						guideRequest.setMid(rs.getString("mid"));
						guideRequest.setBminor(rs.getInt("bminor"));
						guideRequest.setRequestdate(rs.getDate("requestdate"));
						return guideRequest;
					}
				});
		return (list.size() != 0) ? list.get(0) : null;
	}

	public List<GuideRequest> selectByBeacon(int beacon) {
		String sql = "select grno, mid, bminor, requestdate from guideRequest where bminor=?";
		List<GuideRequest> list = jdbcTemplate.query(sql,
				new Object[] {beacon}, new RowMapper<GuideRequest>() {
					@Override
					public GuideRequest mapRow(ResultSet rs, int row) throws SQLException {
						GuideRequest guideRequest = new GuideRequest();
						guideRequest.setGrno(rs.getInt("grno"));
						guideRequest.setMid(rs.getString("mid"));
						guideRequest.setBminor(rs.getInt("bminor"));
						guideRequest.setRequestdate(rs.getDate("requestdate"));
						return guideRequest;
					}
				});
		return list;
	}

	public int removeByGrno(int grno) {
		String sql = "delete from guiderequest where grno=?";
		int row =jdbcTemplate.update(sql, grno);
		return row;
	}
}
