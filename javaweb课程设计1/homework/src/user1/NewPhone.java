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
@WebServlet("/NewPhone")
public class NewPhone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPhone() {
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
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id4");
		session.removeAttribute("id4");//删除这一属性   aaaaa
		PrintWriter out=response.getWriter();
		
		String NewPhone=request.getParameter("NewPhone");
		int a;
		System.out.println(NewPhone);
		Connection conn = DBUtil.connect("huangshandian");
		
		a=Integer.parseInt(NewPhone);
		String sql = "UPDATE user1 SET phone=? WHERE id= ?";
		try {
	
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setString(2,id);
			
			int ss = ps.executeUpdate();

			
			
		
		
		
	
			 
			 DbOper.closeJDBC(null, ps, conn);	
			 out.println("<script>alert('Phone修改成功');</script>");
		
			 response.sendRedirect("user1details.jsp?id="+id);
				
			
			
		
		
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
			
	}

}
