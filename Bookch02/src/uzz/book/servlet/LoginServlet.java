package uzz.book.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
        HttpSession session=request.getSession();
		String username=request.getParameter("username");
		String userpass=request.getParameter("userpass");
		String remember=request.getParameter("terms");
		System.out.println(username);
		System.out.println(userpass);
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/bookstore?useUnicode=true&&characterEncoding=utf-8";
		try {
			Connection conn=DriverManager.getConnection(url, "root", "123456");
			String sql="select * from userdetail where username=?&&userpass=?&&role=0";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, userpass);
			ResultSet rs=ps.executeQuery();
			if(rs!=null&&rs.next()){
				if(remember!=null&&remember.equals("1")){
					Cookie cookie=new Cookie("username", username);
					cookie.setMaxAge(7*24*60*60);
					response.addCookie(cookie);
					Cookie cookie1=new Cookie("userpass", userpass);
					cookie.setMaxAge(7*24*60*60);
					response.addCookie(cookie1);					
				}
				session.setAttribute("username", username);
				session.setMaxInactiveInterval(12*60*600);
				response.sendRedirect("index.jsp");
			}else{
				out.println("用户名密码错误");
				out.println("<a href='login-page.html'>返回登录页面</a>");
			}
			
			rs.close();
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
