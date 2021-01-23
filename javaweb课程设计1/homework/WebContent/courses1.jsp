
<%@page import="book.DbOper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公告后台</title>
<!-- 对公告进行修改，删除，添加，查看关注人数以及报名人数详情 -->
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
				<a class="weibo" href="https://weibo.com/">
						<span class="fa fa-twitter" ></span>
					</a>
					<a class="cctv" href="http://tv.cctv.com/lm/xwlb/">
						<span class="fa fa-facebook"></span>
					</a>
					
					<a class="pinterest" href="#">
						<span class="fa fa-pinterest-p"></span>
					</a>
					<a class="linkedin" href="#">
						<span class="fa fa-linkedin"></span>
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
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
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
<!-- banner -->
<div class="inner_page_agile"></div>
<!--//banner -->
<!-- short-->
<div class="services-breadcrumb">
	<div class="inner_breadcrumb">
		<ul class="short_ls">
			<li><a href="index1.jsp">主页</a> <span>| |</span></li>
			<li>公告后台</li>
		</ul>
	</div>
</div>
<!-- //short-->
<!-- blog -->
<div class="blog-cource">
	<div class="container">
		<div class="title-div">
			<h3 class="tittle">
				<span>公告后台</span>

			</h3>
			<div class="tittle-style"></div>
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp
		

				
			<a href="AddServlet" class="button-style">- 增加新公告位 -</a><!-- 这个servlet只计算一个编号就行了 -->
		</div>

        <!-- -----从这里开始-----   -->

		<%
			Connection conn = DbOper.connect("huangshandian");
			String sql = "select * from activity";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.last();
			int totalRecord = rs.getRow();//总记录个数       
			int pagesize = 2;//每页显示的记录个数     
			int totalpage = (totalRecord % pagesize) == 0
					? (totalRecord / pagesize)
					: (totalRecord / pagesize + 1);
			int currentpage = 1;
			String pagestr = request.getParameter("page");
			if (pagestr != null && pagestr.equals("") == false) {
				currentpage = Integer.parseInt(pagestr);
				if (currentpage < 1) {
					currentpage = 1;
				}
				if (currentpage >= totalpage) {
					currentpage = totalpage;
				}
			}
			int fromindex = (currentpage - 1) * pagesize + 1;
			int endindex = (currentpage * pagesize <= totalRecord)
					? (currentpage * pagesize)
					: totalRecord;
			if (rs != null) {
				for (int i = fromindex; i <= endindex; i++) {
					rs.absolute(i);
		%>

		<div class="blog-info">
			<div class="col-xs-4 blog-grid-img">
				<img src=<%=rs.getString("Image1")%> class="img-responsive" alt="" />
			</div>
			<div class="col-xs-8 blog-grid-text">
				<h4><%=rs.getString("HeadLine")%></h4>
				<h6><%=rs.getString("ActivityName")%></h6>
				<p>
					结束时间:<%=rs.getString("EndTime")%></p>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="blog-agileinfo blog-info-mdl">
			<div class="col-xs-8 blog-grid-text">
				<h4><%=rs.getString("ActivityName")%></h4>
				<p><%=rs.getString("Decription")%></p>
				<a class="button-style" href="details1.jsp?id=<%=rs.getInt("ID")%>">内容修改</a>
			&nbsp&nbsp&nbsp&nbsp&nbsp	<a class="button-style" href="GGdel?id=<%=rs.getInt("ID")%>">删除此公告</a>
			</div>
			<div class="col-xs-4 blog-grid-img blog-img-rght">
				<img src=<%=rs.getString("Image2")%> class="img-responsive" alt="" />
			</div>
			<div class="clearfix"></div>
		</div>

		<%
			}
			}
			DbOper.closeJDBC(rs, ps, conn);
		%>
		<div class="clearfix"></div>
		<div class="title-div">
			<h1>
				<a href="courses1.jsp?page=<%=currentpage - 1%>"> << </a>
				<%
					for (int o = 1; o <= totalpage; o++) {
				%>
				<a href="courses1.jsp?page=<%=o%>"><%=o%></a>
				<%
					}
				%>
				
				<a href="courses1.jsp?page=<%=currentpage + 1%>"> >> </a>
				
				<!-- 分页跳转的数字用了循环去实现，在左下角也挺美观的   -->
				
			</h1>
		</div>
		<div class="clearfix"></div>
		
		<!-- -----到这里结束-----   -->

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
						<p>not today</p>


						</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="botttom-nav-allah">

					<a href="index.jsp">主页</a> &nbsp&nbsp&nbsp&nbsp <a
						href="about.jsp">留言板</a> &nbsp&nbsp&nbsp&nbsp <a
						href="courses.jsp">公告</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="join.jsp">加入我们</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="gallery.jsp">成果展示</a> &nbsp&nbsp&nbsp&nbsp&nbsp <a
						href="contact.jsp">联系我们</a>

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