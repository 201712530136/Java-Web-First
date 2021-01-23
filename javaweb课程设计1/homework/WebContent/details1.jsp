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
<title>公告修改</title>
<!-- 公告后台的修改-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="text/javascript">
function readFile(obj){ 
	 var file = obj.files[0];  
	 //判断类型是不是图片 
	  if(!/image\/\w+/.test(file.type)){ 
	    alert("请确保文件为图像类型"); 
	    return false; 
	  } 
	  var reader = new FileReader(); 
	  reader.readAsDataURL(file); 
	  reader.onload = function(e){
	   dealImage(this.result,{width:200},function(base){
		    var input_imgdata_base64 = document.getElementById('imagebaseID');
		    input_imgdata_base64.value=base;
		     document.getElementById('imgid').setAttribute('src',base)
	   });
	   
	  } 
	} 
	
function readFile1(obj){ 
	 var file = obj.files[0];  
	 //判断类型是不是图片 
	  if(!/image\/\w+/.test(file.type)){ 
	    alert("请确保文件为图像类型"); 
	    return false; 
	  } 
	  var reader = new FileReader(); 
	  reader.readAsDataURL(file); 
	  reader.onload = function(e){
	   dealImage(this.result,{width:200},function(base){
		    var input_imgdata_base64 = document.getElementById('imagebaseID1');
		    input_imgdata_base64.value=base;
		     document.getElementById('imgid1').setAttribute('src',base)
	   });
	   
	  } 
	} 

	/**
	 * 图片压缩，默认同比例压缩
	 * @param {Object} path
	 * pc端传入的路径可以为相对路径，但是在移动端上必须传入的路径是照相图片储存的绝对路径
	 * @param {Object} obj
	 * obj 对象 有 width， height， quality(0-1)
	 * @param {Object} callback
	 * 回调函数有一个参数，base64的字符串数据
	 */
	function dealImage(path, obj, callback){
	 var img = new Image();
	 img.src = path;
	 img.onload = function(){
	 var that = this;
	 // 默认按比例压缩
	 var w = that.width,
	 h = that.height,
	 scale = w / h;
	 w = obj.width || w;
	 h = obj.height || (w / scale);
	 if(w>400){
		 w=400;
	 }
	 if(h>300){
		 h=300;
	 }
	 //alert(w);
	 var quality = 1; // 默认图片质量为0.7
	 //生成canvas
	 var canvas = document.createElement('canvas');
	 var ctx = canvas.getContext('2d');
	 // 创建属性节点
	 var anw = document.createAttribute("width");
	 anw.nodeValue = w;
	 var anh = document.createAttribute("height");
	 anh.nodeValue = h;
	 canvas.setAttributeNode(anw);
	 canvas.setAttributeNode(anh);
	 ctx.drawImage(that, 0, 0, w, h);
	 // 图像质量
	 if(obj.quality && obj.quality <= 1 && obj.quality > 0){
	 quality = obj.quality;
	 }
	 // quality值越小，所绘制出的图像越模糊
	 var base64 = canvas.toDataURL('image/jpeg', quality );
	 // 回调函数返回base64的值
	 callback(base64);
	 }
	}
	 
	 
	
	 
	 </script>
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
					<li><a href="#" class="effect-3">社区成员信息</a></li>
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
				<li>公告修改</li>
			</ul>
		</div>
	</div>
	<!-- //short-->
	<!-- blog -->
	<div class="blog-cource">
		<div class="container">
			<div class="title-div">
				<h3 class="tittle">
					<span>公告修改</span>
				</h3>
				<div class="tittle-style"></div>
			</div>

			
		<!-- -----从这里开始-----   -->

			<%
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				Connection conn = DbOper.connect("huangshandian");
				String sql = "select * from activity where ID = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();

				if (rs != null && rs.next()) {
					
					//这里厉害了 不能用超链接传递的值我用session传  标记好 id2这个session属性在这里被占用了 用来表示当前修改的公告编号
					session.setAttribute("id2",id);
			%>
			<div class="">
		
			</div>

			<div class="clearfix"></div>

			<div class="col-xs-8 blog-grid-text">
				<h4>第<%=rs.getString(1)%>条公告:</h4>
				
				<form action="NewName" method="post">
					
					公告名称：
					<div class=""><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						<textarea name="NewName" placeholder=<%=rs.getString(3)%> required="" cols=40 rows =2></textarea>
					</div>
					
					
					<input type="submit" value="提交新公告名">
				</form>
				
				<form action="NewAct" method="post">
					
					公告标题：
					<div class=""><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						<textarea name="NewAct" placeholder=<%=rs.getString(4)%> required="" cols=40 rows =2></textarea>
					</div>
					
					
					<input type="submit" value="提交新标题">
				</form>
				<dr>
				<form action="NewTime" method="post">
					
					截止时间：
					<div class=""><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						<textarea name="NewTime" placeholder=<%=rs.getString(2)%> required="" cols=40 rows =2></textarea>
					</div>
						<input type="submit" value="提交新截止时间">
				</form>
					<dr>
					
				<form action="NewText" method="post">
					
					公告内容：
					<div class="">
						<textarea name="NewText" cols=40 rows =5><%=rs.getString(5)%></textarea>
					</div>
						<input type="submit" value="修改文字内容">
				</form>
				<!-- 修改公告图片左 -->
				<form action="FileUpServlet1" method="post" enctype="multipart/form-data">
					左侧图片：
				
						<img src=<%=rs.getString("Image1")%> class="img-responsive" alt="" />
						<input type="hidden" name="imagebase" value="ba" id="imagebaseID"/>
						文件上传：<input type="file" name="fileupload"  onchange="readFile(this)" />
						<input type="submit" name="submit" value="修改左侧图片">
						</form>
						<dr>图片<img  style="" id="imgid" src="" alt="" />	
					
					
					<!-- 修改公告图片右 -->
				<form action="FileUpServlet2" method="post" enctype="multipart/form-data">
					右侧图片：
				
						<img src=<%=rs.getString("Image2")%> class="img-responsive" alt="" />
						<input type="hidden" name="imagebase1" value="ba" id="imagebaseID1"/>
						文件上传：<input type="file" name="fileupload1"  onchange="readFile1(this)" />
						<input type="submit" name="submit" value="修改右侧图片">
						</form>
						<dr>图片<img  style="" id="imgid1" src="" alt="" />	
					
					<div>
					公告类型：<%if(rs.getInt("code")==1){ //这地方展示公告的类型%>活动 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
					<a href="Newcode?code=0" class="">- 修改为通知 -</a><%}
					else if(rs.getInt("code")==0) {%> 通知 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
					<a href="Newcode?code=1" class="">- 修改为活动 -</a>  <%} 
					
					else  {%> 等待修改 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
					<a href="Newcode?code=1" class="">- 修改为活动 -</a>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
					<a href="Newcode?code=0" class="">- 修改为通知 -</a><%} %>
				
				
			 		 </div>        <dr>   <dr> 
			 		  当前参与人员：<dr>
			 		<div class=""><!-- textarea  标签定义多行的文本输入控件。
									文本区中可容纳无限数量的文本，其中的文本的默认字体是等宽字体（通常是 Courier）。
									可以通过 cols 和 rows 属性来规定 textarea 的尺寸，-->
						
						<textarea name="people" placeholder="" cols=40 rows =5 ><%=rs.getString(9)%></textarea>
					</div>
				
				
			
			</div>

			<div class="clearfix"></div>


			<%
		
				}
				DbOper.closeJDBC(rs, ps, conn);
			
				
			%>
			
			
			

			<div>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
				
			
				
				
				&nbsp
				<a href="courses1.jsp" class="button-style">- 返回 -</a>
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
						href="user1.jsp" class="effect-3">社区成员信息</a>







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