package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.SaleCode;

@Repository
public class SaleCodeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM salecode";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<SaleCode> getItems(){
		String sql = "SELECT * FROM SaleCode";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<SaleCode>(SaleCode.class));
	}

	public int addItem(SaleCode saleCode) {
		String sql = "INSERT INTO salecode(code,discount,number_rest) VALUES(?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {saleCode.getCode(),saleCode.getDiscount(),saleCode.getNumber_rest()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM salecode WHERE id_code = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public SaleCode getItem(int id) {
		try {
			String sql = "SELECT * FROM salecode WHERE id_code = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<SaleCode>(SaleCode.class));
		} catch (Exception e) {
			
		}
		return null;
	}

	public int editItem(SaleCode saleCode) {
		String sql = "UPDATE salecode SET code = ?,discount= ?,number_rest = ? WHERE id_code = ?";
		return jdbcTemplate.update(sql, new Object[] {saleCode.getCode(),saleCode.getDiscount(),saleCode.getNumber_rest(),saleCode.getId_code()});
	}

	public Object getItem(String name) {
		try {
			String sql = "SELECT * FROM salecode WHERE code = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<SaleCode>(SaleCode.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
	
}
