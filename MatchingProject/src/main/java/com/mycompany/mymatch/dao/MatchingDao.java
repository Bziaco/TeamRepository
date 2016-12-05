package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Matching;

@Component
public class MatchingDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	 public int insert(Matching matching){
		String sql = "insert into matching(matchno, gid, mid, matchdate) values(seq_matching_matchno.nextval,?,?,sysdate)";
		int row = jdbcTemplate.update(
				sql,
				matching.getGid(),
				matching.getMid()
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
				match.setScore(rs.getDouble("score"));
				return match;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	
	public List<Matching> selectByGid(String gid){
		String sql = "select * from matching where gid=?";
		List<Matching> list = jdbcTemplate.query(
				sql,
				new Object[]{gid},
				new RowMapper<Matching>(){
					@Override
					public Matching mapRow(ResultSet rs, int row) throws SQLException {
						Matching matching = new Matching();
						matching.setMatchno(rs.getInt("matchno"));	
						matching.setGid(rs.getString("gid"));
						matching.setMid(rs.getString("mid"));
						matching.setMatchdate(rs.getDate("matchdate"));
						matching.setScore(rs.getDouble("score"));
						matching.setBtitle(rs.getString("btitle"));
						matching.setBcontent(rs.getString("bcontent"));
						matching.setBhitcount(rs.getInt("bhitcount"));
						matching.setBdate(rs.getDate("bdate"));
						matching.setSavedfile(rs.getString("savedfile"));
						return matching;
					}
				}
		);
		return list;
	}
	public List<Matching> selectByMid(String mid) {
		String sql = "select * from matching where mid=? order by matchdate desc";
		List<Matching> list = jdbcTemplate.query(
				sql,
				new Object[]{mid},
				new RowMapper<Matching>(){
					@Override
					public Matching mapRow(ResultSet rs, int row) throws SQLException {
						Matching matching = new Matching();
						matching.setMatchno(rs.getInt("matchno"));	
						matching.setGid(rs.getString("gid"));
						matching.setMid(rs.getString("mid"));
						matching.setMatchdate(rs.getDate("matchdate"));
						matching.setScore(rs.getDouble("score"));
						matching.setBtitle(rs.getString("btitle"));
						matching.setBcontent(rs.getString("bcontent"));
						matching.setBhitcount(rs.getInt("bhitcount"));
						matching.setBdate(rs.getDate("bdate"));
						matching.setSavedfile(rs.getString("savedfile"));
						return matching;
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
						matcing.setScore(rs.getDouble("score"));
						matcing.setMatchdate(rs.getDate("matchdate"));
						return matcing;
					}
				}
		);
		return list;
	}
	
	public int countByGid(String gid) {
		String sql = "select count(*) from matching where gid=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] {gid}, Integer.class);
		return count;
	}
	
	
	
//---------------------------------------------------------------------------------------------------------------------------------

		public List<Matching> selectByPage(int pageNo, int rowsPerPage) {
			String sql = "";
			sql += "select matchno, gid, score, matchdate, savedfile ";
			sql += "from ( ";
			sql += "	select rownum as rn, matchno, gid, score, matchdate, savedfile " ;
			sql += "	from (select matchno, gid, score, matchdate, savedfile from matching order by score desc) ";
			sql += "	where rownum<=? ";
			sql += ") ";
			sql += "where rn>=? ";
			List<Matching> list = jdbcTemplate.query(
					sql,  
					new Object[]{(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
					new RowMapper<Matching>() {
						@Override
						public Matching mapRow(ResultSet rs, int row) throws SQLException {
							Matching matching = new Matching();
							matching.setMatchno(rs.getInt("matchno"));
							matching.setGid(rs.getString("gid"));
							matching.setScore(rs.getDouble("score"));
							matching.setMatchdate(rs.getDate("matchdate"));
							matching.setSavedfile(rs.getString("savedfile"));
							return matching;
						}
					}
			);
			return list;
		}

//-------------------------------------------------------------------------------------------------------
		
		
		public List<Matching> selectKeywordByPage(String keyword, int pageNo, int rowsPerPage) {
			String sql = "";
			sql += "select matchno, gid, score, matchdate, savedfile ";
			sql += "from ( ";
			sql += "	select rownum as rn, matchno, gid, score, matchdate, savedfile " ;
			sql += "	from (select matchno, gid, score, matchdate, savedfile from matching where  gid like ?) ";
			sql += "	where rownum<=? ";
			sql += ") ";
			sql += "where rn>=? ";
			List<Matching> list = jdbcTemplate.query(
					sql,  
					new Object[]{"%"+keyword+"%", (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
					new RowMapper<Matching>() {
						@Override
						public Matching mapRow(ResultSet rs, int row) throws SQLException {
							Matching matching = new Matching();
							matching.setMatchno(rs.getInt("matchno"));
							matching.setGid(rs.getString("gid"));
							matching.setScore(rs.getDouble("score"));
							matching.setMatchdate(rs.getDate("matchdate"));
							matching.setSavedfile(rs.getString("savedfile"));
							return matching;
						}
					}
			);
			return list;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------		
		
		
		/*public Matching selectByGid(String gid) {
			String sql = "select  gid, matchno, score, matchdate, savedfile from matching where gid=?";
			List<Matching> list = jdbcTemplate.query(sql, new Object[] {gid}, new RowMapper<Matching>() {
				@Override
				public Matching mapRow(ResultSet rs, int row) throws SQLException {
					Matching matching = new Matching();
					matching.setGid(rs.getString("gid"));
					matching.setMatchno(rs.getInt("matchno"));
					matching.setScore(rs.getDouble("score"));
					matching.setMatchdate(rs.getDate("matchdate"));
					matching.setSavedfile(rs.getString("savedfile"));
					return matching;
				}
			});
			return (list.size() != 0)? list.get(0) : null;
		}*/
		
//------전체 행수-------------------------------------------------------------------------------------------------------------------------------

		public int count() {
			String sql = "select count(*) from matching";
			int count = jdbcTemplate.queryForObject(sql, Integer.class);
			return count;
		}	
		
		public int countKeyword(String keyword) {
			String sql = "select count(*) from matching where gid like ?";
			int count = jdbcTemplate.queryForObject(sql, new Object[] {"%"+keyword+"%"}, Integer.class);
			return count;
		}	
}
