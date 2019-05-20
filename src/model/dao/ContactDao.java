package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Contact;


@Repository
public class ContactDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM contact";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int addItem(Contact contact) {
		String sql = "INSERT INTO contact(fullname,email,phone,content) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {contact.getFullname(),contact.getEmail(),contact.getPhone(),contact.getContent()});
	}

	public List<Contact> getItems(){
		String sql = "SELECT * FROM contact ORDER BY cid DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	

	public List<Contact> getItemsLimit(){
		String sql = "SELECT * FROM contact ORDER BY cid DESC LIMIT 10";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}
	
	
	public Contact getItem(String email) {
		try {
			String sql = "SELECT * FROM contact WHERE email = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {email},new BeanPropertyRowMapper<Contact>(Contact.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	
	public int delItem(int id) {
		String sql = "DELETE FROM contact WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}


}
