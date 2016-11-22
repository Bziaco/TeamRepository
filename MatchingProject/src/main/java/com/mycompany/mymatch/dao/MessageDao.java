package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Message;

@Component
public class MessageDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Message message) {
		String sql = "insert into message(mno, mcontent, mdate, mfrom, mto) values(seq_message_mno.nextval,?,sysdate,?,?)";
		int row = jdbcTemplate.update (
				sql,
				message.getMcontent(),
				message.getMfrom(),
				message.getMto()
		);
		return row;
	}
	
	
	public List<Message> selectMessage(String mid, String chatter) {
		String sql = "select mno, mcontent, mdate, mfrom, mto from message where (mfrom=? and mto=?) or (mfrom=? and mto=?) order by mdate desc";
		List<Message> list = jdbcTemplate.query(sql, new Object[]{mid, chatter, chatter, mid}, new RowMapper<Message>() {
			@Override
			public Message mapRow(ResultSet rs, int row) throws SQLException {
				Message message = new Message();
				message.setMno(rs.getInt("mno"));
				message.setMcontent(rs.getString("mcontent"));
				message.setMdate(rs.getDate("mdate"));
				message.setMfrom(rs.getString("mfrom"));
				message.setMto(rs.getString("mto"));
				return message;
			}
		});
		return list;
	}		
}
