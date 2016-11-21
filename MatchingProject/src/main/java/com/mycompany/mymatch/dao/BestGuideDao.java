package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.BestGuide;
import com.mycompany.mymatch.dto.Tourlist;

@Component
public class BestGuideDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(BestGuide guide){
		String sql = "insert into guide(gid, glocal, gintro, gable) values(?,?,?,false)";
		int row = jdbcTemplate.update(
				sql,
				guide.getGid(),
				guide.getGlocal(),
				guide.getGintro()
		);
		return row;
	}
	public int update(BestGuide guide){
		String sql = "update guide set gable=? where gid=?";
		int row = jdbcTemplate.update(
				sql,
				guide.isGable(),
				guide.getGid()
		);
		return row;
	}
	
	public int delete(String gid){
		String sql = "delete from guide where gid = ?";
		int row = jdbcTemplate.update(sql, Integer.parseInt(gid));
		return row;
	}
	
	public BestGuide selectByGid(String gid) {
		String sql = "select gid, glocal, gintro from guide where gid = ?";
		List<BestGuide> list = jdbcTemplate.query(sql, new Object[]{gid}, new RowMapper<BestGuide> () {

			@Override
			public BestGuide mapRow(ResultSet rs, int row) throws SQLException {
				BestGuide guide = new BestGuide();
				guide.setGid(rs.getString("gid"));
				guide.setGlocal(rs.getString("glocal"));
				guide.setGintro(rs.getString("gintro"));
				return guide;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
	public List<BestGuide> selectByPage(int pageNo, int rowsPerPage){
		String sql = "";
		sql += "select rn, gid, glocal, gintro";
		sql += "from ( ";
		sql += "select rownum as rn, gid, glocal, gintro";
		sql += "from (select gid, glocal, gintro, from Guide order by gid) ";
		sql += "where rownum<=? ";
		sql += ") ";
		sql += "where rn>=? ";
		List<BestGuide> list = jdbcTemplate.query(
				sql,
				new Object[]{(pageNo*rowsPerPage),(pageNo-1)*rowsPerPage+1},
				new RowMapper<BestGuide>(){

					@Override
					public BestGuide mapRow(ResultSet rs, int row) throws SQLException {
						BestGuide guide = new BestGuide();
						guide.setGid(rs.getString("tid"));
						guide.setGlocal(rs.getString("tlocal"));
						guide.setGintro(rs.getString("tintro"));
						return guide;
					}
				}
		);
		return list;
	}
	public int count(){
		String sql = "select count(*) from guide";
		//sql문이 무조건 하나의 값을 가져와야하는 상황이라면 queryForObject을 사용할 수 있으며 Integer.class 타입으로 리턴을 해준다.  
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
}
