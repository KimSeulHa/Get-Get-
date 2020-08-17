<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="faq.FaqDAO" %>
<%@ page import="faq.Faq" %>
<%@ page import="java.util.ArrayList" %>    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet faq</title>
	<%@ include file="./headermeta.jsp" %>
</head>
<body>
	
	<%@ include file="./header.jsp" %>
	<% 
		int pageNumber=1;
		if (request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>고객센터</span></h2>
					<ul class="clear">
					<li>
						
				</section>
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
								<thead>
								<tr>
									<th style="background-color:#eeeeee; text-align:center;">번호</th>
									<th style="background-color:#eeeeee; text-align:center;">제목</th>
									<th style="background-color:#eeeeee; text-align:center;">작성자</th>
									<th style="background-color:#eeeeee; text-align:center;">작성일</th>
								</tr>
							</thead>
		
							<tbody>
								<%
									FaqDAO faqDAO = new FaqDAO();
									ArrayList<Faq> list = faqDAO.getList(pageNumber);
									for(int i = 0; i<list.size();i++){
								%>	
									<tr>
										<td><%= list.get(i).getFaqnum() %></td>
										<td><a href="faqview.jsp?faqnum=<%= list.get(i).getFaqnum() %>"><%= list.get(i).getFaqTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></a></td>
										<td><%= list.get(i).getId() %></td>
										<td> <%= list.get(i).getDate() %> </td>
									<%-- 시간까지 지정해줄떄
									 	<td><%= list.get(i).getDate().substring(0,11) + list.get(i).getDate().substring(11, 13)+"시"+list.get(i).getDate().substring(14, 16)+"분" %></td> 
									--%>
									</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<%
							if(pageNumber != 1){
						%>
							<a href="faq.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
						<%
							} if(faqDAO.nextPage(pageNumber+1)){							
						%>
							<a href="faq.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
						<%
							}
						%>
					</div>
					</div>
					<div class="listTotal">
						<a href="" class="btn btn-primary pull-right">수정하기</a>
						<a href="/getget/faqDeleteAction.jsp.jsp" class="btn btn-primary pull-right">삭제하기</a>
						<a href="/getget/faqWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
					</div>
			</div>
    <jsp:include page="notice.jsp"></jsp:include>
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

















