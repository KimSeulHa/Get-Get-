<!-- 안쓰는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reginew.Reginew" %>
<%@ page import="reginew.ReginewDAO" %>
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet 이벤트 글보기</title>
	<%@ include file="../headermeta.jsp" %>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%
		int eventList=0;
		if(request.getParameter("eventList") != null){
			eventList = Integer.parseInt(request.getParameter("eventList"));
		}
		if(eventList == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("유효하지 않은 글입니다.");
			script.println("location.href='regievent.jsp'");
			script.println("</script>");
		}
		Reginew reginew = new ReginewDAO().getReginew(eventList);
	%>
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>이벤트</span> 글보기</h2>
		
				</section>
				
				
			
			<div class="row">
				<div class="product_view">
					<img src="/getget/upload/<%=reginew.getReginewImg() %>">
					<br><br>
				<h2><%=reginew.getEventName() %></h2>
				<li><%=reginew.getBrandName() %></li>
		
					<div class="btns">
						<a href="/getget/user/event_join.jsp" class="btn2">참여하기</a>
					</div>
					<div id="detail_menu">
						<nav>
							<ul>
								<li><a href="detail_explain.jsp">상세설명</a></li>
								<li><a href="#header">이벤트안내</a></li>
							</ul>
						</nav>	
					</div>
		
				</div>
								
							<a href="regievent.jsp" class="btn btn-primary">목록</a>
								<%
									//if(Id != null && Id.equals(reginew.getId())){
								%>
									<a href="regieventUpdate.jsp?eventList=<%= eventList %>" class="btn btn-primary">수정</a>
									<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="regieventDeleteAction.jsp?eventList=<%= eventList %>" class="btn btn-primary">삭제</a>
								<%
									//}
								%>
								 <!-- <input type="submit" class="btn btn-primary pull-right" value="글쓰기"> -->
							</form>
						</div>
				
					
			</div>

	<br>
		
	</main>
	
	<jsp:include page="/footer.jsp"></jsp:include>
	
</body>
</html>

















