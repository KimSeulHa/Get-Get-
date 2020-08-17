<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%-- <%@ page import="java.io.PrintWriter" %>
 --%><%@ page import="java.io.PrintWriter" %> 
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>
 
 <% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope ="page" />
<jsp:setProperty name ="user" property = "id" />
<jsp:setProperty name ="user" property = "passwd" />
<jsp:setProperty name ="user" property = "name" />
<jsp:setProperty name ="user" property = "phoneNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String Id = null;
		if(session.getAttribute("Id")!=null){
			Id=(String)session.getAttribute("Id");
		}
		if(Id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있음.')");
			script.println("location.href = 'main.jsp'");	//이전페이지로 돌아간다 즉 로그인 페이지
			script.println("</script>");
		}
	
		if(user.getId() == null || user.getPasswd() == null || user.getName() == null || user.getPhoneNumber() ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모든 항목을 입력해주세요.')");
		script.println("history.back()");	
		script.println("</script>");
			}else{
		UserDAO userDAO = new UserDAO(); //memberDAO라는 객체만듬
		int result = userDAO.join(user); //로그인폼에 넣은 아이디와 패스워드 값이 login함수의 매개변수로 들어가서 result로 들어감
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");	
			script.println("</script>");
		}else{
			session.setAttribute("Id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		
			}
	%>

</body>
</html>