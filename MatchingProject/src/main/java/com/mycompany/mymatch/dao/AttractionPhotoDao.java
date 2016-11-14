package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.AttractionPhoto;

@Component
public class AttractionPhotoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(AttractionPhoto attractionPhoto) {
		String sql = "insert into attractionphoto(pno, pcontent, savedfile) values(?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				attractionPhoto.getPno(),
				attractionPhoto.getPcontent(),
				attractionPhoto.getSavedfile()
				);
		return row;
	}
	
	public int update(AttractionPhoto attractionPhoto) {
		String sql = "update attractionPhoto set pcontent=?, savedfile=? where pno=?";
		int row = jdbcTemplate.update(
				sql,
				attractionPhoto.getPcontent(),
				attractionPhoto.getSavedfile(),
				attractionPhoto.getPno()
				);
		return row;
	}
	
	public int delete(int pno) {
		String sql = "delete from attactionphoto where pno=?";
		int row = jdbcTemplate.update(sql, pno);
		return row;
	} 

/*	public AttractionPhoto selectByPno(int pno) {
		String sql = "select pno, pcontent, psavedfile from attractionphoto where pno = ?";
		List<AttractionPhoto> list = jdbcTemplate.query(sql, new Object[]{pno}, new RowMapper<AttractionPhoto> () {
			
			@Override
			public AttractionPhoto mapRow(ResultSet rs, int row) throws SQLException {
				AttractionPhoto attractionPhoto = new AttractionPhoto();
				attractionPhoto.setPno(rs.getInt("pno"));
				attractionPhoto.set
				return attractionPhoto;
				
			}
		});
		return null;
	}*/
}