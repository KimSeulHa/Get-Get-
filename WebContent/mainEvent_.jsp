<!-- 페이지 꾸밀때 쓰던 예전것:::::사용안하는 페이지 -->
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
	
		<section class="info_box">
			<h2>추천 <span>EVENT</span></h2>
			<ul class="clear">
			<li>
				<a href="#a">
					<em><img src="images/pocari.png" alt=""></em>
					<div>
						<h3>포카리스웨트</h3>
						<p>#포카리그램으로 나를 표현해줘!</p>
						<span class="ico no2">진행중</span>
						<div>관심등록</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="images/vita500.jpg" alt=""></em>
					<div>
						<h3>비타500</h3>
						<p>지친 친구를 나에게 소개시켜주면 행복 충전!</p>
						<span class="ico no2">진행중</span>
						<div>관심등록</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="images/event33.png" alt=""></em>
					<div>
						<h3>Olive Young</h3>
						<p>Color Your! LUCKY SUMMER</p>
						<span class="ico no2">진행중</span>
						<div>관심등록</div>
					</div>
				</a>
			</li>
			<li>
				<a href="#a">
					<em><img src="images/event4.png" alt=""></em>
					<div>
						<h3>배스킨라빈스</h3>
						<p>이달의 맛 배라타임 '블랙 소르베'</p>
						<span class="ico no1">진행예정</span>
						<div>관심등록</div>
					</div>
				</a>
			</li>
			</ul>
			<div class="btns center">
				<a href="#a" class="btn_more">&nbsp;더보기</a>
			</div>
		</section>
	
</body>
</html>