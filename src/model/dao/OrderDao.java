package model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.bean.Order;

@Repository
public class OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public int countItem() {
		String sql = "SELECT COUNT(*) AS countItem FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public int countItemChuaXuLy() {
		String sql = "SELECT COUNT(*) AS countItem FROM orders WHERE id_status = 0";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	
	public List<Order> getItems(){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment  ORDER BY id_order DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItemsByYear(int year){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment WHERE YEAR(date_create_order) = ? AND orders.id_status = ? ORDER BY id_order DESC";
		return jdbcTemplate.query(sql,new Object[] {year,4}, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItemsByMothAndYear(int month,int year){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment WHERE MONTH(date_create_order) = ? AND YEAR(date_create_order) = ? AND orders.id_status = ? ORDER BY id_order DESC";
		return jdbcTemplate.query(sql,new Object[] {month,year,4}, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItemsChuaXuLy(){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment WHERE status.id_status = 1 || status.id_status = 3 ORDER BY id_order DESC LIMIT 10";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItemsChuaXuLyNotLimit(){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment WHERE status.id_status = 0 ORDER BY id_order DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
	}
	
	public List<Order> getItemsByIdUser(int id_user){
		String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment WHERE orders.id_user = ?  ORDER BY id_order DESC";
		return jdbcTemplate.query(sql, new Object[] {id_user}, new BeanPropertyRowMapper<Order>(Order.class));
	}

	public int addItem(Order order) {
		System.out.println(order.getPhone());
		String sql = "INSERT INTO orders(id_user,fullname,email,phone,address_ship,amount,id_payment,message,id_status) VALUES(?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {order.getId_user(),order.getFullname(),order.getEmail(),order.getPhone(),order.getAddress_ship(),order.getAmount(),order.getId_payment(),order.getMessage(),order.getId_status()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM orders WHERE id_order = ?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public Order getItem(int id) {
		try {
			String sql = "SELECT orders.*,payment.name as name_payment,status.name_status AS name_status FROM orders INNER JOIN status ON orders.id_status = status.id_status INNER JOIN payment ON payment.id = orders.id_payment  WHERE id_order = ?";
			return jdbcTemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Order>(Order.class));
		} catch (Exception e) {
			
		}
		return null;
	}
	
	

	public int editItem(Order order) {
		String sql = "UPDATE orders SET id_status = ? WHERE id_order = ?";
		return jdbcTemplate.update(sql, new Object[] {order.getId_status(),order.getId_order()});
	}
	
	public int huyDonHang(int id, int userId) {
		String sql = "UPDATE orders SET id_status = 2 WHERE id_order = ? AND id_status = 0 AND id_user = ?";
		return jdbcTemplate.update(sql, new Object[] {id, userId});
	}


	public int getMaxId() {
		String sql = "SELECT MAX(id_order) AS max FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);

	}
	
	
	public int getMaxYear() {
		String sql = "SELECT MAX(YEAR(date_create_order)) AS max FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);

	}
	
	public int getMinYear() {
		String sql = "SELECT MIN(YEAR(date_create_order)) AS min FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);

	}

	
	
	
}
