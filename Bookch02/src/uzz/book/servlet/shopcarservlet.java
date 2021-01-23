package uzz.book.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uzz.book.bean.Book;
import uzz.book.db.BookDao;

/**
 * Servlet implementation class shopcarservlet
 */
@WebServlet("/shopcarservlet")
public class shopcarservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopcarservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String isbn=request.getParameter("isbn");
		HttpSession session=request.getSession();
		
		String username=(String)session.getAttribute("username");
		PrintWriter out=response.getWriter();
		if(username!=null){
		ArrayList<Book> shopcar=(ArrayList<Book>)session.getAttribute("shopcar");
		if(shopcar==null){
			shopcar=new ArrayList<Book>();
		}
		boolean find=false;
		for (int i = 0; i < shopcar.size(); i++) {
		   Book book1=shopcar.get(i);
		   if(book1.getISBN()==Integer.parseInt(isbn)){
			  book1.setCount(book1.getCount()+1);
			  find=true;
			  break;
		   }
			
		}
		if(find==false){
			BookDao bookdao=new BookDao();
			Book book=bookdao.bookquery(isbn);
			book.setCount(1);
			shopcar.add(book);
		}
		session.setAttribute("shopcar",shopcar);
		response.sendRedirect("showcar.jsp");
		}
		else{
		out.println("<script>alert('µÇÂ¼ºó¹ºÂò');window.location.href='myaccount.jsp'</script>");
		}
		
		
		
	}

}
