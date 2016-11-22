package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Matching;
import com.mycompany.mymatch.dto.Tourist;

@Component
public class MatchingDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Matching matching){
		String sql = "insert into matching(matchno, matchdate, score, bno, btitle, bcontent, bwriter, bhitcount, bdate, savedfile) values(seq_matching_matchno.nextval,sysdate,?,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				matching.getMatchno(),
				matching.getScore(),
				matching.getBno(),
				matching.getBtitle(),
				matching.getBcontent(),
				matching.getBwriter(),
				matching.getBhitcount(),
				matching.getBdate(),
				matching.getSavedfile()
		);
		return row;
	}
	public int update(Matching matching){
		String sql = "update matching set score=?, btitle=?, bcontent=?, savedfile=? where gid=?";
		int row = jdbcTemplate.update(
				sql,
				matching.getScore(),
				matching.getBtitle(),
				matching.getBcontent(),
				matching.getSavedfile(),
				matching.getGid()
		);
		return row;
	}
	
	public int delete(int matchno){
		String sql = "delete from matching where matchno = ?";
		int row = jdbcTemplate.update(sql, matchno);
		return row;
	}
	
	public Matching selectByMatch(int matchno) {
		String sql = "select matchno, matchdate, score from matching where matchno = ?";
		List<Matching> list = jdbcTemplate.query(sql, new Object[]{matchno}, new RowMapper<Matching> () {

			@Override
			public Matching mapRow(ResultSet rs, int row) throws SQLException {
				Matching match = new Matching();
				match.setMatchno(rs.getInt("matchno"));
				match.setScore(rs.getInt("score"));
				return match;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	
	public List<Matching> selectByGid(int pageNo, int rowsPerPage, String gid){
		String sql = "";
		sql += "select rn, matchno, score, matchdate";
		sql += "from ( ";
		sql += "select rownum as rn, matchno, score, matchdate";
		sql += "from (select matchno, score, matchdate from matching where gid=? order by matchno ) ";
		sql += "where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<Matching> list = jdbcTemplate.query(
				sql,
				new Object[]{gid,(pageNo*rowsPerPage),(pageNo-1)*rowsPerPage+1},
				new RowMapper<Matching>(){

					@Override
					public Matching mapRow(ResultSet rs, int row) throws SQLException {
						Matching matcing = new Matching();
				
						matcing.setMatchno(rs.getInt("matchno"));
						matcing.setScore(rs.getInt("score"));
						matcing.setMatchdate(rs.getDate("matchdate"));
						return matcing;
					}
				}
		);
		return list;
	}
	public List<Matching> selectByMid(int pageNo, int rowsPerPage, String mid){
		String sql = "";
		sql += "select rn, matchno, score, matchdate";
		sql += "from ( ";
		sql += "select rownum as rn, matchno, score, matchdate";
		sql += "from (select matchno, score, matchdate from matching where mid=? order by matchno ) ";
		sql += "where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<Matching> list = jdbcTemplate.query(
				sql,
				new Object[]{mid,(pageNo*rowsPerPage),(pageNo-1)*rowsPerPage+1},
				new RowMapper<Matching>(){

					@Override
					public Matching mapRow(ResultSet rs, int row) throws SQLException {
						Matching matcing = new Matching();
				
						matcing.setMatchno(rs.getInt("matchno"));
						matcing.setScore(rs.getInt("score"));
						matcing.setMatchdate(rs.getDate("matchdate"));
						return matcing;
					}
				}
		);
		return list;
	}
}
