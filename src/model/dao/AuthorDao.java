package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import model.bean.Author;

@Repository
public class AuthorDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM author";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Author> getAllAuthores(){
		String sql = "SELECT * FROM author ORDER BY aid DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Author>(Author.class));
	}
	
	public List<Author> getListAuthoresLimit(){
		String sql = "SELECT * FROM author ORDER BY aid DESC LIMIT 0,?";
		return jdbcTemplate.query(sql,new Object[] {Defines.MAX_BOOK_SHOW}, new BeanPropertyRowMapper<Author>(Author.class));
	}

	public int addAuthor(Author author) {
		String sql = "INSERT INTO author(name) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {author.getName()});
	}

	public int delAuthor(int aid) {
		String sql = "DELETE FROM author WHERE aid = ?";
		return jdbcTemplate.update(sql, new Object[] {aid});
	}

	public Author getAuthor(int id) {
		try {
			String sql = "SELECT * FROM author WHERE aid = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Author>(Author.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public Author getAuthorByName(String name) {
		try {
			String sql = "SELECT * FROM author WHERE name = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {name},new BeanPropertyRowMapper<Author>(Author.class));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	

	public int editItem(Author author) {
		String sql = "UPDATE author SET name = ? WHERE aid = ?";
		return jdbcTemplate.update(sql, new Object[] {author.getName(), author.getAid()});
	}
	
	
}
