package xian;

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
import javax.swing.JOptionPane;

import book.DBUtil;
import book.DbOper;
/*钟振贤加赵维威2019.6.19 统计报名（已查看）人数*/

/**
 * Servlet implementation class EnterServlet
 */
@WebServlet("/EnterServlet")
public class EnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		HttpSession session=request.getSession();//初次定义session？
		
		String username = (String) session.getAttribute("username");//哈哈这个应该每个页面都用的到
		
		String id1 = (String) session.getAttribute("id1");
		
		//PrintWriter out=response.getWriter();
		Connection conn=DBUtil.connect("huangshandian");
		String sql="select * from activity where ID=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id1);
			ResultSet rs = ps.executeQuery();
			
			rs.next();//啊啊啊啊啊 要加这一句才能查询出来
			String username1 = rs.getString("User")+"、"+username; //组成新的字符串放到数据库里
			 ps.close();
			 rs.close();
			System.out.println(username1);
			 String  sql1="UPDATE activity set User=? where ID=?";
				try {
					PreparedStatement	ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, username1);
					ps1.setString(2, id1);
					
					if(!ps1.execute()){
						JOptionPane.showMessageDialog(null, "成功");
						DbOper.closeJDBC(null, ps1, conn);		

						response.sendRedirect("details.jsp?id="+id1);
					}else{		
						JOptionPane.showMessageDialog(null, "出现错误请重试");
						DbOper.closeJDBC(null, ps1, conn);		

						response.sendRedirect("details.jsp?id="+id1);
						
					}	
					
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		
	}
}