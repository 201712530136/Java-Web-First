

import java.io.IOException;
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
import javax.swing.JOptionPane;
import javax.websocket.Session;



import book.DbOper;
/*实现对志愿者审阅信息的修改 写入两个表  */
/**
 * Servlet implementation class Join1detailschange
 */
@WebServlet("/Join1detailschangeServlet2")
public class Join1detailschangeServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join1detailschangeServlet2() {
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
		
		
		request.setCharacterEncoding("utf-8");//请求的编码方式中文
		response.setContentType("text/html;charset=utf-8");//相应的
		String message1 = request.getParameter("Message1");
		String message2 = request.getParameter("Message2");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		session.removeAttribute("id");//删除这一属性   aaaaa
	
		System.out.println("02"+id);
		Connection conn = DbOper.connect("huangshandian");
		String sql = "select * from volunteers where voNUM = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			
			
			if(message1!=null)
			{
				String sql1 = "UPDATE volunteers SET voText=? WHERE voNUM = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, message1);
				ps1.setString(2, id);
				int ss = ps1.executeUpdate();

				
				
			}
			 if(message2!=null)
			{
				String sql1 = "UPDATE volunteers SET voJobA=? WHERE voNUM = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, message2);
				ps1.setString(2, id);
				int ss = ps1.executeUpdate();
				
					DbOper.closeJDBC(null, ps, conn);	
					response.sendRedirect("join1details.jsp?id="+id);
					
				
			}
			
			 else {
				 
				 DbOper.closeJDBC(null, ps, conn);	
					response.sendRedirect("join1details.jsp?id="+id);
			 }
			
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	
	
	}

}
