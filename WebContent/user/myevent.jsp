<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet 내 이벤트</title>
	<%@ include file="../headermeta.jsp" %>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<br><br><br>
	<main>
			<section class="info_box">
			<h2>내가 <span>등록한</span> 이벤트</h2>
				<jsp:include page="events.jsp"></jsp:include>
			
			<br>
			
			<h2>내가 <span>참여한</span> 이벤트</h2>
				<jsp:include page="../regievent/myattendance.jsp"></jsp:include>
			
		</section>
	<br>

	<jsp:include page="../notice.jsp"></jsp:include>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

















