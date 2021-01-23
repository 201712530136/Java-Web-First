package gonggao;

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

import book.DBUtil;

/**删除公告
 * Servlet implementation class LYdel
 */
@WebServlet("/GGdel")
public class GGdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GGdel() {
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
		
		String time=request.getParameter("id");
		System.out.println(time);
		Connection conn = DBUtil.connect("huangshandian");
		
		
String sql="delete from activity where ID = ? ";

		
		
		PrintWriter out=response.getWriter();
		
	
			
			try {
				PreparedStatement st=conn.prepareStatement(sql);
				st.setString(1, time);
				
				
				int rs = 0;
				rs=st.executeUpdate();//成功的标志
				if(rs!=0) {
					DBUtil.closeJDBC(null, st, conn);
					out.println("<script>alert('公告删除成功'); window.location.href='courses1.jsp'</script>");
					}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
