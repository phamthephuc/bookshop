package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Category;

@Repository
public class CategoryDao {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Category> getItemsParent(){
		String sql = "SELECT * FROM categories WHERE id_parent = 0 ORDER BY cid DESC;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	public List<Category> getItemsChilds(){
		String sql = "SELECT chil.*,parent.cname AS name_parent FROM categories AS chil INNER JOIN categories AS parent ON chil.id_parent = parent.cid WHERE chil.id_parent != 0 ORDER BY chil.cid DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	public List<Category> getItemsChilds(int id){
		String sql = "SELECT * FROM categories WHERE id_parent = ? ORDER BY cid DESC ";
		return jdbcTemplate.query(sql,new Object[] {id}, new BeanPropertyRowMapper<Category>(Category.class));
	}

	public int addItem(Category cat) {
		String sql = "INSERT INTO categories(cname,id_parent) VALUES(?,?)";
		return jdbcTemplate.update(sql, new Object[] {cat.getCname(),cat.getId_parent()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM categories WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public Category getItem(int id) {
		try {
			String sql = "SELECT * FROM categories WHERE cid = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Category>(Category.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	
	public String getNameParent(int id) {
		try {
			String sql = "SELECT cname FROM categories WHERE cid = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<String>(String.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public int editItem(Category cat) {
		String sql = "UPDATE categories SET cname = ?,id_parent = ? WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] {cat.getCname(),cat.getId_parent(), cat.getCid()});
	}
	
	
}
