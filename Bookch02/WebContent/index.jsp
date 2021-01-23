<%@page import="uzz.book.db.DbOper"%>
<%@page import="uzz.book.bean.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uzz.book.db.BookDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<body>
	<div id="wrap">

		<div class="header">
			<div class="logo">
				<a href="index.html"><img src="images/logo.gif" alt="" title=""
					border="0" /></a>
			</div>
			<div id="menu">
				<ul>
					<li class="selected"><a href="index.jsp">主页</a></li>
					<li><a href="about.html">公司简介</a></li>
					<li><a href="category.html">图书</a></li>
					<li><a href="specials.html">特价图书</a></li>
					<li><a href="myaccount.jsp">我的账户</a></li>
					<li><a href="register.html">注册</a></li>
					<li><a href="myorder.jsp">我的订单</a></li>
					<li><a href="contact.html">联系我们</a></li>
				</ul>
			</div>


		</div>


		<div class="center_content">
			<div class="left_content">

				<div class="title">
					<span class="title_icon"><img src="images/bullet1.gif"
						alt="" title="" /></span>特色图书
				</div>

				<%
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&&characterEncoding=utf-8";
					Connection conn = DriverManager
							.getConnection(url, "root", "123456");
					//String sql="select * from book limit 0,2";
					String sql = "select * from book";
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					rs.last();

					int totalRecord = rs.getRow();
					System.out.println(totalRecord);
					int pageSize = 2;
					int totalPage = (totalRecord % pageSize) == 0 ? (totalRecord / pageSize)
							: (totalRecord / pageSize + 1);
					String strpage = request.getParameter("page");
					System.out.println(strpage);
					int currentPage = 1;
					if (strpage != null && strpage.equals("") == false) {
						currentPage = Integer.parseInt(strpage);
						if (currentPage <= 0) {
							currentPage = 1;
						}
						if (currentPage >= totalPage) {
							currentPage = totalPage;
						}
					}
					int fromIndex = (currentPage - 1) * pageSize;
					int toIndex = (currentPage * pageSize <= totalRecord) ? (currentPage * pageSize)
							: totalRecord;
					System.out.println("开始记录" + fromIndex);
					//rs.absolute(fromIndex+1);
					if (rs != null) {
						for (int i = fromIndex + 1; i <= toIndex; i++) {
							rs.absolute(i);
							String bookName = rs.getString("BookName");
							String imageurl = rs.getString("Image");
							System.out.println(imageurl);
							String description = rs.getString("decription");
				%>
				<div class="feat_prod_box">
					<div class="prod_img">
						<a href="details.jsp?isbn=<%=rs.getInt("ISBN") %>"><img src=<%=imageurl%> alt="" title=""
							border="0" /></a>
					</div>

					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title"><%=bookName%></div>
							<p class="details"><%=description%></p>
							<a href="details.jsp?isbn=<%=rs.getInt("ISBN") %>" class="more">- 更多详细 -</a>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>
				<%
					}
					}
					rs.close();
				%>


				<div class="pagination">
					<span class="disabled"><a
						href="index.jsp?page=<%=currentPage - 1%>"><<</a></span><span
						class="current"><a href="index.jsp?page=1">1</a></span><a
						href="index.jsp?page=2">2</a><a href="index.jsp?page=3">3</a><a
						href="index.jsp?page=<%=currentPage + 1%>">>></a>
				</div>




				<div class="title">
					<span class="title_icon"><img src="images/bullet2.gif"
						alt="" title="" /></span>新书介绍
				</div>
				<div class="new_products">
					<%
						String sql1 = "select * from book order by Entrytime Desc limit 0,4";
						ps = conn.prepareStatement(sql1);
						ResultSet rs1 = ps.executeQuery();
						if (rs1 != null) {
							while (rs1.next()) {
								String urlimage=rs1.getString("Image");
					%>


					<div class="new_prod_box">
						<a href="details.jsp?isbn=<%=rs1.getString("ISBN")%>"><%=rs1.getString("BookName")%></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/new_icon.gif"
								alt="" title="" /></span> <a href="details.jsp?isbn=<%=rs1.getString("ISBN")%>"><img src=<%=urlimage%> alt="" title="" class="thumb" border="0" /></a>
						</div>
					</div>

					<%
						}
						} else {
					%>

					<div class="new_prod_box">
						<a href="details.html">没有新书</a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/new_icon.gif"
								alt="" title="" /></span> <a href="details.html"><img
								src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
						</div>
					</div>

					<%
						}
						rs1.close();
						
					%>
				</div>

				
				<div class="clear"></div>
			</div>
			<!--end of left content-->
			
			<div class="right_content">
					<%
				String sessionusername = (String) session.getAttribute("username");
				String welcome = "请先登录，否则无法购买商品";
				if (sessionusername != null && sessionusername.equals("") == false) {
					welcome = "欢迎" + sessionusername + "登录本系统";
				%><div class="languages_box"><%=welcome%></div>
				<div class="currency"><a href='LogoutServlet'>退出</a></div><%}else{	
					
			%><div class="languages_box"><%=welcome%></div>
					<div class="currency"><a href='myaccount.jsp'>登录</a></div><%}%>
				


				<div class="cart">
					<div class="title">
						<span class="title_icon"><a href="showcar.jsp" class="view_cart"><img src="images/cart.gif" alt=""
							title="" />购物车</a></span>
					</div>
					

				</div>




				<div class="title">
					<span class="title_icon"><img src="images/bullet3.gif"
						alt="" title="" /></span>关于我们
				</div>
				<div class="about">
					<p>
						<img src="images/about.gif" alt="" title="" class="right" />
						本网上书店专注于计算机类、英语类和文学类的图书。上架图书比较新颖，价格优惠。
					</p>

				</div>

				<div class="right_box">

					<div class="title">
						<span class="title_icon"><img src="images/bullet4.gif"
							alt="" title="" /></span>促销图书
					</div>
					<%
						String sql2 = "select * from book where SpecialBook=? limit 0,2";
						ps = conn.prepareStatement(sql2);
						ps.setInt(1,1);
						ResultSet rs2 = ps.executeQuery();
						if (rs2 != null) {
							while (rs2.next()) {
								String urlnewimage=rs2.getString("Image");
					%>
					<div class="new_prod_box">
						<a href="details.jsp?isbn=<%=rs2.getInt("ISBN") %>">书名</a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/promo_icon.gif"
								alt="" title="" /></span> <a href="details.jsp?isbn=<%=rs2.getString("ISBN")%>"><img
								src=<%=urlnewimage%> alt="" title="" class="thumb" border="0" /></a>
						</div>
					</div>
					<%}}
					    rs2.close();
						ps.close();
						conn.close();%>					
				</div>

				<div class="right_box">

					<div class="title">
						<span class="title_icon"><img src="images/bullet5.gif"
							alt="" title="" /></span>图书分类
					</div>

					<ul class="list">
						<li><a href="#">文学</a></li>
						<li><a href="#">计算机</a></li>
						<li><a href="#">英语</a></li>

					</ul>

					<div class="title">
						<span class="title_icon"><img src="images/bullet6.gif"
							alt="" title="" /></span>合作伙伴
					</div>

					<ul class="list">
						<li><a href="#">人民教育出版社</a></li>
						<li><a href="#">清华大学出版社</a></li>
						<li><a href="#">四川文学出版社</a></li>

					</ul>

				</div>


			</div>
			<!--end of right content-->




			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<div class="footer">
			<div class="left_footer">
				<img src="images/footer_logo.gif" alt="" title="" /><br /> <a
					href="http://www.cssmoban.com/" title="free templates">cssmoban</a>
			</div>
			<div class="right_footer">
				<a href="#">主页</a> <a href="#">关于我们</a> <a href="#">服务</a> <a
					href="#">联系我们</a>

			</div>


		</div>


	</div>

</body>
</html>