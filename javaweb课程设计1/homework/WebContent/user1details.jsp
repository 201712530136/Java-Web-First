<%@page import="book.DbOper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息修改</title>
<!-- 用户信息后台的修改-->
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
					<a class="navbar-brand" href="index1.jsp">
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
	<!-- banner -->
	<div class="inner_page_agile"></div>
	<!--//banner -->
	<!-- short-->
	<div class="services-breadcrumb">
		<div class="inner_breadcrumb">
			<ul class="short_ls">
				<li><a href="index1.jsp">主页</a> <span>| |</span></li>
				<li>用户后台信息修改</li>
			</ul>
		</div>
	</div>
	<!-- //short-->
	<!-- blog -->
	<div class="blog-cource">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>用户信息修改</span>
				</h3>
				<div class="tittle-style"></div>
			</div>

			
		<!-- -----从这里开始-----   -->

			<%
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				Connection conn = DbOper.connect("huangshandian");
				String sql = "select * from user1 where id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();

				if (rs != null && rs.next()) {
					
					//这里厉害了 不能用超链接传递的值我用session传  标记好 id4这个session属性在这里被占用了 用来表示当前修改的用户id用完一次记得删掉
					session.setAttribute("id4",id);
			%>
			<div class="">
		
			</div>

			<div class="clearfix"></div>

			<div class="col-xs-8 blog-grid-text">
				<h4>用户id为：<%=rs.getString(1)%></h4>
				用户姓名：<%=rs.getString(2) %>
				<form action="Newpass" method="post">
					
					用户密码：
					<div class="Newpass"><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						<textarea name="Newpass" placeholder=<%=rs.getString(3)%> required="" cols=40 rows =2></textarea>
					</div>
					
					
					<input type="submit" value="提交新密码">
				</form>
				<dr>
				<form action="NewEmail" method="post">
					
					电子邮箱：
					<div class="NewEmail"><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						<textarea name="NewEmail" placeholder=<%=rs.getString(4)%> required="" cols=40 rows =2></textarea>
					</div>
						<input type="submit" value="提交新电子邮箱">
				</form>
					<dr>
					
				<form action="NewPhone" method="post">
					
					电话号码：
					<div class="">
						<textarea name="NewPhone" cols=40 rows =5><%=rs.getString(5)%></textarea>
					</div>
						<input type="submit" value="修改电话号码">
				</form>
				
					
					<div>
					用户类型：<%if(rs.getInt("role")==1){ //这地方展示公告的类型%>管理员&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
					<a href="Newrole?role=0" class="">- 修改为普通用户 -</a><%}
					else if(rs.getInt("role")==0) {%> 普通用户 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
					<a href="Newrole?role=1" class="">- 修改为管理员 -</a>  <%} 
					
				else  {%> 等待修改 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				<a href="Newcode?role=0" class="">- 修改为普通用户 -</a>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
					<a href="Newcode?role=1" class="">- 修改为管理员-</a><%} %>
				
				
			 		 </div>        <dr>   <dr> 
			 		  金币余额：<dr>
			 		<div class=""><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						
						<textarea name="people" placeholder="" cols=10 rows =3 ><%=rs.getString(9)%></textarea>
					</div>
				
				
			
			</div>

			<div class="clearfix"></div>


			<%
		
				}
				DbOper.closeJDBC(rs, ps, conn);
			
				
			%>
			
			
			

			<div>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				
				<!-- 这里写好了就需要在在servlet中里判断n的值然后和、改变数据库中最后一个值得状态 
				<a href="Join1detailschangeServlet?n=0" class="button-style">- 修改状态为通过 -</a> 
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				<a href="Join1detailschangeServlet?n=1" class="button-style">- 修改状态为不通过 -</a> 
				-->
				
				
				
				&nbsp
				<a href="user1.jsp" class="button-style">- 返回 -</a>
			</div>

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