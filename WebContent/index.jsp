<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet!</title>
	<%@ include file="./headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>
	
	
	<script>
		location.href='main.jsp';
	</script>
	
	<main>
	<br><br><br><br>
	<article>
		<a href="#a">
					<em><img src="images/big.png" alt=""></em>
    </article>
	<form class="search" action="#">
    	<input type="text" placeholder="이벤트를 검색하세요." required>
    	<button type="submit">Search</button>
    </form>
    
    <jsp:include page="mainEvent.jsp"></jsp:include>
    
    <jsp:include page="notice.jsp"></jsp:include>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>
