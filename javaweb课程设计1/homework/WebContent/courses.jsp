
<%@page import="book.DbOper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>公告</title><!-- 钟振贤 -->
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
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<nav class="link-effect-2" id="link-effect-2">
							<ul class="nav navbar-nav">
								<li>
									<a href="index.jsp" class="effect-3">主页</a>
								</li>
								<li>
									<a href="my.jsp" class="effect-3">我的</a>
								</li>
								<li>
									<a href="liuyanban4.jsp" class="effect-3">留言板</a>
								</li>
								<li>
									<a href="courses.jsp" class="effect-3">公告</a>
								</li>
								<li>
									<a href="join.jsp" class="effect-3">加入我们</a>
								</li>
							
								<li>
									<a href="gallery.jsp" class="effect-3">成果展示</a>
								</li>
								
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
			<li><a href="index.jsp">主页</a> <span>| |</span></li>
			<li>公告</li>
		</ul>
	</div>
</div>
<!-- //short-->
<!-- blog -->
<div class="blog-cource">
	<div class="container">
		<div class="title-div">
			<h3 class="tittle">
				<span>公告</span>

			</h3>
			<div class="tittle-style"></div>
		</div>

        <!-- -----从这里开始-----   -->

		<%
			Connection conn = DbOper.connect("huangshandian");//数据库需要修改
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
				<a class="button-style" href="details.jsp?id=<%=rs.getInt("ID")%>">查看详情</a>
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
				<a href="courses.jsp?page=<%=currentpage - 1%>"> << </a>
				<%
					for (int o = 1; o <= totalpage; o++) {
				%>
				<a href="courses.jsp?page=<%=o%>"><%=o%></a>
				<%
					}
				%>
				
				<a href="courses.jsp?page=<%=currentpage + 1%>"> >> </a>
				
				<!-- 分页   -->
				
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
					<div class="col-xs-4 mkls_footer_grid_left">
						<h4>声明:</h4>
						<p>前台</p>
						
						
						</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="botttom-nav-allah">
					
									<a href="index.jsp" >主页</a>
								&nbsp&nbsp&nbsp&nbsp
								
										<a href="liuyanban4.jsp" >留言板</a>
								&nbsp&nbsp&nbsp&nbsp
								
									<a href="courses.jsp" >公告</a>
							&nbsp&nbsp&nbsp&nbsp&nbsp
								
									<a href="join.jsp" >加入我们</a>
								&nbsp&nbsp&nbsp&nbsp&nbsp
							
								
									<a href="gallery.jsp" >成果展示</a>
						
								
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
					<p>&nbsp&nbsp&nbsp&nbsp&nbsp页面来自 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> 赵维威修改
				</div>
				<div class="footercopy-social">
					<ul>
						<li>
							<a href="#">
								<span class="fa fa-facebook"></span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="fa fa-twitter"></span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="fa fa-rss"></span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="fa fa-vk"></span>
							</a>
						</li>
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

	<!-- Flexslider-js for-testimonials -->
	<script>
		$(window).load(function () {
			$("#flexiselDemo1").flexisel({
				visibleItems: 1,
				animationSpeed: 1000,
				autoPlay: false,
				autoPlaySpeed: 3000,
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: {
					portrait: {
						changePoint: 480,
						visibleItems: 1
					},
					landscape: {
						changePoint: 640,
						visibleItems: 1
					},
					tablet: {
						changePoint: 768,
						visibleItems: 1
					}
				}
			});

		});
	</script>
	<script src="js/jquery.flexisel.js"></script>
	<!-- //Flexslider-js for-testimonials -->
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/move-top.js"></script>   <!-- 跳到顶部 -->
	<script src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script>
		$(document).ready(function () {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- smooth scrolling -->
	<!-- //js-files -->

</body>

</html>