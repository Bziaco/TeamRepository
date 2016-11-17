package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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

	public Attraction selectByAno(int ano) {
		String sql = "select ano, aname, alocation, latitude, hardness, beacon from attraction where ano = ?";
		List<Attraction> list = jdbcTemplate.query(sql, new Object[]{ano}, new RowMapper<Attraction> () {
			
			@Override
			public Attraction mapRow(ResultSet rs, int row) throws SQLException {
				Attraction attraction = new Attraction();
				attraction.setAno(rs.getInt("ano"));
				attraction.setAname(rs.getString("aname"));
				attraction.setAlocation(rs.getString("alocation"));
				attraction.setLatitude(rs.getInt("latitude"));
				attraction.setHardness(rs.getInt("hardness"));
				attraction.setBeacon(rs.getInt("beacon"));
				return attraction;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
}