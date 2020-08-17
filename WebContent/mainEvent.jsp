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

	<% 
		int pageNumber=1;
		if (request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<br><br><br>
	
			<div class="AreaFlex">
				<div class="clear">
				<section class="info_box">
					<h2>신규<span> 이벤트</span></h2>
				</section>
		
		<section class="info_box">
		<!-- <div class="eventlist" style="displa:flex; margin-left:10px;"> -->
			<ul class="eventlist" style="displa:flex; margin-left:10px;">
			<%
							ReginewDAO reginewDAO = new ReginewDAO();
							ArrayList<Reginew> list = reginewDAO.getList(pageNumber);
							for(int i = 0; i<6;i++){
						%>	
			<li>
				<a href="detail_explain.jsp?eventList=<%= list.get(i).getEventList() %>">
					<em><img src="/getget/upload/<%=list.get(i).getReginewImg() %>" alt=""></em>
					<div>
						<h3><%= list.get(i).getEventName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></h3>
						<p><%= list.get(i).getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></p>
						<span class="ico no2">진행중</span>
						<div></div>
					</div>
				</a>
			</li>
			</ul>
							
								<%
									}
								%>
								
						<%-- <!-- next -->
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
						%> --%>
				</div>
			</div>
		</section>
	

</body>
</html>
