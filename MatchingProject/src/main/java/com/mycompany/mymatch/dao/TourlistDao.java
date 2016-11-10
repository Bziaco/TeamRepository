package com.mycompany.mymatch.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dto.Tourlist;

@Component
public class TourlistDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int insert(Tourlist tourlist){
		String sql = "insert into Tourlist(tid, tlocal, tstartdate, tenddate, tintro) values(?,?,sysdate,?,?)";
		int row = jdbcTemplate.update(
				sql,
				tourlist.getTid(),
				tourlist.getTlocal(),
				tourlist.getTstartdate(),
				tourlist.getTenddate(),
				tourlist.getTintro()
		);
		return row;
	}
	/*public int update(Tourlist tourlis){
		String sql = "update tourlist set gable=? where gid=?";
		int row = jdbcTemplate.update(
				sql,
				guide.isGable(),
				guide.getGid()
		);
		return row;
	}*/
	
	public int delete(String tid){
		String sql = "delete from tourlist where tid = ?";
		int row = jdbcTemplate.update(sql, Integer.parseInt(tid));
		return row;
	}
	
	public Tourlist selectByTid(String tid) {
		String sql = "select tid, tlocal, tintro from tourlist where tid = ?";
		List<Tourlist> list = jdbcTemplate.query(sql, new Object[]{tid}, new RowMapper<Tourlist> () {

			@Override
			public Tourlist mapRow(ResultSet rs, int row) throws SQLException {
				Tourlist tourlist = new Tourlist();
				tourlist.setTid(rs.getString("tid"));
				tourlist.setTlocal(rs.getString("tlocal"));
				tourlist.setTintro(rs.getString("tintro"));
				return tourlist;
			}
		});
		return (list.size() != 0)? list.get(0) : null;
	}
}
