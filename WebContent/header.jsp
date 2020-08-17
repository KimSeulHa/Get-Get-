<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<header id="header" class="index">
<body>
<%
		String Id=null;
		if(session.getAttribute("Id") != null){
			Id=(String)session.getAttribute("Id");
		}
	%>
	
		<h1><a href="/getget/index.jsp"><img src="/getget/images/logo.png" alt="GetGet"></a></h1>
		<!--<h2 class="hide">대메뉴</h2>-->
		<div id="lnb">
			<nav>
				<ul>
				<li><a href="/getget/index.jsp">홈</a></li>
				<li><a href="/getget/regievent/reginew.jsp">등록</a></li>
				<li><a href="/getget/regievent/popularevent.jsp">전체</a></li>
				<li><a href="/getget/user/myevent.jsp">내 이벤트</a></li>
				<li><a href="/getget/user/mycoupon.jsp">쿠폰함</a></li>
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
					<h4><a href="/getget/index.jsp"><img src="/getget/images/logo.png" alt="GetGet"></a></h4>
					<h2>Menu</h2>
					<nav>
						<ul>
						<li><a href="/getget/index.jsp">홈</a></li>
						<li><a href="/getget/regievent/reginew.jsp">등록</a></li>
						<li><a href="/getget/regievent/popularevent.jsp">전체</a></li>
						<li><a href="/getget/user/myevent.jsp">내 이벤트</a></li>
						<li><a href="/getget/user/mycoupon.jsp">쿠폰함</a></li>
						</ul>
					</nav>
					<%
						if(Id==null){
					%>
					<div>
						<a href="/getget/login.jsp">login</a>
						<a href="#a">FAQ</a>
					</div>
					<%
						}else{
					%>
					<div>
						<a href="/getget/myInfo.jsp">mypage</a>
						<a href="#a">FAQ</a>
					</div>
					<% 
						}
					%>			
				
					<a href="#a" class="close">Close</a>
				</div>
			</div>
			
</body>
</html>