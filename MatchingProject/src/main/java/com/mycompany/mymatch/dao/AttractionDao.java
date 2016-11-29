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
		String sql = "insert into attraction(ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile) values(seq_attraction_ano.nextval,?,?,?,?,?,?,?)";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAname(),
				attraction.getAinfo(),
				attraction.getAlocation(),
				attraction.getLatitude(),
				attraction.getLongitude(),
				attraction.getBeacon(),
				attraction.getSavedfile()
				);
		return row;
	}
	
	public int update(Attraction attraction) {
		String sql = "update attraction set aname=?, ainfo=?, aloction=?, latitude=?, longitude=?, beacon=?, savedfile=? where ano=?";
		int row = jdbcTemplate.update(
				sql,
				attraction.getAname(),
				attraction.getAinfo(),
				attraction.getAlocation(),
				attraction.getLatitude(),
				attraction.getLongitude(),
				attraction.getBeacon(),
				attraction.getSavedfile()
		);
		return row;
	}
	
	public int delete(int ano) {
		String sql = "delete from attraction where ano=?";
		int row = jdbcTemplate.update(sql, ano);
		return row;
	}
	
	
	
//-------------------------------------------------------------------------------------------------------------------------------------
	
	
	
	public Attraction selectByAno(int ano) {
		String sql = "select ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile from attraction where ano=?";
		List<Attraction> list = jdbcTemplate.query(sql, new Object[]{ano}, new RowMapper<Attraction> () {
			
			@Override
			public Attraction mapRow(ResultSet rs, int row) throws SQLException {
				Attraction attraction = new Attraction();
				attraction.setAno(rs.getInt("ano"));
				attraction.setAname(rs.getString("aname"));
				attraction.setAinfo(rs.getString("ainfo"));
				attraction.setAlocation(rs.getString("alocation"));
				attraction.setLatitude(rs.getDouble("latitude"));
				attraction.setLongitude(rs.getDouble("longitude"));
				attraction.setBeacon(rs.getInt("beacon"));
				attraction.setSavedfile(rs.getString("savedfile"));
				return attraction;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	
	
	
//---------------------------------------------------------------------------------------------------------------------------------
	
	public List<Attraction> selectByPage(int pageNo, int rowsPerPage) {
			String sql = "";
			sql += "select ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile ";
			sql += "from ( ";
			sql += "	select rownum as rn, ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile " ;
			sql += "	from (select ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile from attraction order by ano desc) ";
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
							attraction.setLatitude(rs.getDouble("latitude"));
							attraction.setLongitude(rs.getDouble("longitude"));
							attraction.setBeacon(rs.getInt("beacon"));
							attraction.setSavedfile(rs.getString("savedfile"));
							return attraction;
						}
					}
			);
			return list;
		}

		
		
//---------------------------------------------------------------------------------------------------
		
		public List<Attraction> selectKeywordByPage(String keyword, int pageNo, int rowsPerPage) {
			String sql = "";
			sql += "select ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile ";
			sql += "from ( ";
			sql += "	select rownum as rn, ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile " ;
			sql += "	from (select ano, aname, ainfo, alocation, latitude, longitude, beacon, savedfile from attraction where aname like ?) ";
			sql += "	where rownum<=? ";
			sql += ") ";
			sql += "where rn>=? ";
			List<Attraction> list = jdbcTemplate.query(
					sql,  
					new Object[]{"%" + keyword + "%", (pageNo*rowsPerPage), ((pageNo-1)*rowsPerPage + 1)},
					new RowMapper<Attraction>() {
						@Override
						public Attraction mapRow(ResultSet rs, int row) throws SQLException {
							Attraction attraction = new Attraction();
							attraction.setAno(rs.getInt("ano"));
							attraction.setAname(rs.getString("aname"));
							attraction.setAinfo(rs.getString("ainfo"));
							attraction.setAlocation(rs.getString("alocation"));
							attraction.setLatitude(rs.getDouble("latitude"));
							attraction.setLongitude(rs.getDouble("longitude"));
							attraction.setBeacon(rs.getInt("beacon"));
							attraction.setSavedfile(rs.getString("savedfile"));
							return attraction;
						}
					}
			);
			return list;
		}

		
//-------------------------------------------------------------------------------------------------------------------------------------
	
		
		public int count() {
			String sql = "select count(*) from attraction";
			int count = jdbcTemplate.queryForObject(sql, Integer.class);
			return count;
		}
	
		
//-------------------------------------------------------------------------------------------------------------------------------------	
		
		
		public int countKeyword(String keyword) {
			String sql = "select count(*) from attraction where aname like ?";
			int count = jdbcTemplate.queryForObject(sql, new Object[] {"%"+keyword+"%"}, Integer.class);
			return count;
		}	

}