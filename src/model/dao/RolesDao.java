package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Roles;

@Repository
public class RolesDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Roles> getItems(){
		String sql = "SELECT * FROM roles ORDER BY role_id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Roles>(Roles.class));
	}

}
