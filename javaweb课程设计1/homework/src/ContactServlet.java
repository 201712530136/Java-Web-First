

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
import javax.swing.JOptionPane;

import book.DbOper;
/*��ϵ���ǵ��ύ������Ϣ ������  */
/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
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
		String name=request.getParameter("Name");	//1
		String I=request.getParameter("I");//2
		String phone=request.getParameter("Phone");//5
		String Message=request.getParameter("Message");//6
		System.out.println(Message);

		
		
		
		PrintWriter out=response.getWriter();
		Connection conn=DbOper.connect("huangshandian");
		String sql="INSERT INTO contact VALUES(null,?,?,?,?)";
		try {		
	
			PreparedStatement ps=conn.prepareStatement(sql);
		
			ps.setString(1, name);
			ps.setString(2, I);
		
			ps.setString(3, phone);
			ps.setString(4, Message);
	
		
			int i = ps.executeUpdate();
			
			if(i!=0){
				JOptionPane.showMessageDialog(null, "���Ƿǳ���л���Ľ���");
				DbOper.closeJDBC(null, ps, conn);
				response.sendRedirect("contact.jsp");
			}else{
				JOptionPane.showMessageDialog(null, "�������⣬�������ύ");
				DbOper.closeJDBC(null, ps, conn);
				response.sendRedirect("contact.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
