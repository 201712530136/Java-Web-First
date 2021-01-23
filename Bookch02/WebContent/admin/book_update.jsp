<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="uzz.book.db.DbOper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if(validateForm()){
				//checkFyFhSubmit();
				$("#submitForm").attr("action", "updateBookServlet").submit();
			}
		});
		
		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});
		
		var result = 'null';
		if(result =='success'){
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});
	
	/** 检测房源房号是否存在  **/
	/*function checkFyFh(){
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();	
		var fyFh = $("#fyFh").val();
		if(fyXqCode!="" && fyDh!="" && fyCh!="" && fyFh!=""){
			// 给房屋坐落地址赋值
			$("#fyZldz").val($('#fyDh option:selected').text() + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"checkFyFhIsExists.action",
				data:{"fangyuanEntity.fyID":fyID,"fangyuanEntity.fyXqCode":fyXqCode, "fangyuanEntity.fyDhCode":fyDh, "fangyuanEntity.fyCh":fyCh, "fangyuanEntity.fyFh":fyFh},
				dataType : "text",
				success:function(data){
// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
						 $("#fyFh").css("background", "#EEE");
						 $("#fyFh").focus();
						 return false;
					}
				}
			});
		}
	}*/
	
	/** 检测房源房号是否存在并提交form  **/
	/*function checkFyFhSubmit(){
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();	
		var fyFh = $("#fyFh").val();
		if(fyXqCode!="" && fyDh!="" && fyCh!="" && fyFh!=""){
			// 给房屋坐落地址赋值
			$("#fyZldz").val($('#fyDh option:selected').text()  + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"checkFyFhIsExists.action",
				data:{"fangyuanEntity.fyID":fyID,"fangyuanEntity.fyXqCode":fyXqCode, "fangyuanEntity.fyDhCode":fyDh, "fangyuanEntity.fyCh":fyCh, "fangyuanEntity.fyFh":fyFh},
				dataType : "text",
				success:function(data){
// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
						 $("#fyFh").css("background", "#EEE");
						 $("#fyFh").focus();
						 return false;
					}else{
						$("#submitForm").attr("action", "/xngzf/archives/saveOrUpdateFangyuan.action").submit();
					}
				}
			});
		}
		return true;
	}*/
	
	/** 表单验证  **/
	function validateForm(){
		if($("#booknameid").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写图书名称', ok:true,});
			return false;
		}
		if($("#bookisbnid").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写图书isbn号', ok:true,});
			return false;
		}
		if($("#authorid").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写作者', ok:true,});
			return false;
		}
		if($("#priceid").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写图书价格', ok:true,});
			return false;
		}
		if($("#countid").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写图书数量', ok:true,});
			return false;
		}
		return true;
	}
</script>
</head>
<body>
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
		 document.getElementById('img').setAttribute('src',base)
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
	 if(w>98){
		 w=98;
	 }
	 if(h>150){
		 h=150
	 }
	 //alert(w);
	 var quality = 0.7; // 默认图片质量为0.7
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
	}</script>
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
	<%if(rs!=null&&rs.next()){
		
		String imgurl="../"+rs.getString("Image");
		String imgurl1=rs.getString("Image");
		
		%> 
	
<form id="submitForm" name="submitForm" action="updateBookServlet" method="post" enctype="multipart/form-data">
	<input type="hidden" name="imagebase" value="ba" id="imagebaseID"/>
	<input type="hidden" name="imagepath" value=<%=imgurl1%> id="imagepathID"/>
	<div id="container">
		<div id="nav_links">
	  当前位置：图书管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">图书添加</span></div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">书号</td>
					<td width="164" class="ui_text_lt"><input type="text" id="bookisbnid" name="bookisbn" value=<%=rs.getInt("isbn")%>  readonly="readonly" class="ui_input_txt02"/></td>
					<td width="450" rowspan="8" class="ui_text_lt"><img  style="" id="img" src=<%=imgurl%> alt="" />					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">书名</td>
					<td class="ui_text_lt"><input type="text" id="booknameid" name="bookname" value=<%=rs.getString("BookName")%> class="ui_input_txt02"/></td>
				</tr>
				<tr>
					<td class="ui_text_rt">作者</td>
					<td class="ui_text_lt"><input type="text" id="authorid" name="author" value=<%=rs.getString("Author")%> class="ui_input_txt02"/></td>
				</tr>
				<tr>
					<td class="ui_text_rt">价格</td>
					<td class="ui_text_lt"><input type="text" id="priceid" name="price" value=<%=rs.getDouble("price")%> class="ui_input_txt01"/>
				  元</td>
				</tr>
				<tr>
					<td class="ui_text_rt">数量</td>
					<td class="ui_text_lt"><input type="text" id="countid" name="count"  value=<%=rs.getInt("count")%> class="ui_input_txt01"/>
				  个</td>
				</tr>
				<tr>
					<td class="ui_text_rt">上传图片</td>
					<td class="ui_text_lt"><input type="file" id="picFile"  name="bookimage" onchange="readFile(this)"  style="border:none; background:none; height:35px"  /></td>
				</tr>
				<tr>
					<td class="ui_text_rt">是否特价</td>
					<td class="ui_text_lt"><select name="special" id="specialid" class="ui_select01">
					  <option value="">--请选择--</option>
					  <%int specialbook=rs.getInt("SpecialBook");
					  int CategoryId=rs.getInt("CategoryId");
					  %>
					  <option value="1" <%if(specialbook==1){ %>selected="selected"<%}%>>是</option>
					  <option value="0" <%if(specialbook==0){ %>selected="selected"<%}%>>否</option>
				    </select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">图书类型</td>
					<td class="ui_text_lt"><select name="Category" id="CategoryId" class="ui_select01">
					  <option value="1" <%if(CategoryId==1){ %>selected="selected"<%}%>>计算机</option>
					  <option value="2" <%if(CategoryId==2){ %>selected="selected"<%}%>>文学</option>
					  <option value="3" <%if(CategoryId==3){ %>selected="selected"<%}%>>外语</option>
				    </select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">图书简介</td>
					<td class="ui_text_lt">
					<textarea rows="7" cols="30"  name="description"  ><%=rs.getString("decription") %>
                        </textarea></td>
					<td class="ui_text_lt">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt"><input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
				    <input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/></td>
					<td class="ui_text_lt">
&nbsp;						&nbsp; </td>
				</tr>
			</table>
			<%}%>
		</div>
	</div>
</form>

</body>
</html>