<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JEvent.JeventDAO" %>
<%@ page import="JEvent.Jevent" %>
<%@ page import="java.util.*"%>   
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="JeventDAO" class="JEvent.JeventDAO"/>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
   <title>GetGet! admin 쿠폰 지급</title>
   <%@ include file="../headermeta.jsp" %>
</head>
<body>
   <%@ include file="./header.jsp" %>
   <main>
   <br><br><br><br>
<article>

		<a href="#a">
					<em><img src="../images/big.png" alt=""></em>
    </article>

	
	<jsp:include page="../mainEvent.jsp"></jsp:include>
    
    <jsp:include page="../notice.jsp"></jsp:include>
    
    <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>

















