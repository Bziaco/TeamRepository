package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.FavoriteField;

@Component
public class FavoriteFieldDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

//--------------------------------------------------------------------------------------------------
		
		
		public int delete(int fno) {
			String sql = "delete from favoriteField where fno=?";
			int row =jdbcTemplate.update(sql, fno);
			return row;
		}//--fno로 삭제(내용삭제)
		
		

//---------------------------------------------------------------------------------------------------------------------------------	
			
		
		public String selectByFno(int fno) {
			String sql = "select fno fname from favoriteField where fno=?";
			List<String> list = jdbcTemplate.query(sql, new Object[]{fno}, new RowMapper<String>(){
				@Override
				public String mapRow(ResultSet rs, int row) throws SQLException {
					return rs.getString("fname");
				}
			});
			return (list.size() !=0)? list.get(0) : null;
		} //--fno로 fname찾기
	
	
	
}
