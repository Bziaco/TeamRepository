package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Member;
 
@Component
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Member member) {
		String sql="insert into member(mid, mpassword, mnickname, mname, mage, msex, memail, mlocal, mtel, originalfile, savedfile, mimetype) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				member.getMid(),
				member.getMpassword(),
				member.getMnickname(),
				member.getMname(),
				member.getMage(),
				member.getMsex(),
				member.getMemail(),
				member.getMlocal(),
				member.getMtel(),
				member.getOriginalfile(),
				member.getSavedfile(),
				member.getMimetype()
				);
		return row;
	}
	

	
//---------------------------------------------------------------------------------------------------------------------------------
	
		public int update(Member member) {
			String sql = "update member set mpassword=?, mnickname=?, mname=?, mage=?, msex=?, memail=?, mlocal=?, mtel=?, originalfile=?, savedfile=?, mimetype=? where mid=?";
			int row =jdbcTemplate.update(
					sql,
					member.getMpassword(),
					member.getMnickname(),
					member.getMname(),
					member.getMage(),
					member.getMsex(),
					member.getMemail(),
					member.getMlocal(),
					member.getMtel(),
					member.getOriginalfile(),
					member.getSavedfile(),
					member.getMimetype(),
					member.getMid()
					);
			return row;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------	
		
		public int delete(String mid) {
			String sql = "delete from member where mid=?";
			int row =jdbcTemplate.update(sql, mid);
			System.out.println(mid);
			return row;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------	

	
		public Member selectByMid(String mid) {
			String sql = "select mid, mpassword, mnickname, mname, mage, msex, memail, mlocal, mtel, originalfile, savedfile, mimetype from member where mid=?";
			List<Member> list = jdbcTemplate.query(sql, new Object[]{mid}, new RowMapper<Member>() {
					@Override
					public Member mapRow(ResultSet rs, int row) throws SQLException {
					Member member = new Member();
					member.setMid(rs.getString("mid"));
					member.setMpassword(rs.getString("mpassword"));
					member.setMnickname(rs.getString("mnickname"));
					member.setMname(rs.getString("mname"));
					member.setMage(rs.getInt("mage"));
					member.setMsex(rs.getString("msex"));
					member.setMemail(rs.getString("memail"));
					member.setMlocal(rs.getString("mlocal"));
					member.setMtel(rs.getString("mtel"));
					member.setOriginalfile(rs.getString("originalfile"));
					member.setSavedfile(rs.getString("savedfile"));
					member.setMimetype(rs.getString("mimetype"));
					return member;
				}
			});
			return (list.size() !=0)? list.get(0) : null;
		}
		
//---------------------------------------------------------------------------------------------------------------------------------	
		
		public String selectByMemail(String memail) {
			String sql = "select mid from member where memail=?";
			List<String> list = jdbcTemplate.query(sql, new Object[]{memail}, new RowMapper<String>(){
				@Override
				public String mapRow(ResultSet rs, int row) throws SQLException {
					return rs.getString("mid");
				}
			});
			return (list.size() !=0)? list.get(0) : null;
		}
		
		
		
		
}
