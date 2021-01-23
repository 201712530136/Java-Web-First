package uzz.book.servlet;

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

import uzz.book.db.DbOper;

/**
 * Servlet implementation class paymentServlet
 */
@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentServlet() {
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
		String order_id=request.getParameter("order_id");
		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		double payment=(double)session.getAttribute("payment");
	    Connection conn=DbOper.connect("bookstore");
	    String sql="select * from wallet where username=?";
	    PreparedStatement ps=null;
	    ResultSet rs=null;
	    PrintWriter out=response.getWriter();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			 rs=ps.executeQuery();
		    if(rs!=null&&rs.next()){
		    	double money=rs.getDouble("money");
		    	if(money>payment){
		    	String sql1="update wallet SET money=? where username=?";
		    	money=money-payment;
		    	ps=conn.prepareStatement(sql1);
		    	ps.setDouble(1, money);
		    	ps.setString(2, username);
		    	int ok=ps.executeUpdate();
		    	if(ok>0){
		    		String sql2="update orders SET payment=1 where order_id=?";
			    	money=money-payment;
			    	ps=conn.prepareStatement(sql2);
			    	ps.setString(1, order_id);
			    	int orderok=ps.executeUpdate();			    		    	
			    	if(orderok>0){
			    		out.println("支付成功,等待发货");
			    	}
			    		
		    		
		    	}else{
		    		out.println("支付不成功");
		    	}
		    	
		    		
		    	}else{
		    		out.println("余额不足，请充值");
		    	}
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbOper.closeJDBC(rs, ps, conn);
		}
	    
	    		
	}

}
