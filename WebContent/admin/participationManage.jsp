<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<br><br><br><br>
		
				<section class="info_box">
					<h2><span>참여</span> 관리</h2>
					<ul class="clear">
					<li>
						
				</section>
				
				<div class="listWrapper">
						<table>
							<thead>
								<tr>
									<td></td>
									<td>구분</td>
									<td>아이디</td>
									<td>가입날짜</td>
									<td>참여이벤트수</td>
									<td>쿠폰수</td>
								</tr>
							</thead>
							<tbody>
							<%-- 	<%
								for(){
									
									%> --%>
									<tr>
										<!-- <td class="td1" rowspan="2"><img src="images/logo.png" style="width:100px"></td> -->
										<td class="td2">회원</td>
										<td class="td3" rowspan="2">getget</td>
										<td class-"td3" rowspan="2">2019-02-25</td>
										<td class="td3" rowspan="2">2</td>
										<td class="td6" rowspan="2">0</td>
									</tr>
							</tbody>
						</table>
					</div>
					<div class="listTotal">
						<input type="button" value="수정하기" a href="#a">
						<input type="button" value="삭제하기" a href="#a">
					</div>
	<br>
		
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

















