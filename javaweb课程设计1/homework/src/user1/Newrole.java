package user1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.DBUtil;
import book.DbOper;

/**
 * Servlet implementation class NewName
 */
@WebServlet("/Newrole")
public class Newrole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Newrole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id4");
		session.removeAttribute("id4");//删除这一属性   aaaaa
		PrintWriter out=response.getWriter();
		
		String role=request.getParameter("role");
		System.out.println(role);
		Connection conn = DBUtil.connect("huangshandian");
		String sql;
		int a = Integer.parseInt(role) ;
		
		sql = "UPDATE user1 SET role=? WHERE id= ?";
		try {
	
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setString(2,id);
			
			int ss = ps.executeUpdate();

				 
			 DbOper.closeJDBC(null, ps, conn);	
			 out.println("<script>alert('类型修改成功');</script>");
		
			 response.sendRedirect("user1details.jsp?id="+id);
				
			
			
		
		
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			
	}

}
