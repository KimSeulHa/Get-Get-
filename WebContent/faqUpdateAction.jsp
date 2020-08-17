<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="user.UserDAO" %> --%>
<%@ page import="faq.FaqDAO" %>
<%@ page import="faq.Faq" %>
<%@ page import="java.io.PrintWriter" %> 
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.DriverManager"%>

 <% request.setCharacterEncoding("UTF-8");%>
	<jsp:useBean id="faq" class="faq.Faq" scope ="page" />	
	<jsp:setProperty name ="faq" property = "faqTitle" />
	<jsp:setProperty name ="faq" property = "faqContent" />
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
		int faqnum=0;
		if(request.getParameter("faqnum") != null){
			faqnum=Integer.parseInt(request.getParameter("faqnum"));
		}
		if(faqnum == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("유효하지 않은 글입니다.");
			script.println("location.href='faq.jsp'");
			script.println("</script>");
		}
		Faq faq1 = new FaqDAO().getFaq(faqnum);
		if(!Id.equals(faq1.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='faq.jsp'");
			script.println("</script>");
		}else{
			if(request.getParameter("faqTitle")== null || request.getParameter("faqContent") == null || request.getParameter("faqTitle").equals("") || request.getParameter("faqContent").equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력해주세요.')");
				script.println("history.back()");	
				//script.println("location.href = 'faq.jsp'");
				script.println("</script>");
					}else{
				FaqDAO faqDAO = new FaqDAO();
				int result = faqDAO.update(faqnum, request.getParameter("faqTitle"), request.getParameter("faqContent"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정 실패, 오류!!')");
					script.println("history.back()");	
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'faq.jsp'");
					script.println("</script>");
				}
				
					}
		}
		
	
		
	%>

</body>
</html>