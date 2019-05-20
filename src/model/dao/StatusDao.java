package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Status;


@Repository
public class StatusDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Status> getItems(){
		String sql = "SELECT * FROM status ORDER BY id_status DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Status>(Status.class));
	}
}
