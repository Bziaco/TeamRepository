package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Guide;
 
@Component
public class GuideDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Guide guide) {
		String sql="insert into guide(gid, glocal, gintro) values(?,?,?)";
		int row=jdbcTemplate.update(
				sql,
				guide.getGid(),
				guide.getGlocal(),
				guide.getGintro()
				);
		return row;
	}
	

	
//---------------------------------------------------------------------------------------------------------------------------------
	
	
		
}
