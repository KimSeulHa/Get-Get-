<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reginew.ReginewDAO" %>
<%@ page import="reginew.Reginew" %>
<%@ page import="java.util.ArrayList" %>    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet reginew</title>
	<%@ include file="../headermeta.jsp" %>
	
</head>
<body>
	
	<%@ include file="../header.jsp" %>
	<% 
		int pageNumber=1;
		if (request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>등록한 이벤트</span></h2>
					<ul class="clear">
					<li>
						
				</section>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
								<thead>
								<tr>
									<th style="background-color:#eeeeee; text-align:center;">번호</th>
									<th style="background-color:#eeeeee; text-align:center;">이벤트제목</th>
									<th style="background-color:#eeeeee; text-align:center;">브랜드명</th>
									<th style="background-color:#eeeeee; text-align:center;">아이디</th>
									<th style="background-color:#eeeeee; text-align:center;">작성일</th>
									
								<!-- 	<th style="background-color:#eeeeee; text-align:center;">승인가능수량</th> -->
									<th style="background-color:#eeeeee; text-align:center;">할인정도</th>	
								</tr>
							</thead>
							<tbody>
								<%
									ReginewDAO reginewDAO = new ReginewDAO();
									ArrayList<Reginew> list = reginewDAO.getList(pageNumber);
									for(int i = 0; i<list.size();i++){
								%>	
								<tr>
									<td><%= list.get(i).getEventList() %></td>
									<td><a href="detail_explain.jsp?eventList=<%= list.get(i).getEventList() %>"><%= list.get(i).getEventName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></a> </td>
									<td><%= list.get(i).getBrandName() %></td>
									<td><%= list.get(i).getId() %></td>
									<td> <%= list.get(i).getDate() %> </td>
									<td> <%= list.get(i).getCoupon() %> </td>
								</tr>
								<%
									}
								%>
							</tbody>
							</table>
						<%
							if(pageNumber != 1){
						%>
							<a href="regievent.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
						<%
							} if(reginewDAO.nextPage(pageNumber+1)){							
						%>
							<a href="regievent.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
						<%
							}
						%>
					</div>
					</div>
					
					<div class="listTotal">
						<a href="/getget/regievent/reginew.jsp" class="btn btn-primary pull-right">글쓰기</a>
					</div>
			</div>
			
    <jsp:include page="../notice.jsp"></jsp:include>
    
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>

















