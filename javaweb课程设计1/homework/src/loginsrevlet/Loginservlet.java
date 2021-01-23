package loginsrevlet;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**`
     * @see HttpServlet#HttpServlet()
     */
    public Loginservlet() {
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
		
		String  username=request.getParameter("username");
		String  userpass=request.getParameter("userpass");
		
		String remember=request.getParameter("terms");
		System.out.println(username);
		System.out.println(userpass);
		PrintWriter out=response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/huangshandian?userUnicode=true&&characterEncodeing=utf-8";
		System.out.println("2");
		try {
			Connection conn=DriverManager.getConnection(url, "root", "123456");
			String  sql="select * from user1 where username=? && userpass=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, username);
			ps.setString(2, userpass);
			
			ResultSet rs=ps.executeQuery();

			if(remember!=null&&remember.equals("1")){
				Cookie cookie=new Cookie("username", username);
				cookie.setMaxAge(7*24*60*60);
				response.addCookie(cookie);
						
			}
			
			session.setAttribute("username", username);//ok这里很漂亮 
			session.setMaxInactiveInterval(12*60*600);
			
			if(rs!=null&&rs.next()){
				
				
				
				String role=rs.getString(8);//bug 
				int i = Integer.parseInt(role);
				System.out.println(role);
				if ( i==1) {
					response.sendRedirect("index1.jsp");//管理员页面跳转
				}
				if (i==0 ) {
					response.sendRedirect("index.jsp");//用户页面跳转
				}
				
				
					
				
			}else{
				out.println("<script>alert('用户名密码错误,返回登录页面'); window.location.href='Login.jsp'</script>");
			
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
		