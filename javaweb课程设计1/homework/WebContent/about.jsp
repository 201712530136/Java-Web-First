<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>About Us</title>
	<!-- 留言板模板  -->
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
	<!-- header -->
	<div class="header-top">
		<div class="container">
			<div class="bottom_header_left">
				<p>
					<span class="fa fa-map-marker" aria-hidden="true"></span>中国，山东，济南
				</p>
			</div>
			<div class="bottom_header_right">
				<div class="bottom-social-icons">
					<a class="facebook" href="#">
						<span class="fa fa-facebook"></span>
					</a>
					<a class="twitter" href="#">
						<span class="fa fa-twitter"></span>
					</a>
					<a class="pinterest" href="#">
						<span class="fa fa-pinterest-p"></span>
					</a>
					<a class="linkedin" href="#">
						<span class="fa fa-linkedin"></span>
					</a>
				</div>
				<div class="header-top-righ">
					<a href="login.html">
						<span class="fa fa-sign-out" aria-hidden="true"></span>Login</a>
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
									<a href="about.jsp" class="effect-3">留言板</a>
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
								<li>
									<a href="contact.jsp" class="effect-3">联系我们</a>
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
	<div class="inner_page_agile">

	</div>
	<!--//banner -->
	<!-- short -->
	<div class="services-breadcrumb">
		<div class="inner_breadcrumb">
			<ul class="short_ls">
				<li>
					<a href="index.html">Home</a>
					<span>| |</span>
				</li>
				<li>留言板</li>
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
					在这个地方加上往数据库里写的那个留言板提交模块<img src="images/graduate.png" alt="" />
				</div>
				<!-- //Stats -->
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //about -->
	<!-- Achievements -->
	<div class="aitsresumethree">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
				留言展示模块，从数据库中取出的，加上分页，这后面都是
				</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="load_more">
				<ul id="myList">
					<li class="aitsaitsresumewthreeli-1">
						<div class="l_g">
							<div class="l_g_r g_r">
								<div class="work">
									<div class="work-info">
										<div class="col-xs-6 work-grid work-left">
											<h4>2000-2017</h4>
										</div>
										<div class="col-xs-6 work-grid work-right">
											<h5>Ranked Top 1st</h5>
											<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,
												eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo </p>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="work-info">
										<div class="col-xs-6 work-grid work-right work-right2">
											<h4>2011 - 2012</h4>
										</div>
										<div class="col-xs-6 work-grid work-left work-left2">
											<h5>Queen's Anniversary Prize</h5>
											<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,
												eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo </p>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="work-info">
										<div class="col-xs-6 work-grid work-left">
											<h4>2004 - 2017</h4>
										</div>
										<div class="col-xs-6 work-grid work-right">
											<h5 class="comp">Excellent University Guide</h5>
											<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,
												eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo </p>
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //Achievements -->
	<!-- about-team -->
	<div class="team">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>O</span>ur
					<span>F</span>aculties
				</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="team-row-agileinfo">
				<div class="col-md-3 col-sm-6 col-xs-6 team-grids">
					<div class="thumbnail team-agileits">
						<img src="images/t1.jpg" class="img-responsive" alt="" />
						<div class="effectd-caption">
							<h4>Vaura Tegsner</h4>
							<p>Principal</p>
							<div class="social-lsicon">
								<a href="#" class="social-button twitter">
									<span class="fa fa-twitter"></span>
								</a>
								<a href="#" class="social-button facebook">
									<span class="fa fa-facebook"></span>
								</a>
								<a href="#" class="social-button google">
									<span class="fa fa-google-plus"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 team-grids">
					<div class="thumbnail team-agileits">
						<img src="images/t2.jpg" class="img-responsive" alt="" />
						<div class="effectd-caption">
							<h4>Jark Kohnson</h4>
							<p>Senior Teacher</p>
							<div class="social-lsicon">
								<a href="#" class="social-button twitter">
									<span class="fa fa-twitter"></span>
								</a>
								<a href="#" class="social-button facebook">
									<span class="fa fa-facebook"></span>
								</a>
								<a href="#" class="social-button google">
									<span class="fa fa-google-plus"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 team-grids">
					<div class="thumbnail team-agileits">
						<img src="images/t3.jpg" class="img-responsive" alt="" />
						<div class="effectd-caption">
							<h4>Chunk Erson</h4>
							<p>Vice Principal</p>
							<div class="social-lsicon">
								<a href="#" class="social-button twitter">
									<span class="fa fa-twitter"></span>
								</a>
								<a href="#" class="social-button facebook">
									<span class="fa fa-facebook"></span>
								</a>
								<a href="#" class="social-button google">
									<span class="fa fa-google-plus"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-6 team-grids">
					<div class="thumbnail team-agileits">
						<img src="images/t4.jpg" class="img-responsive" alt="" />
						<div class="effectd-caption">
							<h4>Goes Mehak</h4>
							<p>Teacher Science</p>
							<div class="social-lsicon">
								<a href="#" class="social-button twitter">
									<span class="fa fa-twitter"></span>
								</a>
								<a href="#" class="social-button facebook">
									<span class="fa fa-facebook"></span>
								</a>
								<a href="#" class="social-button google">
									<span class="fa fa-google-plus"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //about-team -->
	<!-- middle section -->
	<div class="middle-sec-agile">
		<div class="container">
			<h4>Our
				<span>Best Study</span> Institute</h4>
			<ul>
				<li>
					<div class="midle-left-w3l">
						<span class="fa fa-check" aria-hidden="true"></span>
					</div>
					<div class="middle-right">
						<h5>Select A Course You Like And Explore It!</h5>
						<p>Integer eu facilisis nunc, a iaculis felis.</p>
					</div>
					<div class="clearfix"></div>
				</li>
				<li>
					<div class="midle-left-w3l">
						<span class="fa fa-check" aria-hidden="true"></span>
					</div>
					<div class="middle-right">
						<h5>Join A Seminar To Know More About It!</h5>
						<p>Integer eu facilisis nunc, a iaculis felis.</p>
					</div>
					<div class="clearfix"></div>
				</li>
				<li>
					<div class="midle-left-w3l">
						<span class="fa fa-check" aria-hidden="true"></span>
					</div>
					<div class="middle-right">
						<h5>Get Enrolled And Start Better Future With Us!</h5>
						<p>Integer eu facilisis nunc, a iaculis felis.</p>
					</div>
					<div class="clearfix"></div>
				</li>
			</ul>
			<a class="button-style" href="join.html">Join Now</a>
		</div>
		<div class="pencil-img">
			<img src="images/bg5.png" alt="" />
		</div>
	</div>
	<!-- //middle section -->
	<!-- news -->
	<div class="news" id="news">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>O</span>ur
					<span> E</span>vents
				</h3>
				<div class="tittle-style">

				</div>
			</div>
			<div class="yaallahaa-news-grids-agile">
				<div class="yaallahaa-news-grid">
					<div class="col-md-6 yaallahaa-news-left">
						<div class="col-xs-6 news-left-img">
							<div class="news-left-text color-event1">
								<h5>20 Dec</h5>
							</div>
						</div>
						<div class="col-xs-6 news-grid-info-bottom-w3ls">
							<div class="news-left-top-text text-color1">
								<a href="#" data-toggle="modal" data-target="#myModal">Integer viverra eleifend neque</a>
							</div>
							<div class="date-grid">
								<div class="admin">
									<a href="#">
										<span class="fa fa-clock-o" aria-hidden="true"></span> 7:00 pm - 9:00 pm</a>
								</div>
								<div class="time">
									<p>
										<span class="fa fa-map-marker" aria-hidden="true"></span> Newyork City, 2589</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-w3ls-text">
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-6 yaallahaa-news-left">
						<div class="col-xs-6 news-left-img news-left-img1">
							<div class="news-left-text color-event2">
								<h5>27 Dec</h5>
							</div>
						</div>
						<div class="col-xs-6 news-grid-info-bottom-w3ls">
							<div class="news-left-top-text text-color2">
								<a href="#" data-toggle="modal" data-target="#myModal">Integer viverra eleifend neque</a>
							</div>
							<div class="date-grid">
								<div class="admin">
									<a href="#">
										<span class="fa fa-clock-o" aria-hidden="true"></span> 6:00 am - 8:00 am</a>
								</div>
								<div class="time">
									<p>
										<span class="fa fa-map-marker" aria-hidden="true"></span> Newyork City, 1452</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-w3ls-text">
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="yaallahaa-news-grid">
					<div class="col-md-6 yaallahaa-news-left">
						<div class="col-xs-6 news-left-img news-left-img2">
							<div class="news-left-text color-event3">
								<h5>28 Dec</h5>
							</div>
						</div>
						<div class="col-xs-6 news-grid-info-bottom-w3ls">
							<div class="news-left-top-text text-color3">
								<a href="#" data-toggle="modal" data-target="#myModal">Integer viverra eleifend neque</a>
							</div>
							<div class="date-grid">
								<div class="admin">
									<a href="#">
										<span class="fa fa-clock-o" aria-hidden="true"></span> 10:00 am - 1:00 pm</a>
								</div>
								<div class="time">
									<p>
										<span class="fa fa-map-marker" aria-hidden="true"></span> Newyork City, 7458</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-w3ls-text">
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="col-md-6 yaallahaa-news-left">
						<div class="col-xs-6 news-left-img news-left-img3">
							<div class="news-left-text color-event4">
								<h5>30 Dec</h5>
							</div>
						</div>
						<div class="col-xs-6 news-grid-info-bottom-w3ls">
							<div class="news-left-top-text text-color4">
								<a href="#" data-toggle="modal" data-target="#myModal">Integer viverra eleifend neque</a>
							</div>
							<div class="date-grid">
								<div class="admin">
									<a href="#">
										<span class="fa fa-clock-o" aria-hidden="true"></span> 7:00 pm - 9:00 pm</a>
								</div>
								<div class="time">
									<p>
										<span class="fa fa-map-marker" aria-hidden="true"></span> Newyork City, 786.</p>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="news-grid-info-bottom-w3ls-text">
								<p>Aliquam erat volutpat. Duis vulputate tempus laoreet.</p>
							</div>
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
	<!-- //modal -->
	<!-- //news -->
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
						<p>not today</p>
						
						
						</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="botttom-nav-allah">
					
									<a href="index.jsp" >主页</a>
								&nbsp&nbsp&nbsp&nbsp
								
									<a href="about.jsp" >留言板</a>
								&nbsp&nbsp&nbsp&nbsp
								
									<a href="courses.jsp" >公告</a>
							&nbsp&nbsp&nbsp&nbsp&nbsp
								
									<a href="join.jsp" >加入我们</a>
								&nbsp&nbsp&nbsp&nbsp&nbsp
							
								
									<a href="gallery.jsp" >成果展示</a>
							&nbsp&nbsp&nbsp&nbsp&nbsp
								
									<a href="contact.jsp" >联系我们</a>
								
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
	<!-- smooth scrolling -->
	<script src="js/SmoothScroll.min.js"></script>
	<script src="js/move-top.js"></script>
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