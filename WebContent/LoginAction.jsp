<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope ="page" />	
<jsp:setProperty name ="user" property = "id" />
<jsp:setProperty name ="user" property = "passwd" />


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
	/* if(Id == "admin"){
		script.println("location.href = 'admin.jsp'");
	} */
		UserDAO userDAO = new UserDAO(); //memberDAO라는 객체만듬
			int result = userDAO.login(user.getId(),user.getPasswd()); //로그인폼에 넣은 아이디와 패스워드 값이 login함수의 매개변수로 들어가서 result로 들어감
			if(result == 1){
				session.setAttribute("Id", user.getId());
				PrintWriter script = response.getWriter(); //스크립트언어를 사용할 슈 있게 됨
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}else if(result == 2){
				PrintWriter script = response.getWriter();
				session.setAttribute("Id", user.getId()); // 임시로 세션
				script.println("<script>");
				script.println("location.href = './admin/admin.jsp'");	
				script.println("</script>");
			}else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 다릅니다.')");
				script.println("history.back()");	
				script.println("</script>");
			}else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('존재하지 않은 아이디입니다.')");
					script.println("history.back()");	
					script.println("</script>");
			}else if(result == -2){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('데이터베이스 오류입니다.')");
					script.println("history.back()");	
					script.println("</script>");
			}
	%>

</body>
</html>