<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="faq.Faq" %> 
<%@ page import="faq.FaqDAO" %>
<%@ page import="java.io.PrintWriter" %>
    
    
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet faq 글 수정하기</title>
	<%@ include file="./headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<% 
		if(Id == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
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
		Faq faq = new FaqDAO().getFaq(faqnum);
		if(!Id.equals(faq.getId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='faq.jsp'");
			script.println("</script>");
		}
	 %>
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>고객센터</span> 글쓰기</h2>
		
				</section>
				
					<div class="container">
						<div class="row">
							<form method="post" action="faqUpdateAction.jsp?faqnum=<%= faqnum %>">
								<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
									<thead>
									<tr>
										<th colspan="2" style="background-color:#eeeeee; text-align:center;"> 글 수정양식</th>
									</tr>
									</thead>
			
									<tbody>
								<%-- 	<%
									for(){
										
										%> --%>
										<tr>
											<td>글제목 : <input type="text" class="form-control" plaeholder="글제목" name="faqTitle" maxlength="50" value="<%= faq.getFaqTitle()%>"></td>
										</tr>
										<tr>	
											<td><textarea class="form-control" plaeholder="글내용" name="faqContent" maxlength="2048"><%= faq.getFaqContent()%></textarea></td>
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
	
	<jsp:include page="/footer.jsp"></jsp:include>
	
</body>
</html>

















