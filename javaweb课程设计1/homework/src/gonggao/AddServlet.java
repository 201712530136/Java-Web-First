package gonggao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import javax.servlet.http.Part;

import book.DbOper;
import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		/*��ȡ����id*/
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("id2");
		//session.removeAttribute("id2");//ɾ����һ����   aaaaa
		PrintWriter outt=response.getWriter();
		
		

		            Connection conn = DbOper.connect("huangshandian");
		            String sql = "select ID from activity";
					PreparedStatement ps;
					try {
						ps = conn.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						int n=0;
						int a;
			            while(rs!=null&&rs.next())
			            {
			            	
			            	a=rs.getInt(1);
			            	System.out.println(a);
			            	if(n<=rs.getInt(1))
			            		n=rs.getInt(1)+1;
			            			            	
			            }
			            System.out.println("���ñ��Ϊ"+n);
			            sql = "insert into activity values(?,null,null,null,null,null,null,0,null)";
						try {
					
							
							 ps = conn.prepareStatement(sql);
							
							 ps.setInt(1,n);
							
							int ss = ps.executeUpdate();

							
													 
							 DbOper.closeJDBC(rs, ps, conn);	
								outt.println("<script>alert('������ӳɹ�'); window.location.href='courses1.jsp'</script>");
						
								
								
						
						
						} catch (SQLException e) {
							// TODO �Զ����ɵ� catch ��
							e.printStackTrace();
						}
			            
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				
		            
		            
		         
	
		        	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		       
			

		
		
		
		
	

	}

}
