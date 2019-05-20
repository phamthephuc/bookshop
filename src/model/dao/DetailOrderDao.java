package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.DetailOrder;

@Repository
public class DetailOrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM detailorder";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public List<DetailOrder> getItems(){
		String sql = "SELECT detailorder.*,products.name_pro,products.price,products.sale FROM detailorder INNER JOIN products ON detailorder.id_pro = products.id_pro";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<DetailOrder>(DetailOrder.class));
	}
	
	public List<DetailOrder> getItemsByIdOrder(int id){
		String sql = "SELECT detailorder.*,book.book_name AS name_pro,book.price,book.sale FROM detailorder INNER JOIN book ON detailorder.id_pro = book.bid WHERE id_order = ?";
		return jdbcTemplate.query(sql,new Object[] {id}, new BeanPropertyRowMapper<DetailOrder>(DetailOrder.class));
	}

	public int addItem(DetailOrder detailOrder) {
		String sql = "INSERT INTO detailorder(id_pro,id_order,qty) VALUES(?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {detailOrder.getId_pro(),detailOrder.getId_order(),detailOrder.getQty()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM detailorder WHERE id_detailOrder = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public DetailOrder getItem(int id) {
		try {
			String sql = "SELECT detailorder.*,products.name_pro,products.price,products.sale FROM detailorder INNER JOIN products ON detailorder.id_pro = products.id_pro WHERE id_detailOrder = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<DetailOrder>(DetailOrder.class));
		} catch (Exception e) {
			
		}
		return null;
	}

	

	
	
	
}
