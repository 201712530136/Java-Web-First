<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="text.*"%>
<%@ page language="java"   import="java.util.*"   import="java.sql.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
	<!-- 美化table样式的style -->
	
	<style type="text/css">  
<!--  
/************ Table ************/  
.xwtable {width: 100%;border-collapse: collapse;border: 1px solid #ccc;}                  
.xwtable thead td {font-size: 12px;color: #333333;text-align: center;background: url(table_top.jpg) repeat-x top center;border: 1px solid #ccc; font-weight:bold;}  
.xwtable tbody tr {background: #fff;font-size: 12px;color: #666666;}             
.xwtable tbody tr.alt-row {background: #f2f7fc;}                 
.xwtable td{line-height:20px;text-align: left;padding:4px 10px 3px 10px;height: 18px;border: 1px solid #ccc;}  
-->  
</style>  



	<title>留言板后台</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //meta-tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- fonts -->
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	    rel="stylesheet">
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
</head>

<body>

<script type="text/javascript">
         
    var i=0;
    setInterval('changeColor()',500);
        function changeColor(){
            var div=document.getElementById('liuyanren'); //获得div元素
            var colorArr=['#8A2BE2','#DEB887','#7FFF00','#008B8B','#FF1493']; //建立颜色库
            if(i==colorArr.length){ 
                    i=0;
                }else{
                    div.style.color=colorArr[i++%colorArr.length]; //循环颜色
                }
            }
</script>









		<!-- header -->
	<div class="header-top">
		<div class="container">
			<div class="bottom_header_left">
				<p>
					<span class="fa fa-map-marker" aria-hidden="true"></span>中国，山东，济南
				</p>
			</div>
			<%	
		String username = (String) session.getAttribute("username");//"小红";//页面通用 获取当前用户
		
		
	        %>
			<div class="bottom_header_right">
				<div class="bottom-social-icons">
					<a class="facebook" href="#"> <span class="fa fa-facebook"></span>
					</a> <a class="twitter" href="#"> <span class="fa fa-twitter"></span>
					</a> <a class="pinterest" href="#"> <span class="fa fa-pinterest-p"></span>
					</a> <a class="linkedin" href="#"> <span class="fa fa-linkedin"></span>
					</a>
				</div>
				<div class="header-top-righ">
				<%if(username!=null&&username!=""){ %>
					<a href="my.jsp"> <span class="fa fa-sign-out"
						aria-hidden="true"></span><h4><%=username %><h4>
					</a>
				<%} else{ %>
					<a href="Login.jsp"> <span class="fa fa-sign-out"
						aria-hidden="true"></span>登陆
					</a>
					<%} %>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="header">
		<div class="content white">
			<nav class="navbar navbar-default">
				<div class="container">
				<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
							<a class="navbar-brand" href="index.jsp">
							<h1>
								<span class="fa fa-leanpub" aria-hidden="true"></span>黄山店社区
								<label>生活 & 工作</label>
							</h1>
						</a>
					</div>
				<!--/.右上角菜单栏-->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<nav class="link-effect-2" id="link-effect-2">
				<ul class="nav navbar-nav">
					<li><a href="index1.jsp" class="effect-3">主页</a></li>
					<li><a href="my1.jsp" class="effect-3">我的</a></li>
					<li><a href="liuyanban41.jsp" class="effect-3">留言板后台</a></li>
					<li><a href="courses1.jsp" class="effect-3">公告后台</a></li>
					<li><a href="join1.jsp" class="effect-3">志愿者后台</a></li>

					<li><a href="gallery1.jsp" class="effect-3">成果后台</a></li>
					<li><a href="user1.jsp" class="effect-3">社区成员信息</a></li>
				</ul>
				</nav>
			</div>
			<!--/.navbar-collapse-->
					<!--/.navbar-->
				</div>
			</nav>
		</div>
	</div>
	<!-- banner -->
	<div class="inner_page_agile">

	</div>
	<!--//banner -->
	<!-- short -->
	<div class="services-breadcrumb">
		<div class="inner_breadcrumb">
			<ul class="short_ls">
				<li>
					<a href="index1.jsp">主页</a>
					<span>| |</span>
				</li>
				<li>留言板后台</li>
			</ul>
		</div>
	</div>
	<!-- //short-->
	<!-- about -->
	<div class="about-sec" id="about">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					社区留言板<!-- 在session里取出用户信息来-->
				</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="about-sub">
				<div class="col-md-6 about_bottom_left">
					<h4>欢迎来到
						<span>黄山店社区</span>
					</h4>
					<p>您现在可以把祝福以及建议直接公布在留言板上，我们看到后会反映给网站管理人员以及黄山店村党支部</p>
					<p>您也可以在此公布您的一些需求例如寻找丢失的物品，出租房屋，我们会帮助您公示到公告栏中</p>
				</div>
				<!-- Stats-->
				<div class="col-md-6 about2-info">
					<img src="images/graduate.png" alt="" />
				</div>
				</div>
							<% String name=(String) session.getAttribute("username");//哈哈这个应该每个页面都用的到 %>
				<h4></h4>
				<form action="liuyanban41.jsp" method="get"    >
					
					<h4><%=name %>:</h4>
					<div class="">
						<input type="text" style="width:1150px;//宽度 height=30px;//高度"  name="title" placeholder="请输入您的标题" required="">
					</div>
					<div class="">
						<textarea  style="width:1150px;//宽度 height=60px;//高度"name="message" placeholder="请输入留言内容" required=""></textarea>
					</div>
					<input type="submit" value="提交">
				</form>
				
				
				
				
		<div>

	 <%
	 
	
		
		
      
      
       String title=request.getParameter("title");
       
       String message=request.getParameter("message");
      
      
           String time=(new Date()).toLocaleString();
           
   
String driverName="com.mysql.jdbc.Driver";
String userName="root";
String userPwd="123456";
String dbName="huangshandian";
String url1="jdbc:mysql://localhost:3306/"+dbName;
String url2="?user="+userName+"&password="+userPwd;
String url3="&useUnicode=true&characterEncoding=UTF-8";
String url=url1+url2+url3;
Class.forName(driverName);
Connection conn=DriverManager.getConnection(url);
String sql="Insert into liuyanban2(liuyanren,biaoti,liuyanshijian,liuyanneirong)values(?,?,?,?)";
PreparedStatement pstmt=conn.prepareStatement(sql);

pstmt.setString(1,name);
pstmt.setString(2,title);
pstmt.setString(3,time);
pstmt.setString(4,message);



int n=pstmt.executeUpdate();
if(n==1){%><br><%}
else{ %>失败<br><%}
if(pstmt!=null){pstmt.close(); }
if(conn!=null){conn.close();}
           
       
      %>
          
      <% 
      get g=new get();
      try {
    	    //这里的是MYSQL 举例
    	    //加载驱动 
    	    Class.forName("com.mysql.jdbc.Driver");
    	    //创建数据库连接
    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/huangshandian","root","123456");
    	    //创建查询 “请求”
    	    PreparedStatement ps = con.prepareStatement("select * from liuyanban2");
    	    //返回查询结果
    	    ResultSet rs = ps.executeQuery();
    	    //遍历结果
    	    while(rs.next()) {
    	        //假如 User 表中 有个 name 列
    	
    	        
    	        //新改
    	        //String liuyanren=rs.getString("liuyanren");
    	        //String liuyanneirong=rs.getString("liuyanneirong");
    	        //String liuyanshijian=rs.getString("liuyanshijian");
    	        //String  biaoti=rs.getString("biaoti");
    	       // class="title" id="liuyanren"
    	        g.setliuyanren(rs.getString("liuyanren"));
				g.setliuyanshijian(rs.getString("liuyanshijian"));
				g.setliuyanneirong(rs.getString("liuyanneirong"));
				g.setbiaoti(rs.getString("biaoti"));
				
				%>
				<body text="red">
				
				

				<a  href="mya1.jsp?username=<%=rs.getString("liuyanren")%>"><h2><%=g.getliuyanren()  %></h2></a>
				
				 <a  href="LYdel?time=<%=rs.getString("liuyanshijian")%>">删除</a><!-- 可以根据时间删除我觉得 --> 
			   <h3><%=g.getliuyanshijian()    %></h3>
			   
				<h4><%=g.getbiaoti()    %></h4>
				
			<p><%=g.getliuyanneirong()    %></p>
			
			<br><br>
				
				
				

			    
								<% 
    	        
    	       }
    	  
    	    rs.close();
    	    ps.close();
    	    con.close();
    	} catch (Exception e) {
    	    e.printStackTrace();
    	}

    
       
           
     
    %>


</div>
			
		
	
     

						
						
					
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="modal about-modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Best
						<span>Study</span>
					</h4>
				</div>
				<div class="modal-body">
					<div class="model-img-info">
						<img src="images/e1.jpg" alt="" />
						<p>Duis venenatis, turpis eu bibendum porttitor, sapien quam ultricies tellus, ac rhoncus risus odio eget nunc. Pellentesque
							ac fermentum diam. Integer eu facilisis nunc, a iaculis felis. Pellentesque pellentesque tempor enim, in dapibus turpis
							porttitor quis. Suspendisse ultrices hendrerit massa. Nam id metus id tellus ultrices ullamcorper. Cras tempor massa
							luctus, varius lacus sit amet, blandit lorem. Duis auctor in tortor sed tristique. Proin sed finibus sem
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mkl_footer">
		<div class="sub-footer">
			<div class="container">
				<div class="mkls_footer_grid">
					<div class="col-xs-4 mkls_footer_grid_left"  style="position:relative;width:400px;height:50px">
					 
						<h4>地址:</h4>
						<p>黄山名苑小区 居委会
							<br> 中国，山东，济南</p>
					</div>
					<div class="col-xs-4 mkls_footer_grid_left">
						<h4>联系我们:</h4>
						<p>
							<span>电话 : </span>15065317248</p>
						<p>
							<span>Email : </span>
							<a href="mailto:1759721429@qq.com">1759721429@qq.com</a>
						</p>
					</div>
					
					<div class="clearfix"> </div>
				</div>
				<div class="botttom-nav-allah">
					
								<a href="index1.jsp">主页</a> &nbsp&nbsp&nbsp&nbsp <a
						href="about1.jsp" class="effect-3">留言板后台</a> &nbsp&nbsp
						<a href="my1.jsp" class="effect-3">我的</a>&nbsp&nbsp
						<a href="courses1.jsp" class="effect-3">公告后台</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="join1.jsp" class="effect-3">志愿者后台</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="gallery1.jsp" class="effect-3">成果展示后台</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="#" class="effect-3">社区成员信息</a>







				</div>
				<!-- footer-button-info -->
				<div class="footer-middle-thanks">
					<h2>感谢您的支持</h2>
				</div>
				<!-- footer-button-info -->
			</div>
		</div>
		<div class="footer-copy-right">
			<div class="container">
				<div class="allah-copy">
					<p>
						&nbsp&nbsp&nbsp&nbsp&nbsp页面来自 <a href="http://www.cssmoban.com/"
							target="_blank" title="模板之家">模板之家</a> 赵维威修改
				</div>
				<div class="footercopy-social">
					<ul>
						<li><a href="#"> <span class="fa fa-facebook"></span>
						</a></li>
						<li><a href="#"> <span class="fa fa-twitter"></span>
						</a></li>
						<li><a href="#"> <span class="fa fa-rss"></span>
						</a></li>
						<li><a href="#"> <span class="fa fa-vk"></span>
						</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--/footer -->

	<!-- js files -->
	<!-- js -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- stats numscroller-js-file -->
	<script src="js/numscroller-1.0.js"></script>
	<!-- //stats numscroller-js-file -->
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script>
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- smooth scrolling -->
	<!-- //js-files -->

	</body>
</html>