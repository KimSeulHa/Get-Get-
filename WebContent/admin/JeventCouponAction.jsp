<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="JEvent.Jevent" %>
<%@ page import="JEvent.JeventDAO" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id ="Jevent" class = "JEvent.Jevent" scope = "page">
<jsp:setProperty name ="Jevent" property = "*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

   <%
            
      int Jeventnum=0;
      if (request.getParameter("Jeventnum")!=null){
         Jeventnum = Integer.parseInt(request.getParameter("Jeventnum"));
      }
      
      JeventDAO JeventDAO = new JeventDAO();
      int result = JeventDAO.updateCoupon(Jeventnum);
      if(result == -1){
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류.')");
         script.println("history.back()");   
         script.println("</script>");
      }else{
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('이벤트참여를 승인하였습니다.')");
         script.println("location.href = 'couponManage.jsp'");
         script.println("</script>");
      }   

      
%>
</body>
</html>