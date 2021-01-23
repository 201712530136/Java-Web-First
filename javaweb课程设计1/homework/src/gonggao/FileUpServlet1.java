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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import book.DbOper;
import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUpServlet1")//��д���ݿ�Ĺ���д�ú���һ�ݸĳ�2
@MultipartConfig
public class FileUpServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpServlet1() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String imagebase = request.getParameter("imagebase");
		Part part = request.getPart("fileupload");
		String filename = part.getSubmittedFileName();
		if(filename!=null&&filename.equals("")==false){
		String newFileName = System.currentTimeMillis()
				+ filename.substring(filename.lastIndexOf("."));
		String filepath = this.getServletContext().getRealPath("/images");
		String imagename="images/"+newFileName;
		File f = new File(filepath);
		
		/*��ȡ����id*/
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id2");
		session.removeAttribute("id2");//ɾ����һ����   aaaaa
		PrintWriter outt=response.getWriter();
		
		
		 if(!f.exists()){
		 f.mkdirs();
		}
		 if (imagebase != null) {
				BASE64Decoder decoder = new BASE64Decoder();
				int l = imagebase.indexOf("base64,")+7;//��ȡǰ׺data:image/gif;base64,������
		        String newImage = imagebase.substring(l, imagebase.length());//ȥ��ǰ׺
		        try {
		            // Base64����
		            byte[] b = decoder.decodeBuffer(newImage);
		            for (int i = 0; i < b.length; ++i) {
		                if (b[i] < 0) {// �����쳣����
		                    b[i] += 256;
		                }
		            }
		            OutputStream out = new FileOutputStream(filepath+"/"+newFileName);//������µ�·���浽���ݿ�������˰�
		            
		            //�ѵ�ַ�������ݿ�
		            Connection conn = DbOper.connect("huangshandian");
					String sql = "UPDATE activity SET Image1=? WHERE ID= ?";
						try {
					
							
							PreparedStatement ps = conn.prepareStatement(sql);
							ps.setString(1,"images/"+newFileName);
							ps.setString(2,id);
							
							int ss = ps.executeUpdate();

							
							
						
						
						
					
							 
							 DbOper.closeJDBC(null, ps, conn);	
							 outt.println("<script>alert('�޸�ͼƬ�ɹ�');</script>");
						
							 response.sendRedirect("details1.jsp?id="+id);
								
								System.out.println(imagebase);
								System.out.println("ͼ��ͼƬ����·��" + filepath);
						
						
						} catch (SQLException e) {
							// TODO �Զ����ɵ� catch ��
							e.printStackTrace();
						}
		            out.write(b);
		            out.flush();
		            out.close();          
		        } catch (Exception e) {
		            System.out.println("ͼƬ����");
		        }
		        
		        
		       
			

		
		}
		
		
	}

	}}
