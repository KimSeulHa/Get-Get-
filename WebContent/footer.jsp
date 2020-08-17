<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<body>
	<%
		String Id=null;
		if(session.getAttribute("Id") != null){
			Id=(String)session.getAttribute("Id");
		}
	%>
	
	<footer>
		<div class="clear">
			<a href="#header">TOP</a>
			<div class="left">
				<div>
					<a href="#a">개인정보처리방침</a>
					<a href="#a">이용약관</a>
					<a href="#a">이메일무단수집거부</a>
					<a href="#a">사이트맵</a>
				</div>
				<p>
					GetGet<span></span>사업자번호 : 111-1111-11111<span></span>대표자 : 김슬하,정수아,박진선<br>
					경기도 용인시 처인구 김장량동 839-34<span></span>02-3484-2114<span></span>Copyright © 2019 getget Corporation., All rights reserved.
				</p>
			</div>
			
		</div>
	</footer>
</body>
</html>