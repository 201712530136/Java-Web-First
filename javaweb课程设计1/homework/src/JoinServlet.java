



import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import book.DbOper;
/*����־Ը��*/


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
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
		request.setCharacterEncoding("utf-8");//����ı��뷽ʽ����
		response.setContentType("text/html;charset=utf-8");//��Ӧ��
		
		String name=request.getParameter("Name");	//1
		String birth=request.getParameter("Birth");//2
		String gender=request.getParameter("Gender");//3
		String e_mail=request.getParameter("Email");//4
		String phone=request.getParameter("Phone");//5
		String job=request.getParameter("Job");//6
		String dress=request.getParameter("Dress");//7

		int totalRecord = 0;
		
		
		PrintWriter out=response.getWriter();
		Connection conn=DbOper.connect("huangshandian");
		
		
		String sql1 = "select * from volunteers";
		try {
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			
			ResultSet rs1 = ps1.executeQuery();
			rs1.last();
			totalRecord = rs1.getRow();//�ܼ�¼����    Ϊ��һ�������׼��   
			System.out.println(totalRecord);
			
			ps1.close();
			rs1.close();
		} catch (SQLException e1) {
			// TODO �Զ����ɵ� catch ��
			e1.printStackTrace();
		}
	
		String num = String.valueOf(totalRecord+1);//���ɱ��
		//String sql="INSERT INTO volunteers VALUES(null,?,?,?,?,?,?,?,null)";
		String sql="INSERT INTO volunteers VALUES(?,?,?,?,?,?,?,?,null,null,null,1)";
		//�µ�servlet�����˶�־Ը����Ϣ��ŵĹ��� ����������
		try {		
	
			PreparedStatement ps=conn.prepareStatement(sql);
		
			/*ps.setString(1, name);
			ps.setString(2, birth);
			ps.setString(3, gender);
			ps.setString(4, e_mail);
			ps.setString(5, phone);
			ps.setString(6, job);
			ps.setString(7, dress);*/
			
			
			ps.setString(1,num);
			ps.setString(2, name);
			ps.setString(3, birth);
			ps.setString(4, gender);
			ps.setString(5, e_mail);
			ps.setString(6, phone);
			ps.setString(7, job);
			ps.setString(8, dress);
			
			System.out.println(name);
			int i = ps.executeUpdate();
			
			if(i!=0){
				JOptionPane.showMessageDialog(null, "��Ϣ�ύ�ɹ�");
				DbOper.closeJDBC(null, ps, conn);
				response.sendRedirect("join.jsp");
			}else{
				JOptionPane.showMessageDialog(null, "�������ύ");
				DbOper.closeJDBC(null, ps, conn);
				response.sendRedirect("join.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
