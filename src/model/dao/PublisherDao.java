package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Author;
import model.bean.Publisher;

@Repository
public class PublisherDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM publisher";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Publisher> getAllPublishers(){
		String sql = "SELECT * FROM publisher ORDER BY pid DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Publisher>(Publisher.class));
	}

	public int addPublisher(Publisher publisher) {
		String sql = "INSERT INTO publisher(name) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {publisher.getName()});
	}

	public int delPublisher(int pid) {
		String sql = "DELETE FROM publisher WHERE pid = ?";
		return jdbcTemplate.update(sql, new Object[] {pid});
	}

	public Publisher getPublisher(int pid) {
		try {
			String sql = "SELECT * FROM publisher WHERE pid = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {pid},new BeanPropertyRowMapper<Publisher>(Publisher.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public Publisher getPublisherByName(String name) {
		try {
			String sql = "SELECT * FROM publisher WHERE name = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<Publisher>(Publisher.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	

	public int editItem(Publisher publisher) {
		String sql = "UPDATE publisher SET name = ? WHERE pid = ?";
		return jdbcTemplate.update(sql, new Object[] {publisher.getName(), publisher.getPid()});
	}
	
	
}
