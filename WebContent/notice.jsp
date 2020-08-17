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
	<br>
		<section class="news">
			<div class="clear">
				<h2>공지사항</h2>
				<ul>
				<li>
					<a href="#a">
						<h3>안녕하세요. <br>GetGet 입니다...</h3>
						<p>안녕하세요 감사해요 잘있어요 다시만나요 힘들었던 하루...</p>
						<span>2019-06-08 17:29</span>
						<em></em><em></em><em></em><em></em>
					</a>	
				</li>
				<li>
					<a href="#a">
						<h3>안녕하세요. <br>GetGet 입니다...</h3>
						<p>안녕하세요 감사해요 잘있어요 다시만나요 힘들었던 하루...</p>
						<span>2019-06-08 17:29</span>
						<em></em><em></em><em></em><em></em>
					</a>	
				</li>
				<li>
					<a href="#a">
						<h3>안녕하세요. <br>GetGet 입니다...</h3>
						<p>안녕하세요 감사해요 잘있어요 다시만나요 힘들었던 하루...</p>
						<span>2019-06-08 17:29</span>
						<em></em><em></em><em></em><em></em>
					</a>	
				</li>
				</ul>
			</div>
		</section>
	
</body>
</html>