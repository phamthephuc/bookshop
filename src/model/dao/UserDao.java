package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.User;

@Repository
public class UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int getNewestUserId() {
		String sql = "SELECT id FROM users ORDER BY id DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<User> getItems(){
		String sql = "SELECT users.*,name AS role_name  FROM users INNER JOIN roles ON users.role_id = roles.role_id ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
	}

	public int addItem(User user) {
		String sql = "INSERT INTO users(username,fullname,password,role_id,enable,email,address,phone) VALUES(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getFullname(),user.getPassword(),user.getRole_id(),user.getEnable(),user.getEmail(),user.getAddress(),user.getPhone()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public User getItem(int id) {
		try {
			String sql = "SELECT * FROM users WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			
		}
		return null;
	}

	public int editItem(User user) {
		String sql = "UPDATE users SET username = ?,fullname= ?,password = ?,phone = ?,role_id = ?,enable = ?,email=?,address= ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getFullname(),user.getPassword(),user.getPhone(),user.getRole_id(),user.getEnable(),user.getEmail(),user.getAddress(),user.getId()});
	}
	
	
	public int setPassword(String email,int id) {
		String sql = "UPDATE users SET password = ? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {email,id});
	}


	public User getItem(String name) {
		try {
			String sql = "SELECT * FROM users WHERE username = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
	
	public User getItemByUsernameAndEmail(User user) {
		try {
			String sql = "SELECT * FROM users WHERE username = ? AND email = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {user.getUsername(),user.getEmail()},new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public User getItem(String name,String password) {
		try {
			String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name,password},new BeanPropertyRowMapper<User>(User.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
}
