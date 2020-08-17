<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reginew.ReginewDAO" %>
<%@ page import="reginew.Reginew" %>
<%@ page import="java.io.PrintWriter" %>
    
    
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet 글 수정하기</title>
	<%@ include file="../headermeta.jsp" %>
</head>
<body>
   <%@ include file="../header.jsp" %>
	<% 
		if(Id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");	//이전페이지로 돌아간다 즉 로그인 페이지
			script.println("</script>");
		} 
		int eventList=0;
		if(request.getParameter("eventList") != null){
			eventList=Integer.parseInt(request.getParameter("eventList"));
		}
		if(eventList == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("유효하지 않은 글입니다.");
			script.println("location.href='regievent.jsp'");
			script.println("</script>");
		}
		Reginew reginew = new ReginewDAO().getReginew(eventList);
		if(!Id.equals(reginew.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='regievent.jsp'");
			script.println("</script>");
		}
	 %>
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>글</span> 수정하기</h2>
		
				</section>
				
					<div class="container">
						<div class="row">
							<form method="post" action="regieventUpdateAction.jsp?eventList=<%= eventList %>">
								<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
									<thead>
									<tr>
										<th colspan="2" style="background-color:#eeeeee; text-align:center;"> 글 수정양식</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>이벤트제목  <input type="text" class="form-control" placeholder="" name="eventName" maxlength="50" value="<%=reginew.getEventName() %>"></td>
										</tr>
										<tr>
											<td>브랜드이름  <input type="text" class="form-control" placeholder="" name="brandName" maxlength="50" value="<%= reginew.getBrandName() %>"></td>
										</tr>
										<tr>	
											<td>할인정도  <textarea class="form-control" placeholder="" name="coupon" maxlength="50"><%= reginew.getCoupon() %></textarea></td>
										</tr>
										<tr>	
											<td>이벤트 내용  <textarea class="form-control" placeholder="" name="content" maxlength="2048"><%= reginew.getContent() %></textarea></td>
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
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>
