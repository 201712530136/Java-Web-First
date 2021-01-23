<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
function changevalidate() {
	document.getElementById("validateid").src="ValidateCodeServlet?rand="+Math.random();
	
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
            <li class="selected"><a href="myaccount.jsp">我的账户</a></li>
            <li><a href="register.html">注册</a></li>
         <li><a href="myorder.jsp">我的订单</a></li>
            <li><a href="contact.html">联系我们</a></li>                                                                      
            </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>我的账户</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">请注册用户登录方可进行购买图书，非管理员用户请注册。.
            </p>
            <%
            String username="";
            String userpass="";
            Cookie[] cookies=request.getCookies();
            if(cookies!=null){
            for(Cookie cookie:cookies){
            	if("username".equals(cookie.getName())){
            		username=cookie.getValue();
            	}
            	if("userpass".equals(cookie.getName())){
            		System.out.println("mima"+cookie.getValue());
            		userpass=cookie.getValue();
            	}
            	
            }	
            }
            
            
            %>
              	<div class="contact_form">
                <div class="form_subtitle">输入您的用户</div>
                 <form name="login" action="LoginServlet" method="post">          
                    <div class="form_row">
                    <label class="contact" style="text-align:center"><strong>用户名:</strong></label>
                    <input type="text" class="contact_input"  name="username" value=<%=username%>>
                    </div>  


                    <div class="form_row">
                    <label class="contact"style="text-align:center"><strong>密&nbsp;&nbsp;&nbsp;&nbsp;码:</strong></label>
                    <input type="password" class="contact_input"  name="userpass" value=<%=userpass%>>
                    </div>    
                    
                     <div class="form_row">
                    <label class="contact"style="text-align:center"><strong>验证码:</strong></label>
                    <input type="text"  name="inputcode"/>
                     <img alt="" src="ValidateCodeServlet" id="validateid" onclick="changevalidate()">
                    </div> 
                    
                    
                    <div class="form_row">
                    
                    
                    </div>                  

                    <div class="form_row">
                        <div class="terms">
                        <input type="checkbox" name="terms" value="1"/>
                        记住我
                        </div>
                    </div> 

                    
                    <div class="form_row">
                    <input type="submit" class="register" value="登录" />
                    </div>   
                    
                  </form>     
                    
                </div>  
            
            </div>	
            
              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        
                	<div class="languages_box"></div>
                <div class="currency"></div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="images/cart.gif" alt="" title="" /></span>购物车</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="showcar.jsp" class="view_cart">v查看购物车</a>
              
              </div>
        
             <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>关于我们</div> 
             <div class="about">
             <p>专注于国外计算机类和英语类的图书销售网站。.
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>促销图书</div> 
                    <div class="new_prod_box">
                        <a href="details.html">书名</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">书名</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">书名</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>               
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="images/bullet5.gif" alt="" title="" /></span>图书分类</div> 
                
                <ul class="list">
                <li><a href="#">文学</a></li>
                <li><a href="#">历史</a></li>
                <li><a href="#">儿童</a></li>
                <li><a href="#">计算机</a></li>
                <li><a href="#">军事</a></li>
                <li><a href="#">财经</a></li>
                <li><a href="#">英语</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="images/bullet6.gif" alt="" title="" /></span>合作伙伴</div> 
                
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
         <a href="#">主页</a>
        <a href="#">关于我们</a>
        <a href="#">服务</a>
        <a href="#">联系我们</a>
       
        </div>
        
       
       </div>
    

</div>

</body>
</html>