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
/*�����ͼ���ά��2019.6.19 ͳ�Ʊ������Ѳ鿴������*/

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
		HttpSession session=request.getSession();//���ζ���session��
		
		String username = (String) session.getAttribute("username");//�������Ӧ��ÿ��ҳ�涼�õĵ�
		
		String id1 = (String) session.getAttribute("id1");
		
		//PrintWriter out=response.getWriter();
		Connection conn=DBUtil.connect("huangshandian");
		String sql="select * from activity where ID=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id1);
			ResultSet rs = ps.executeQuery();
			
			rs.next();//���������� Ҫ����һ����ܲ�ѯ����
			String username1 = rs.getString("User")+"��"+username; //����µ��ַ����ŵ����ݿ���
			 ps.close();
			 rs.close();
			System.out.println(username1);
			 String  sql1="UPDATE activity set User=? where ID=?";
				try {
					PreparedStatement	ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, username1);
					ps1.setString(2, id1);
					
					if(!ps1.execute()){
						JOptionPane.showMessageDialog(null, "�ɹ�");
						DbOper.closeJDBC(null, ps1, conn);		

						response.sendRedirect("details.jsp?id="+id1);
					}else{		
						JOptionPane.showMessageDialog(null, "���ִ���������");
						DbOper.closeJDBC(null, ps1, conn);		

						response.sendRedirect("details.jsp?id="+id1);
						
					}	
					
				} catch (SQLException e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
			
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		
		
	}
}