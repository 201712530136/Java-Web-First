package loginsrevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

/**
 * Servlet implementation class ChangepassServlet
 */
@WebServlet("/ChangepassServlet")
public class ChangepassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangepassServlet() {
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
		request.setCharacterEncoding("utf-8");//����ı��뷽ʽ����
		response.setContentType("text/html;charset=utf-8");//��Ӧ��
		String message = request.getParameter("Message");
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		PrintWriter out=response.getWriter();
		System.out.println("02"+username);
		Connection conn = DbOper.connect("huangshandian");
		String sql = "select * from user1 where username = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			
			
			if(message!=null&&message!=""&&message!=" ")
			{
				String sql1 = "UPDATE user1 SET userpass=? WHERE username = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, message);
				ps1.setString(2,username);
				int ss = ps1.executeUpdate();
				session.removeAttribute("username");//ɾ����һ����   aaaaa
				
				out.println("<script>alert('�޸ĳɹ��������µ�¼'); window.location.href='Login.jsp'</script>");
				DbOper.closeJDBC(null, ps, conn);
				
			}
			
			
			 else {
				 
				 DbOper.closeJDBC(null, ps, conn);	
				 out.println("<script>alert('�޸�ʧ�ܣ��������޸�'); window.location.href='changepass.jsp'</script>");
			 }
			
			
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
	}

}
