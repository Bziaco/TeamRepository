package com.mycompany.mymatch.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
		return null;
	}
	
	
		
}
