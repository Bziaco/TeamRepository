package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Field;
import com.mycompany.mymatch.dto.Member;

@Component 
public class FieldDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

//--------------------------------------------------------------------------------------------------
	
	public int insert(Field field) {
		String sql="insert into field(fno, fname) value(?,?)";
		int row=jdbcTemplate.update(
				sql,
				field.getFno(),
				field.getFname()
				);
		return row;
	}//--번호,이름 지정(생성)

	
//--------------------------------------------------------------------------------------------------	
	
	
	public int update(Field field) {
		String sql="update field set fname=? where fno=?";
		int row=jdbcTemplate.update(
				sql,
				field.getFname(),
				field.getFno()
				);
		return row;
	}//--번호를 통한 이름변경(수정)

	
//--------------------------------------------------------------------------------------------------
	
	
	public int delete(int fno) {
		String sql = "delete from field where fno=?";
		int row =jdbcTemplate.update(sql, fno);
		return row;
	}
	
	
//----------------------------------------------------------------------------------------------------
	
	
	public Field selectByFname(int fno) {
		String sql = "select fno fname from field where fno=?";
		List<Field> list = jdbcTemplate.query(sql, new Object[]{fno}, new RowMapper<Field>() {
			@Override
			public Field mapRow(ResultSet rs, int row) throws SQLException {
			Field field = new Field();
			field.setFno(rs.getInt("fno"));
			field.setFname(rs.getString("fname"));
			return field;
			}
		});
		return (list.size() !=0)? list.get(0): null;
	}
	
	
}
