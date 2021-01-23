package uzz.book.admin.servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
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
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/admin/AddBookServlet")
@MultipartConfig
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		PrintWriter out1=response.getWriter();
		Date date=new Date();
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String Entrytime=sd.format(date);
		Part part = request.getPart("bookimage");
		String filename = part.getSubmittedFileName();
		if(filename!=null&&filename.equals("")==false){
		String newFileName = System.currentTimeMillis()
				+ filename.substring(filename.lastIndexOf("."));
		String filepath = this.getServletContext().getRealPath("/images");
		String imagename="images/"+newFileName;
		BookDao bookdao=new BookDao();
		Book book=new Book();
		book.setISBN(Integer.parseInt(bookisbn));
		book.setBookName(bookname);
		book.setAuthor(author);
		book.setCategoryId(Integer.parseInt(Category));
		book.setCount(Integer.parseInt(count));
		book.setPrice(Double.parseDouble(price));
		book.setDecription(description);
		book.setImage(imagename);
		book.setEntryTime(Entrytime);
		book.setSpecialBook(Integer.parseInt(special));
		File f = new File(filepath);
		 if(!f.exists()){
		 f.mkdirs();
		}
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
	            OutputStream out = new FileOutputStream(filepath+"/"+newFileName);
	            out.write(b);
	            out.flush();
	            out.close();          
	        } catch (Exception e) {
	            System.out.println("图片错误");
	        }

			System.out.println(imagebase);
			System.out.println("图书图片保存路径" + filepath);
			boolean ok=bookdao.save(book);
			System.out.println(ok);
			
			if(ok==true){
				out1.println("<script> alert('图书添加成功');parent.location.href='../admin/book_list.jsp'</script>");
			}
		}	
			//File f = new File(filepath);
			// if(!f.exists()){
			// f.mkdirs();
			// }
			// part.write(filepath+"/"+newFileName);

		

	}else{
		out1.println("<script> alert('添加图片');parent.location.href='../admin/book_edit.html'</script>");
	}
}}
