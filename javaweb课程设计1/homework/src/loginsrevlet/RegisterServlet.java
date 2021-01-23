package loginsrevlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.DbOper;
/*董莹的注册*/


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id=request.getParameter("id");
		String username=request.getParameter("username");
		String userpass=request.getParameter("password");
		
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String company=request.getParameter("company");
		String address=request.getParameter("address");
		
		String inputcode=request.getParameter("inputcode");//
		String agree=request.getParameter("agree");
		Connection conn= DbOper.connect("huangshandian");
		
		
		HttpSession session=request.getSession();//
		String inputcodese=(String)session.getAttribute("SESSION_VALIDATECODE");//验证码
		
		if (inputcode.equals(inputcodese)) {
		
	
	
		String sql="select * from id where id=? && username=?";
		
		
		
		PrintWriter out=response.getWriter();
		try {
			
			
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, username);
			
			
			ResultSet rs=st.executeQuery();//从数据库里读出的内容，返回一个结果集
			if(rs!=null&&rs.next()){
				
			String sql1="select * from user1 where id=? && username=?";
			PreparedStatement ps=conn.prepareStatement(sql1);
			ps.setString(1, id);
			ps.setString(2, username);
			ResultSet rst=ps.executeQuery();
			if(rst!=null&&rst.next()){
				//该用户已存在
				out.println("<script>alert('该用户已经存在，请重新注册'); window.location.href='register.jsp'</script>");
			}
			else {
				 String sql2="insert into user1 values(?,?,?,?,?,?,?,0)";
				 ps=conn.prepareStatement(sql2);
				 ps.setString(1, id);
				 ps.setString(2, username);
				 ps.setString(3, userpass);
				 ps.setString(4, email );
				 
				 ps.setString(5, phone);
			   	 ps.setString(6, company);
				 ps.setString(7, address);
                 int n=0;
				 
				 n=ps.executeUpdate();
		 if(n>0){
					 out.println("<script>alert('该用户注册成功，请登录'); window.location.href='Login.jsp'</script>"); 
				 }else{
					 out.println("<script>alert('注册失败，从新注册'); window.location.href='register.jsp'</script>");
				 }
			}}
			
			else 
			{
				out.println("<script>alert('用户名或id号错误'); window.location.href='register.jsp'</script>");//网页的弹窗
			}
			
			DbOper.closeJDBC(rs, st, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	else
	{
		PrintWriter out=response.getWriter(); 
		out.println("<script>alert('验证码错误 请重新注册');window.location.href='register.jsp'</script>");
	}
		
	}

}
