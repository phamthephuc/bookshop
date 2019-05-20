package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Slide;

@Repository
public class SlideDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM slide";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Slide> get3Items(){
		String sql = "SELECT slide.*  FROM slide ORDER BY id_slide DESC LIMIT 3";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}
	
	public List<Slide> getItems(){
		String sql = "SELECT slide.*  FROM slide ORDER BY id_slide DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class));
	}

	public int addItem(Slide Slide) {
		String sql = "INSERT INTO slide(picture,link) VALUES(?,?)";
		return jdbcTemplate.update(sql, new Object[] {Slide.getPicture(),Slide.getLink()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM slide WHERE id_slide = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public Slide getItem(int id) {
		try {
			String sql = "SELECT * FROM slide WHERE id_slide = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Slide>(Slide.class));
		} catch (Exception e) {
			
		}
		return null;
	}

	public int editItem(Slide Slide) {
		String sql = "UPDATE slide SET picture = ?,link = ? WHERE id_slide = ?";
		return jdbcTemplate.update(sql, new Object[] {Slide.getPicture(),Slide.getLink(),Slide.getId_slide()});
	}
	
}
