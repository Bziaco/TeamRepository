package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Message;

@Component
public class MessageDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Message message) {
		String sql = "insert into message(mno, mcontent, mdate, mfrom, mto) values(?,?,sysdate,?,?)";
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
	
		
}
