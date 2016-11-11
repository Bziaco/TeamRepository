package com.mycompany.mymatch.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Attraction;

@Component
public class AttractionDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Attraction attraction) {
		String sql = "insert into attraction(ano, aname, alocation, latitude, hardness, beacon) values(?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAno(),
				attraction.getAname(),
				attraction.getAlocation(),
				attraction.getLatitude(),
				attraction.getHardness(),
				attraction.getBeacon()
				);
		return row;
	}
	
	public int update(Attraction attraction) {
		String sql = "update attraction set aname=?, aloction=?, latitude=?, hardness=?, beacon=? where ano=?";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAname(),
				attraction.getAlocation(),
				attraction.getLatitude(),
				attraction.getHardness(),
				attraction.getBeacon(),
				attraction.getAno()
				);
		return row;
	}
	
	public int delete(int ano) {
		String sql = "delete from attraction where ano=?";
		int row = jdbcTemplate.update(sql, ano);
		return row;
	}

	public static Attraction selectByAno(int ano) {
		return null;
	}
}