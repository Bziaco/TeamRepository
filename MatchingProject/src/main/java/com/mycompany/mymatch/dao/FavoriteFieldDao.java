package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.FavoriteField;
import com.mycompany.mymatch.dto.Field;
 
@Component
public class FavoriteFieldDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	

//--------------------------------------------------------------------------------------------------
	
		public int insert(FavoriteField favoriteField) {
			String sql="insert into field(fno, mid) value(?,?)";
			int row=jdbcTemplate.update(
					sql,
					favoriteField.getfno(),
					favoriteField.getmid()
					);
			return row;
		}//--번호,이름 지정(생성)	
	
	

//--------------------------------------------------------------------------------------------------
		
		
		public int delete(int fno) {
			String sql = "delete from favoriteField where fno=?";
			int row =jdbcTemplate.update(sql, fno);
			return row;
		}//--fno로 삭제(내용삭제)
		
		

//---------------------------------------------------------------------------------------------------------------------------------	
			
		
		public List<FavoriteField> selectByMid(String mid) {
			String sql = "select fno, fname from favoriteField where fno=?";
			List<FavoriteField> list = jdbcTemplate.query(sql, new Object[]{mid}, new RowMapper<FavoriteField>(){
				@Override
				public FavoriteField mapRow(ResultSet rs, int row) throws SQLException {
					FavoriteField ff = new FavoriteField();
					ff.setFfno(rs.getInt("fno"));
					ff.setFmid(rs.getString("mid"));
					return ff;
				}
			});
			return list;
		} //--fno로 fname찾기
	
	
	
}
