<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="faq.Faq" %> 
<%@ page import="faq.FaqDAO" %>   
    
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet faq 글보기</title>
	<%@ include file="./headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<%
		int faqnum=0;
		if(request.getParameter("faqnum") != null){
			faqnum = Integer.parseInt(request.getParameter("faqnum"));
		}
		if(faqnum == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("유효하지 않은 글입니다.");
			script.println("location.href='faq.jsp'");
			script.println("</script>");
		}
		Faq faq = new FaqDAO().getFaq(faqnum);
	%>
	<main>
	<br><br><br>
	
			<div class="AreaFlex">
				<section class="info_box">
					<h2><span>고객센터</span> 글보기</h2>
		
				</section>
				
					<div class="container">
						<div class="row">
								<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
									<thead>
									<tr>
										<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
									</tr>
	
									</thead>
			
									<tbody>
										<tr>
											<td style="width : 20%;">글 제목 </td>
											<td colspan="2"><%=faq.getFaqTitle() %></td>
										</tr>
										<tr>
											<td>작성자</td>
											<td colspan="2"><%=faq.getId() %></td>
										</tr>
										<tr>
											<td>작성일자</td>
											<td colspan="2"><%=faq.getDate() %></td>
										</tr>	
										<tr>
											<td>내용</td>
											<td colspan="2" style="min-height:200px; text-align:left;"><%=faq.getFaqContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;") %></td>
										</tr>
										<tr>
											<td>사진</td>
											<td colspan="2" style="min-height:200px; text-align:left;"><img src="/getget/upload/<%=faq.getFaqimg() %>"></td>
										</tr>
									</tbody>
								</table>
								<a href="faq.jsp" class="btn btn-primary">목록</a>
								<%
									if(Id != null && Id.equals(faq.getId())){
								%>
									<a href="faqUpdate.jsp?faqnum=<%= faqnum %>" class="btn btn-primary">수정</a>
									<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="faqDeleteAction.jsp?faqnum=<%= faqnum %>" class="btn btn-primary">삭제</a>
								<%
									}
								%>
								<!-- <input type="submit" class="btn btn-primary pull-right" value="글쓰기"> -->
							</form>
						</div>
					</div>
					
			</div>

	<br>
		
	</main>
	
	<jsp:include page="/footer.jsp"></jsp:include>
	
</body>
</html>
