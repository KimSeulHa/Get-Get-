<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>   
<%@ page import = "java.util.ArrayList" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>  
 
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="userDAO" class="user.UserDAO"/>	 

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet! admin</title>
	<%@ include file="../headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>


	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>회원  관리</span></h2>
					<ul class="clear">
					<li>
						
				</section>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
								<thead>
								<tr>
									<th style="background-color:#eeeeee; text-align:center;">아이디.</th>
									<th style="background-color:#eeeeee; text-align:center;">패스워드</th>
									<th style="background-color:#eeeeee; text-align:center;">이름</th>
									<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
									<th style="background-color:#eeeeee; text-align:center;">적립금</th>
								</tr>
							</thead>
							<%
								ArrayList<User> list = userDAO.getUserList();
								for(User user : list){
					
							%>
							<tbody>
								<tr>
									<td><%= user.getId() %></td>
									<td><%= user.getPasswd() %></td>
									<td><%= user.getName() %></td>
									<td><%= user.getPhoneNumber() %></td>
									<td><%= user.getMoney() %></td>
								</tr>
							</tbody>
							<%
								}
							%>
							</table>
							<!-- 
							<a href="" class="btn btn-success btn-arraw-left">이전</a>

							<a href="" class="btn btn-success btn-arraw-left">다음</a>
							-->
					</div>
					</div>
					

			</div>
			
 
    
    <jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>

















