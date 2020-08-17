<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="user.UserDAO" %> --%>
<%@ page import="reginew.ReginewDAO" %>
<%@ page import="reginew.Reginew" %>
<%@ page import="java.io.PrintWriter" %> 
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>

 <% request.setCharacterEncoding("UTF-8");%>
	<jsp:useBean id="reginew" class="reginew.Reginew" scope ="page" />	
	<jsp:setProperty name ="reginew" property = "eventName" />
	<jsp:setProperty name ="reginew" property = "content" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String Id = null;
		if(session.getAttribute("Id")!=null){
			Id=(String)session.getAttribute("Id");
		}
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
		Reginew reginew1 = new ReginewDAO().getReginew(eventList);
		if(!Id.equals(reginew1.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='regievent.jsp'");
			script.println("</script>");
		}else{
			if(request.getParameter("number")== null || request.getParameter("eventName") == null || request.getParameter("brandName") == null || request.getParameter("coupon") == null || request.getParameter("content") == null
					|| request.getParameter("number").equals("") || request.getParameter("eventName").equals("") || request.getParameter("brandName").equals("") || request.getParameter("coupon").equals("") || request.getParameter("content").equals("") ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력해주세요.')");
				script.println("history.back()");	
				//script.println("location.href = 'regievent.jsp'");
				script.println("</script>");
		}else{
				ReginewDAO reginewDAO = new ReginewDAO();
				int result = reginewDAO.update(eventList, request.getParameter("number"), request.getParameter("eventName"), request.getParameter("coupon"), request.getParameter("content"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정 실패, 오류!!')");
					script.println("history.back()");	
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'regievent.jsp'");
					script.println("</script>");
				}
				
					}
		}
		
	
		
	%>

</body>
</html>