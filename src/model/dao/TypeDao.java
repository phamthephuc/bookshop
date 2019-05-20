package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Type;

@Repository
public class TypeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Type> getItems(){
		String sql = "SELECT * FROM type ORDER BY id_type DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Type>(Type.class));
	}
	
}
