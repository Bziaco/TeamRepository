package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Guide;

@Component
public class AttractionDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Attraction attraction) {
		String sql = "insert into attraction(ano, aname, ainfo, alocation, latitude, hardness, beacon) values(?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAno(),
				attraction.getAname(),
				attraction.getAinfo(),
				attraction.getAlocation(),
				attraction.getLatitude(),
				attraction.getHardness(),
				attraction.getBeacon()
				);
		return row;
	}
	
	public int update(Attraction attraction) {
		String sql = "update attraction set aname=?, ainfo=?, aloction=?, latitude=?, hardness=?, beacon=? where ano=?";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAname(),
				attraction.getAinfo(),
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
		String sql = "select ano, aname, ainfo, alocation, latitude, hardness, beacon from attraction where ano = ?";
		List<Attraction> list = jdbcTemplate.query(sql, new Object[]{ano}, new RowMapper<Attraction> () {
			
			@Override
			public Attraction mapRow(ResultSet rs, int row) throws SQLException {
				Attraction attraction = new Attraction();
				attraction.setAno(rs.getInt("ano"));
				attraction.setAname(rs.getString("aname"));
				attraction.setAinfo(rs.getString("ainfo"));
				attraction.setAlocation(rs.getString("alocation"));
				attraction.setLatitude(rs.getInt("latitude"));
				attraction.setHardness(rs.getInt("hardness"));
				attraction.setBeacon(rs.getInt("beacon"));
				return attraction;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	
	
	
//---------------------------------------------------------------------------------------------------------------------------------

		public List<Attraction> selectByPage(int pageNo, int rowsPerPage) {
			String sql = "";
			sql += "select ano, aname, ainfo, alocation, latitude, hardness, beacon ";
			sql += "from ( ";
			sql += "	select rownum as rn, ano, aname, ainfo, alocation, latitude, hardness, beacon " ;
			sql += "	from (select ano, aname, ainfo, alocation, latitude, hardness, beacon from attraction order by ano desc) ";
			sql += "	where rownum<=? ";
			sql += ") ";
			sql += "where rn>=? ";
			List<Attraction> list = jdbcTemplate.query(
					sql,  
					new Object[]{(pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
					new RowMapper<Attraction>() {
						@Override
						public Attraction mapRow(ResultSet rs, int row) throws SQLException {
							Attraction attraction = new Attraction();
							attraction.setAno(rs.getInt("ano"));
							attraction.setAname(rs.getString("aname"));
							attraction.setAinfo(rs.getString("ainfo"));
							attraction.setAlocation(rs.getString("alocation"));
							attraction.setLatitude(rs.getInt("latitude"));
							attraction.setHardness(rs.getInt("hardness"));
							attraction.setBeacon(rs.getInt("beacon"));
							return attraction;
						}
					}
			);
			return list;
		}
		
//---------------------------------------------------------------------------------------------------
		
		public List<Attraction> selectByAname(String aname) {
			String sql = "select ano, aname, ainfo, alocation, latitude, hardness, beacon from attraction where aname=?";
			List<Attraction> list = jdbcTemplate.query(
					sql,
					new Object[]{aname},
					new RowMapper<Attraction>(){

						@Override
						public Attraction mapRow(ResultSet rs, int row) throws SQLException {
							Attraction attraction = new Attraction();
							attraction.setAno(rs.getInt("ano"));
							attraction.setAname(rs.getString("aname"));
							attraction.setAinfo(rs.getString("ainfo"));
							attraction.setAlocation(rs.getString("alocation"));
							attraction.setLatitude(rs.getInt("latitude"));
							attraction.setHardness(rs.getInt("hardness"));
							attraction.setBeacon(rs.getInt("beacon"));
							return attraction;
						}
					}
			);
			return list;
		}		
		
		public int count() {
			String sql = "select count(*) from attraction";
			int count = jdbcTemplate.queryForObject(sql, Integer.class);
			return count;
		}	

}