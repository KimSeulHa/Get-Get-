<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*,java.sql.*,java.text.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="util.StringUtils"%>
<%@ page import="user.UserDAO" %>
<%@ page import="faq.FaqDAO" %>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="faq.Faq"%>
<!-- 저장영역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String directory=application.getRealPath("/upload/");
	int maxSize=1024*1024*100;
	String encoding = "UTF-8";

	MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

	String id = StringUtils.nvl((String)session.getAttribute("Id"), "");
	String faqimg = StringUtils.nvl(multi.getOriginalFileName("faqimg"), "");
	String realFileName = StringUtils.nvl(multi.getFilesystemName("faqimg"), "");
	String faqTitle = StringUtils.nvl(multi.getParameter("faqTitle"), "");
	String faqContent = StringUtils.nvl(multi.getParameter("faqContent"), "");
	
	Faq faq = new Faq();
	faq.setId(id);
	faq.setFaqTitle(faqTitle);
	faq.setFaqContent(faqContent);
	faq.getFaqimg();

	if(id.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");	//이전페이지로 돌아간다 즉 로그인 페이지
		script.println("</script>");
	} else{
		if(faq.getFaqTitle() == null || faq.getFaqContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 항목을 입력해주세요.')");
			script.println("history.back()");	
			//script.println("location.href = 'faq.jsp'");
			script.println("</script>");
		}else{	
			FaqDAO faqDAO = new FaqDAO();
			// getFaqimg
			int result = faqDAO.write(faq.getFaqTitle(), faq.getId(), faq.getFaqContent(), faq.getFaqimg());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패, 오류!!')");
				script.println("history.back()");	
				script.println("</script>");
			}else{
			//session.setAttribute("Id",user.getId());
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