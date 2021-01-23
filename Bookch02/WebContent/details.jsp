<%@page import="uzz.book.db.DbOper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" href="lightbox.css" type="text/css" media="screen" />
	
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>


<script type="text/javascript">
    var a = 1;
    function add() {
    	a++;
        document.getElementById("txt").value = a;
    }
    function sub() {
        a--;
        if(a<=0){a=1};
        document.getElementById("txt").value = a;
    }
</script>

</head>
<body>
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
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
        	<div class="crumb_nav">
            <a href="index.jsp">主页</a> &gt;&gt; 商品名称
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>商品名称</div>
        
        	<%
        	request.setCharacterEncoding("utf-8");
        	String isbn=request.getParameter("isbn");
        	Connection con=DbOper.connect("bookstore");
        	String sql="select * from book where ISBN=?";
        	 request.setCharacterEncoding("utf-8");
        	 PreparedStatement ps=con.prepareStatement(sql);
        	 ps.setInt(1, Integer.parseInt(isbn));
        	 ResultSet rs=ps.executeQuery();
        	
        	%>
        	<%if(rs!=null&&rs.next()){ %>
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="details.jsp?isbn=<%=rs.getInt("ISBN")%>"><img src=<%=rs.getString("Image")%> alt="" title="" border="0" /></a>
                <br /><br />
                </div>
               
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">详细信息</div>
                    <p class="details"><%=rs.getString("decription") %>          </p>
                    <div class="price"><strong>价格:</strong> <span class="red"><%=rs.getDouble("price")%>￥</span></div>
                    <div class="price"><strong>数量:</strong> <span class="red" id="booknumid"><%=rs.getDouble("count")%>本</span></div>
                    <!--  <div class="price"><strong>颜色:</strong> 
                    <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>                    </div>
               -->
 
         
         <div class="price">
        <div >
            <a onclick="javascript:add()">+</a>
            <input id="txt" type="text" value="1" style="width:30px" />
            <a onclick="javascript:sub()">-</a>
                        <a href="shopcarservlet?isbn=<%=rs.getInt("ISBN")%>" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
        </div>
        </div>
         <div class="clear"></div>
                    </div>
                    <%}rs.close();
                    %>
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
              
           

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
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
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="showcar.jsp" class="view_cart">view cart</a>
              
              </div>
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们</div> 
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
						ps = con.prepareStatement(sql2);
						ps.setInt(1,1);
						ResultSet rs2 = ps.executeQuery();
						if (rs2 != null) {
							while (rs2.next()) {
								String urlnewimage=rs2.getString("Image");
					%>
					<div class="new_prod_box">
						<a href="details.jsp?isbn=<%=rs2.getInt("ISBN") %>"><%=rs2.getString("BookName") %></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img src="images/promo_icon.gif"
								alt="" title="" /></span> <a href="details.jsp?isbn=<%=rs2.getInt("ISBN") %>"><img
								src=<%=urlnewimage%> alt="" title="" class="thumb" border="0" /></a>
						</div>
					</div>
					<%}}
					    rs2.close();
						ps.close();
						con.close();%>					
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
        
             
        
        </div><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
				<a href="#">主页</a> <a href="#">关于我们</a> <a href="#">服务</a> <a
					href="#">联系我们</a>

	</div>
        
       
       </div>
    

</div>

</body>
<script type="text/javascript">

var tabber1 = new Yetii({
id: 'demo'
});

</script>
</html>