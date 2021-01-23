

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
/*志愿者审阅同意与不同意  写入两个表 */
/**
 * Servlet implementation class Join1detailschange
 */
@WebServlet("/Join1detailschangeServlet")
public class Join1detailschangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Join1detailschangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");//请求的编码方式中文
		response.setContentType("text/html;charset=utf-8");//相应的
		String n = request.getParameter("n");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		session.removeAttribute("id");//删除这一属性
	
		System.out.println("02"+id);
		Connection conn = DbOper.connect("huangshandian");
		String sql = "select * from volunteers where voNUM = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			int a = Integer.parseInt(n);
			
			if(a==0)
			{
				String sql1 = "UPDATE volunteers SET voVO='通过' WHERE voNUM = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, id);
				int ss = ps1.executeUpdate();
				if (ss!=0)
				{
					JOptionPane.showMessageDialog(null, "已修改为通过");
					DbOper.closeJDBC(null, ps, conn);		

					response.sendRedirect("join1details.jsp?id="+id);
				}
				else if(ss==0)
				{
					
					JOptionPane.showMessageDialog(null, "出现错误请重试");
					DbOper.closeJDBC(null, ps, conn);	
					response.sendRedirect("join1details.jsp?id="+id);
					
				}
				
			}
			else if(a==1)
			{
				String sql1 = "UPDATE volunteers SET voVO='不通过' WHERE voNUM = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, id);
				int ss = ps1.executeUpdate();
				if (ss!=0)
				{
				    JOptionPane.showMessageDialog(null, "已修改为不通过");
					DbOper.closeJDBC(null, ps, conn);	

					response.sendRedirect("join1details.jsp?id="+id);
				}
				else if(ss==0)
				{
					
					JOptionPane.showMessageDialog(null, "出现错误请重试");
					DbOper.closeJDBC(null, ps, conn);	
					response.sendRedirect("join1details.jsp?id="+id);
					
				}
				
			}
			
			
			
			
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
