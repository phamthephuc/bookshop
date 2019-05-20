package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Payment;

@Repository
public class PaymentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM payment";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Payment> getItems(){
		String sql = "SELECT * FROM payment";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Payment>(Payment.class));
	}

	public int addItem(Payment Payment) {
		String sql = "INSERT INTO payment(name) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {Payment.getName()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM payment WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public Payment getItem(int id) {
		try {
			String sql = "SELECT * FROM payment WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Payment>(Payment.class));
		} catch (Exception e) {
			
		}
		return null;
	}

	public int editItem(Payment Payment) {
		String sql = "UPDATE payment SET name = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {Payment.getName(),Payment.getId()});
	}

	public Object getItem(String name) {
		try {
			String sql = "SELECT * FROM payment WHERE name = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<Payment>(Payment.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
	
}
