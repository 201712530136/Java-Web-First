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
@WebServlet("/NewText")
public class NewText extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewText() {
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
		String id = (String) session.getAttribute("id2");
		session.removeAttribute("id2");//ɾ����һ����   aaaaa
		PrintWriter out=response.getWriter();
		
		String NewText=request.getParameter("NewText");
		System.out.println(NewText);
		Connection conn = DBUtil.connect("huangshandian");
		
		
		String sql = "UPDATE activity SET Decription=? WHERE ID= ?";
		try {
	
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,NewText);
			ps.setString(2,id);
			
			int ss = ps.executeUpdate();

			
			
		
		
		
	
			 
			 DbOper.closeJDBC(null, ps, conn);	
			 out.println("<script>alert('����������ĳɹ�');</script>");
		
			 response.sendRedirect("details1.jsp?id="+id);
				
			
			
		
		
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
			
	}

}
