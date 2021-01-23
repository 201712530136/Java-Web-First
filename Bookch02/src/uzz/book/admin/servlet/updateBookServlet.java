package uzz.book.admin.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sun.misc.BASE64Decoder;
import uzz.book.bean.Book;
import uzz.book.db.BookDao;

/**
 * Servlet implementation class updateBookServlet
 */
@WebServlet("/admin/updateBookServlet")
@MultipartConfig
public class updateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateBookServlet() {
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
		String bookname = request.getParameter("bookname");
		String bookisbn = request.getParameter("bookisbn");
		String imagebase = request.getParameter("imagebase");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String count=request.getParameter("count");
		String special=request.getParameter("special");
		String Category=request.getParameter("Category");
		String description=request.getParameter("description");
		String imagepath=request.getParameter("imagepath");
		String filepath = this.getServletContext().getRealPath(imagepath);
		System.out.println(imagepath);
		Part part = request.getPart("bookimage");
		String filename = part.getSubmittedFileName();	
		//System.out.println(filename);
		if(filename!=null){
				if (imagebase != null) {
				BASE64Decoder decoder = new BASE64Decoder();
				int l = imagebase.indexOf("base64,")+7;//获取前缀data:image/gif;base64,的坐标
		        String newImage = imagebase.substring(l, imagebase.length());//去除前缀
		        try {
		            // Base64解码
		            byte[] b = decoder.decodeBuffer(newImage);
		            for (int i = 0; i < b.length; ++i) {
		                if (b[i] < 0) {// 调整异常数据
		                    b[i] += 256;
		                }
		            }
		            System.out.println(filepath);
		            OutputStream out = new FileOutputStream(filepath);
		            out.write(b);
		            out.flush();
		            out.close();          
		        } catch (Exception e) {
		            System.out.println("图片错误");
		        }
	
		}}
		
		
		BookDao bookdao=new BookDao();
		Book book=new Book();
		book.setISBN(Integer.parseInt(bookisbn));
		book.setBookName(bookname);
		book.setAuthor(author);
		book.setCategoryId(Integer.parseInt(Category));
		book.setCount(Integer.parseInt(count));
		book.setPrice(Double.parseDouble(price));
		book.setDecription(description);
		book.setSpecialBook(Integer.parseInt(special));
		boolean ok=bookdao.update(book);
		System.out.println(ok);
		PrintWriter out1=response.getWriter();
		if(ok==true){
			out1.println("<script> alert('图书修改成功');parent.location.href='../admin/book_list.jsp'</script>");
		}
		
		

}}
