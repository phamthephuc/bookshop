package model.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import constant.Defines;
import model.bean.Book;
import service.ResponseRecommend;

@Repository
public class BookDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	
	public List<Book> getItems(int offset) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "ORDER BY b.bid LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { offset, Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Book>(Book.class));
	}

	public List<Book> getBookNewestPaginationAndOrder(int currentPage) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE ORDER BY b.bid DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsByCatParent(int catParentId) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "INNER JOIN categories AS cat ON b.category_id = cat.cid "
				+ "WHERE cat.id_parent = ? ORDER BY b.bid";
		return jdbcTemplate.query(sql, new Object[] { catParentId }, new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsByCatParentPaginationAndOrdering(int catParentId, int currentPage, int ordering) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "INNER JOIN categories AS cat ON b.category_id = cat.cid "
				+ "WHERE is_active = TRUE AND cat.id_parent = ?  ORDER BY " + getOrderingString(ordering) + " LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {catParentId, Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT}, new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getBookBestSalePagination(int currentPage) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "INNER JOIN detailorder AS dod ON b.bid = dod.id_pro "
				+ "GROUP BY(b.bid) ORDER BY SUM(qty) DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getBookComingSoonPagination(int currentPage) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ " WHERE b.realease_date > ? ORDER BY b.realease_date ASC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {new Date(), Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Book>(Book.class));
	}

	public List<Book> getBookSearchNamePagination(int currentPage, String nameBook) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ " WHERE b.book_name LIKE CONCAT('%',?,'%') ORDER BY b.realease_date ASC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] {nameBook, Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT },
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsRunningOut() {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE number_rest < 10";
		return jdbcTemplate.query(sql,
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsSameCat(Book pro) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND b.bid != ? AND c.cid = ? ORDER BY RAND() LIMIT 10";
		return jdbcTemplate.query(sql, new Object[] { pro.getBid(), pro.getCategory_id() },
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsSameAuthor(Book pro) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND b.bid != ? AND au.aid = ? ORDER BY RAND() LIMIT 10";
		return jdbcTemplate.query(sql, new Object[] { pro.getBid(), pro.getCategory_id() },
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsIn(ResponseRecommend responseRecommend) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND b.bid IN " + responseRecommend.toString();
		return jdbcTemplate.query(sql, new Object[] {},
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsByCatPaginationAndOrdering(int id_cat, int currentPage, int ordering) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND c.cid = ? ORDER BY " + getOrderingString(ordering) + " LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {id_cat, Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT},
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsByAuthorPaginationAndOrdering(int id_author, int currentPage, int ordering) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND au.aid = ? ORDER BY " + getOrderingString(ordering) + " LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {id_author, Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT},
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public List<Book> getItemsByPublisherPaginationAndOrdering(int publisher_id, int currentPage, int ordering) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.is_active = TRUE AND p.pid = ? ORDER BY " + getOrderingString(ordering) + " LIMIT ?,?";
		return jdbcTemplate.query(sql, new Object[] {publisher_id, Defines.ROW_COUNT * (currentPage - 1), Defines.ROW_COUNT},
				new BeanPropertyRowMapper<Book>(Book.class));
	}
	
	public static String getOrderingString(int ordering) {
		switch (ordering) {
		case 1:
			return "bid DESC";
		case 2:
			return "bid ASC";
		case 3:	
			return "(price - price * sale /100) DESC";
		case 4: 
			return "(price - price * sale /100) ASC";
		case 5: 
			return "(number_start - number_rest) DESC";
		case 6: 
			return "(number_start - number_rest) ASC";
		case 7: 
			return "realease_date DESC";
		default:
			return "bid DESC";
		}
	}
	
	public int countItem() {
		String sql = "SELECT COUNT(bid) AS countItem FROM book";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int getNewestIdBook() {
		String sql = "SELECT bid FROM book ORDER BY bid DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public int countItemActive() {
		String sql = "SELECT COUNT(bid) AS countItem FROM book WHERE book.is_active = TRUE";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int countItemBestSale() {
		String sql = "SELECT COUNT(bid) AS countItem FROM book AS b WHERE b.bid IN"
				+ " (SELECT id_pro FROM detailorder AS dod GROUP BY(id_pro) ORDER BY SUM(qty) DESC) LIMIT 100";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int countItemCommingSoon() {
		String sql = "SELECT COUNT(bid) AS countItem FROM book AS b WHERE b.is_active = TRUE AND b.realease_date > ? ORDER BY b.realease_date ASC";
		return jdbcTemplate.queryForObject(sql,new Object[] { new Date()}, Integer.class);
	}
	
	public int countItemSearch(String nameBook) {
		String sql = "SELECT COUNT(bid) AS countItem FROM book AS b WHERE b.is_active = TRUE AND b.book_name LIKE CONCAT('%',?,'%')";
		return jdbcTemplate.queryForObject(sql,new Object[] {nameBook}, Integer.class);
	}
	
	public int countItemActiveByAuthor(int author_id) {
		String sql = "SELECT COUNT(bid) AS countItem FROM book WHERE is_active = TRUE AND author_id = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {author_id}, Integer.class);
	}
	
	public int countItemActiveByPublisher(int publisher_id) {
		String sql = "SELECT COUNT(bid) AS countItem FROM book WHERE is_active = TRUE AND publisher_id = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {publisher_id}, Integer.class);
	}
	
	public int countItemsRunningOut() {
		String sql = "SELECT COUNT(bid) AS countItem FROM book WHERE number_rest < 10";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int countItemByIdCat(int id_cat) {
		String sql = "SELECT COUNT(bid) AS countItem FROM book WHERE is_active = TRUE AND book.category_id = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_cat}, Integer.class);
	}

	public int addItem(Book book) {
		String sql = "INSERT INTO book(book_name,category_id,author_id,publisher_id,price,sale,realease_date,picture,preview,number_rest,number_start,pages,is_active) " + 
				" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] { book.getBook_name(), book.getCategory_id(), book.getAuthor_id(), book.getPublisher_id(), book.getPrice(), book.getSale(), 
		book.getRealease_date(), book.getPicture(), book.getPreview(), book.getNumber_rest(), book.getNumber_start(), book.getPages(), book.isIs_active()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM book WHERE bid = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public Book getItem(int id) {
		String sql = "SELECT au.name AS author_name, p.name AS publisher_name, c.cname AS category_name, b.* "
				+ "FROM book AS b INNER JOIN categories AS c ON b.category_id = c.cid "
				+ "INNER JOIN author AS au ON b.author_id = au.aid "
				+ "INNER JOIN publisher AS p ON b.publisher_id = p.pid "
				+ "WHERE b.bid = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Book>(Book.class));
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public Book getItemNewByCat(int id) {
		String sql = "SELECT l.*,c.cname AS cname,p.cname AS cname_parent,name_type FROM products AS l INNER JOIN categories AS c ON l.cid=c.cid INNER JOIN categories AS p ON l.cid_parent = p.cid INNER JOIN type ON l.id_type = type.id_type WHERE cid_parent = ? ORDER BY l.id_pro  LIMIT 1";
		try {
			return jdbcTemplate.query(sql, new Object[] { id }, new BeanPropertyRowMapper<Book>(Book.class)).get(0);
		} catch (Exception e) {
			return null;
		}
	}
	
	public int editItem(Book book) {
		String sql = "UPDATE book SET book_name = ?,"
				+ "category_id = ?,author_id=?,publisher_id=?,price = ?,sale = ?,"
				+ "realease_date = ?,picture = ?,preview = ?,number_rest = ?,"
				+ "number_start = ?,pages = ?,is_active = ? "
				+ "WHERE bid = ?";
		return jdbcTemplate.update(sql, new Object[] { book.getBook_name(), book.getCategory_id(), book.getAuthor_id(), book.getPublisher_id(), book.getPrice(), book.getSale(), 
				book.getRealease_date(), book.getPicture(), book.getPreview(), book.getNumber_rest(), book.getNumber_start(), book.getPages(), book.isIs_active(), book.getBid()});
	}

	public List<Book> getItemsByName(String key) {
		String sql = "UPDATE book SET book_name = ?,"
				+ "category_id = ?,author_id=?,publisher_id=?,price = ?,sale = ?,"
				+ "realease_date = ?,picture = ?,preview = ?,number_rest = ?,"
				+ "number_start = ?,pages = ?,is_active = ? "
				+ "WHERE is_active = TRUE AND book_name LIKE '%" + key + "%' ";
		return jdbcTemplate.query(sql,
				new BeanPropertyRowMapper<Book>(Book.class));
	}

	public int addNum(int numAdd, int id) {
		String sql = "UPDATE book SET number_rest = number_rest + ?,number_start = number_start + ? WHERE bid = ?";
		return jdbcTemplate.update(sql, new Object[] {numAdd,numAdd,id});
	}
	
	public int subNum(int numAdd, int id) {
		String sql = "UPDATE book SET number_rest = number_rest - ? WHERE bid = ?";
		return jdbcTemplate.update(sql, new Object[] {numAdd,id});
	}

}
