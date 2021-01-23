package uzz.book.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import uzz.book.bean.Book;
import uzz.book.bean.BookCategory;

public class BookDao {

public ArrayList<Book> bookquery(){
	ArrayList<Book> booklist=new ArrayList<Book>();
	String sql="select * from book t1 left join bookcategory t2 on t1.CategoryId = t2.CategoryId";
	Connection conn=DbOper.connect("bookstore");
	Statement st=null;
	ResultSet rs=null;
	try {
		st = conn.createStatement();
		rs=st.executeQuery(sql);
		rs.last();
		int n=rs.getRow();
		System.out.println(n);
		rs.beforeFirst();
		Book book = null;
		while(rs.next()){
			book=new Book();
			book.setISBN(rs.getInt("ISBN"));
			book.setBookName(rs.getString("BookName"));
			book.setCount(rs.getInt("Count"));
			BookCategory bookcategory=new BookCategory();
			bookcategory.setCategoryId(rs.getInt("CategoryId"));
			bookcategory.setCategoryName(rs.getString("CategoryName"));
		    book.setBookcategory(bookcategory);
		    book.setPrice(rs.getDouble("Price"));
		    book.setDecription(rs.getString("decription"));
			book.setImage(rs.getString("Image"));
		    booklist.add(book);}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DbOper.closeJDBC(rs, st, conn);
	}
	return booklist;
	
}
public Book bookquery(String isbn){
	String sql="select * from book t1 left join bookcategory t2 on t1.CategoryId = t2.CategoryId where t1.isbn=?";
	Connection conn=DbOper.connect("bookstore");
	PreparedStatement st=null;
	ResultSet rs=null;
	Book book = null;
	try {
		st = conn.prepareStatement(sql);
		st.setString(1, isbn);
		rs=st.executeQuery();
		if(rs!=null&&rs.next()){
			book=new Book();
			book.setISBN(rs.getInt("ISBN"));
			book.setBookName(rs.getString("BookName"));
			book.setCount(rs.getInt("Count"));
			BookCategory bookcategory=new BookCategory();
			bookcategory.setCategoryId(rs.getInt("CategoryId"));
			bookcategory.setCategoryName(rs.getString("CategoryName"));
		    book.setBookcategory(bookcategory);
		    book.setPrice(rs.getDouble("Price"));
		    book.setDecription(rs.getString("decription"));
			book.setImage(rs.getString("Image"));
		    }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DbOper.closeJDBC(rs, st, conn);
	}
	return book;
	
}
public boolean save(Book book){
	Connection conn=DbOper.connect("bookstore");
	PreparedStatement ps=null;
	String sql="insert into book values(?,?,?,?,?,?,?,?,?,?)";
	try {
		ps=conn.prepareStatement(sql);
		ps.setInt(1, book.getISBN());
		ps.setString(2, book.getBookName());
		ps.setString(3, book.getAuthor());
		ps.setInt(4,book.getCount());
		ps.setDouble(5,book.getPrice());
		ps.setString(6, book.getDecription());
		ps.setString(7, book.getImage());
		ps.setInt(8, book.getCategoryId());
		ps.setString(9, book.getEntryTime());
		ps.setInt(10,book.getSpecialBook());
		int n=ps.executeUpdate();
		if(n==1){
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
	
	
	
}
public boolean update(Book book){
	Connection conn=DbOper.connect("bookstore");
	PreparedStatement ps=null;
	String sql="update book set BookName=?,Author=?,count=?,price=?,Decription=?,"
			+ "CategoryId=?,SpecialBook=? where ISBN=?";
	try {
		ps=conn.prepareStatement(sql);
		
		ps.setString(1, book.getBookName());
		ps.setString(2, book.getAuthor());
		ps.setInt(3,book.getCount());
		ps.setDouble(4,book.getPrice());
		ps.setString(5, book.getDecription());
		ps.setInt(6, book.getCategoryId());
		ps.setInt(7,book.getSpecialBook());
		ps.setInt(8, book.getISBN());
		int n=ps.executeUpdate();
		if(n==1){
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
	
	
	
}
}
