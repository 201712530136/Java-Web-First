package gonggao;

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
@WebServlet("/Newcode")
public class Newcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Newcode() {
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
		String id = (String) session.getAttribute("id2");
		session.removeAttribute("id2");//删除这一属性   aaaaa
		PrintWriter out=response.getWriter();
		
		String code=request.getParameter("code");
		System.out.println(code);
		Connection conn = DBUtil.connect("huangshandian");
		String sql;
		int a = Integer.parseInt(code) ;
		
		sql = "UPDATE activity SET code=? WHERE ID= ?";
		try {
	
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setString(2,id);
			
			int ss = ps.executeUpdate();

				 
			 DbOper.closeJDBC(null, ps, conn);	
			 out.println("<script>alert('类型修改成功');</script>");
		
			 response.sendRedirect("details1.jsp?id="+id);
				
			
			
		
		
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
