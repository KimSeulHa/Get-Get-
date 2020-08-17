<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<header id="header" class="index">
		<%		
			String Id=null;
			if(session.getAttribute("Id") != null){
				Id=(String)session.getAttribute("Id");
			}
		%>
		<h1><a href="admin.jsp"><img src="/getget/images/logo.png" alt="GetGet"></a></h1>
		<!--<h2 class="hide">대메뉴</h2>-->
		<div id="lnb">
			<nav>
				<ul>
				<li><a href="/getget/admin/eventManage.jsp">이벤트관리</a></li>
				<li><a href="/getget/admin/memberManage.jsp">회원관리</a></li><!-- 
				<li><a href="/getget/admin/participationManage.jsp">참여관리</a></li> -->
				<li><a href="/getget/admin/couponManage.jsp">쿠폰관리</a></li>
				</ul>
			</nav>	
		</div>

		<%
			if(Id==null){
		%>
						<ul>
						<li><a href="/getget/myInfo.jsp">my page</a></li>
						<li><a href="/getget/faq.jsp">FAQ</a></li>
						<li><a href="/getget/login.jsp">login</a></li>
						</ul>	<div class="visual"></div>
		<%
			}else{
		%>
						
						<ul>
						<%=Id %>님
						<li><a href="/getget/myInfo.jsp">my page</a></li>
						<li><a href="/getget/faq.jsp">FAQ</a></li>
						<li><a href="/getget/logoutAction.jsp">logout</a></li>
						</ul>	<div class="visual"></div>
						
			<% 
				}
			%>			
		
		<!--반응형 메뉴바-->
		<div class="left">
				<a href="#a" class="all">all Menu</a>
				<div class="nav">
					<h4><a href="index.jsp"><img src="./images/logo.png" alt="GetGet"></a></h4>
					<h2>Menu</h2>
					<nav>
						<ul>
						<li><a href="/getget/admin/eventManage.jsp">이벤트관리</a></li>
						<li><a href="/getget/admin/memberManage.jsp">회원관리</a></li>
						<li><a href="/getget/admin/participationManage.jsp">참여관리</a></li>
						<li><a href="/getget/admin/couponManage.jsp">쿠폰관리</a></li>
						</ul>
					</nav>
					<%
			if(Id==null){
		%>
						<ul>
						<li><a href="/getget/myInfo.jsp">my page</a></li>
						<li><a href="/getget/faq.jsp">FAQ</a></li>
						<li><a href="/getget/login.jsp">login</a></li>
						</ul>	<div class="visual"></div>
						<%
			}else{
		%>
						<ul>
						<li><a href="/getget/myInfo.jsp">my page</a></li>
						<li><a href="/getget/faq.jsp">FAQ</a></li>
						<li><a href="/getget/logoutAction.jsp">logout</a></li>
						</ul>	<div class="visual"></div>
						
			<% 
				}
			%>			
					<a href="#a" class="close">Close</a>
				</div>
			</div>