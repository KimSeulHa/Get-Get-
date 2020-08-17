<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet faq 글쓰기</title>
	<%@ include file="./headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>공지사항 및 FAQ</span> 글쓰기</h2>
		
				</section>
				
					<div class="container">
						<div class="row">
							<form method="post" action="faqWriteAction.jsp">
								<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
									<thead>
									<tr>
										<th colspan="2" style="background-color:#eeeeee; text-align:center;"> 글쓰기</th>
									</tr>
									</thead>
			
									<tbody>
								<%-- 	<%
									for(){
										
										%> --%>
										<tr>
											<th class="writeTitle" style="border:1px solid #eeeeee;">글제목</th>
											<td style="border:1px solid #eeeeee;"><!-- 글제목 :  --><input type="text" class="form-control" placeholder="글제목" name="faqTitle" maxlength="50"></td>
										</tr>
										<tr>	
											<td colspan="2"><textarea class="form-control" placeholder="글내용" name="faqContent" maxlength="2048"></textarea></td>
										</tr>
									</tbody>
								</table>
								<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
							</form>
						</div>
					</div>
					
			</div>

	<br>
		
	</main>
	<footer>
		<div class="clear">
			<a href="#header">TOP</a>
			<div class="left">
				<div>
					<a href="#a">개인정보처리방침</a>
					<a href="#a">이용약관</a>
					<a href="#a">이메일무단수집거부</a>
					<a href="#a">사이트맵</a>
				</div>
				<p>
					GetGet<span></span>사업자번호 : 111-1111-11111<span></span>대표자 : 김슬하,정수아,박진선<br>
					경기도 용인시 처인구 김장량동 839-34<span></span>02-3484-2114<span></span>Copyright © 2019 getget Corporation., All rights reserved.
				</p>
			</div>
			
		</div>
	</footer>
</body>
</html>

















