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
				message.getMno(),
				message.getMcontent(),
				message.getMdate(),
				message.getMfrom(),
				message.getMto()
				);
		return row;
	}
	
	
	public List<Message> selectBymto(String mid) {
		String sql = "select mno, mcontent, mdate, mfrom, mto from message where mno=?";
		List<Message> list = jdbcTemplate.query(sql, new Object[]{mid}, new RowMapper<Message>(){
			@Override
			public Message mapRow(ResultSet rs, int row) throws SQLException {
				Message ms = new Message();
				ms.setMno(rs.getInt("mno"));
				return ms;
			}
		});
		return null;
	}
	
	
		
}
