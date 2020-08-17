<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope ="page" >   
<jsp:setProperty name ="user" property = "*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

   <%
      String Id = (String)session.getAttribute("Id");
      user.setId(Id);

      UserDAO userDAO = new UserDAO(); //memberDAO라는 객체만듬
      int result = userDAO.updateUser(user);
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류.')");
         script.println("history.back()");   
         script.println("</script>");
      }else{
         session.setAttribute("Id", user.getId());
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href = 'index.jsp'");
         script.println("</script>");
      }   

      
   %>
</body>
</html>