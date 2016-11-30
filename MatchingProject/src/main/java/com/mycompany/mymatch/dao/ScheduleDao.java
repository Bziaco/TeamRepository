package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Schedule;

@Component
public class ScheduleDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Schedule schedule) {
		String sql="insert into schedule(sno, stitle, scontent, mid, sdate, sstart, send) values(seq_schedule_sno.nextval, ?, ?, ?, sysdate, ?, ?)";
		int row=jdbcTemplate.update(
				sql,
				schedule.getStitle(),
				schedule.getScontent(),
				schedule.getMid(),
				schedule.getSstart(),
				schedule.getSend()
		);
		return row;
	}
	

	
//---------------------------------------------------------------------------------------------------------------------------------

	public List<Schedule> selectByPage(int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select sno, stitle, scontent, mid, sdate, sstart, send ";
		sql += "from ( ";
		sql += "	select rownum as rn, sno, stitle, scontent, mid, sdate, sstart, send " ;
		sql += "	from (select sno, stitle, scontent, mid, sdate, sstart, send from schedule order by sno desc) ";
		sql += "	where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<Schedule> list = jdbcTemplate.query(
				sql,  
				new Object[]{(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
				new RowMapper<Schedule>() {
					@Override
					public Schedule mapRow(ResultSet rs, int row) throws SQLException {
						Schedule schedule = new Schedule();
						schedule.setSno(rs.getInt("sno"));
						schedule.setStitle(rs.getString("stitle"));
						schedule.setScontent(rs.getString("scontent"));
						schedule.setMid(rs.getString("mid"));
						schedule.setSdate(rs.getDate("sdate"));
						schedule.setSstart(rs.getDate("sstart"));
						schedule.setSend(rs.getDate("send"));
						return schedule;
					}
				}
		);
		return list;
	}

//-------------------------------------------------------------------------------------------------------
	
	
	public List<Schedule> selectKeywordByPage(String keyword, int pageNo, int rowsPerPage) {
		String sql = "";
		sql += "select sno, stitle, scontent, mid, sdate, sstart, send ";
		sql += "from ( ";
		sql += "	select rownum as rn, sno, stitle, scontent, mid, sdate, sstart, send " ;
		sql += "	from (select sno, stitle, scontent, mid, sdate, sstart, send from schedule where  stitle like ? or  scontent like ? or mid like ?) ";
		sql += "	where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<Schedule> list = jdbcTemplate.query(
				sql,  
				new Object[]{"%"+keyword+"%", "%"+keyword+"%", "%"+keyword+"%", (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
				new RowMapper<Schedule>() {
					@Override
					public Schedule mapRow(ResultSet rs, int row) throws SQLException {
						Schedule schedule = new Schedule();
						schedule.setSno(rs.getInt("sno"));
						schedule.setStitle(rs.getString("stitle"));
						schedule.setScontent(rs.getString("scontent"));
						schedule.setMid(rs.getString("mid"));
						schedule.setSdate(rs.getDate("sdate"));
						schedule.setSstart(rs.getDate("sstart"));
						schedule.setSend(rs.getDate("send"));
						return schedule;
					}
				}
		);
		return list;
	}
		
//---------------------------------------------------------------------------------------------------------------------------------	

	
	public int delete(int sno) {
		String sql = "delete from board where sno=?";
		int row = jdbcTemplate.update(sql, sno);
		return row;
	}

	
//---------------------------------------------------------------------------------------------------------------------------------		
	
	
	public Schedule selectBySno(int sno) {
		String sql = "select sno, stitle, scontent, mid, sdate, sstart, send from schedule where sno=?";
		List<Schedule> list = jdbcTemplate.query(sql, new Object[] {sno}, new RowMapper<Schedule>() {
			@Override
			public Schedule mapRow(ResultSet rs, int row) throws SQLException {
				Schedule schedule = new Schedule();
				schedule.setSno(rs.getInt("sno"));
				schedule.setStitle(rs.getString("stitle"));
				schedule.setScontent(rs.getString("scontent"));
				schedule.setMid(rs.getString("mid"));
				schedule.setSdate(rs.getDate("sdate"));
				schedule.setSstart(rs.getDate("sstart"));
				schedule.setSend(rs.getDate("send"));
				return schedule;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	
	
	
//------수정한부분-------------------------------------------------------------------------------------------------------------------------------
	
	public int update(Schedule schedule) {
		String sql = "update schedule set stitle=?, scontent=? where sno=?";
		int row = jdbcTemplate.update(
				sql,
				schedule.getStitle(),
				schedule.getScontent(),
				schedule.getSno()
		);
		return row;
	}
	
//------전체 행수-------------------------------------------------------------------------------------------------------------------------------

	public int count() {
		String sql = "select count(*) from schedule";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}	
	
	public int countKeyword(String keyword) {
		String sql = "select count(*) from schedule where stitle like ? or scontent like ? or mid like ?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {"%"+keyword+"%", "%"+keyword+"%", "%"+keyword+"%"}, Integer.class);
		return count;
	}	
	
}






