package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
		String sql = "update attractionPhoto set pcontent=?, savedfile=?, where pno=?";
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

	public static AttractionPhoto selectByPno(int pno) {
		return null;
	}
}