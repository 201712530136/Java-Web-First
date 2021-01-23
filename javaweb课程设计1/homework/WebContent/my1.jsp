<%@page import="book.DbOper"%>
<%@page import="java.util.StringTokenizer"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的信息</title><!-- 页面由钟振贤设计 功能由董莹 -->
<!-- meta-tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //meta-tags -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
</head>
<body>
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
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">
						<h1>
							<span class="fa fa-leanpub" aria-hidden="true"></span>黄山店社区 <label>生活
								& 工作</label>
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

<!-- -----从这里开始-----   -->	
	
<!-- -----取用户名-----   -->	
	
	<!-- banner -->
	<div class="inner_page_agile"></div>
	<!--//banner -->
	<!-- short-->
	<div class="services-breadcrumb">
		<div class="inner_breadcrumb">
			<ul class="short_ls">
				<li><a href="index.jsp">主页</a> <span>| |</span></li>
				<li>我的</li>
			</ul>
		</div>
	</div>
	<!-- //short-->
	<!-- blog -->
	<div class="blog-cource">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					
					<span><%=username%>的信息</span>
<!-- -----放用户名-----   -->
				
				</h3>
				<div class="tittle-style"></div>
			</div>

			<%
				request.setCharacterEncoding("utf-8");
				Connection conn = DbOper .connect("huangshandian");
				String sql = "select * from user1 where username=?";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				if (rs != null && rs.next()) {
			%>

			<table border='2' width="100%">
				<tr style="width: 30px">
					<th>名字</th>
					
					<th>电话</th>
					<th>电子邮箱</th>
					<th>社区金币（兑换奖品）</th>
				</tr>
				<tr style="width: 30px">
					<th><%=rs.getString("username")%></th>
					
					<th><%=rs.getString("phone")%></th>
					<th><%=rs.getString("email")%></th>
					<th><%=rs.getString("gold")%></th>
				</tr>
			</table>

			<p>&nbsp</p>
         
			
			<%
				}
				DbOper.closeJDBC(rs, ps, conn);
			%>
			
			
					<%
				request.setCharacterEncoding("utf-8");
				Connection conn1 = DbOper .connect("huangshandian");
				String sql1 = "select * from volunteers where voName=?";
				
				PreparedStatement ps1 = conn1.prepareStatement(sql1);
				ps1.setString(1, username);
				ResultSet rs1 = ps1.executeQuery();
				if (rs1 != null && rs1.next()) {
			%>
			
			   <h4>志愿者申请信息</h4>
			<table border='2' width="100%">
				<tr>
					<th>申请结果</th>
					<th>原因</th>
					<th>分配工作</th>
				</tr>
				<tr>
					<th><%=rs1.getString("voVO")%></th>
					<th><%=rs1.getString("voText")%></th>
					<th><%=rs1.getString("voJobA")%></th>
				</tr>
			</table>
			
				<%
				}
				DbOper.closeJDBC(rs1, ps1, conn1);
			%>
			
			
			
			
			<a href="LogoutServlet" class="button-style">- 登出 -</a> <!-- 清空session -->
			&nbsp&nbsp&nbsp&nbsp&nbsp 
			<a href="changepass1.jsp" class="button-style">- 修改密码  -</a> 
			&nbsp&nbsp&nbsp&nbsp&nbsp 
			<a href="javascript:history.go(-1)" class="button-style">- 返回 -</a>

<!-- -----到这里结束-----   -->

		</div>
	</div>
	<!-- //blog -->

	<!-- footer -->
	<div class="mkl_footer">
		<div class="sub-footer">
			<div class="container">
				<div class="mkls_footer_grid">
					<div class="col-xs-4 mkls_footer_grid_left">
						<h4>地址:</h4>
						<p>
							黄山名苑小区 居委会 <br> 中国，山东，济南
						</p>
					</div>
					<div class="col-xs-4 mkls_footer_grid_left">
						<h4>联系我们:</h4>
						<p>
							<span>电话 : </span>15065317248
						</p>
						<p>
							<span>Email : </span> <a href="mailto:1759721429@qq.com">1759721429@qq.com</a>
						</p>
					</div>
					<div class="col-xs-4 mkls_footer_grid_left">
						<h4>声明:</h4>
						<p>后台</p>


						</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="botttom-nav-allah">

					<a href="index1.jsp">主页</a> &nbsp&nbsp&nbsp&nbsp <a
						href="liuyanban41.jsp" class="effect-3">留言板后台</a> &nbsp&nbsp
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