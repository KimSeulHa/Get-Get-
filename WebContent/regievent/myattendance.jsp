<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="reginew.ReginewDAO" %>
<%@ page import="reginew.Reginew" %>
<%@ page import="JEvent.JeventDAO" %>
<%@ page import="JEvent.Jevent" %>
   
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
   <%@ include file="../headermeta.jsp" %>
</head>
<body> 
 
  
     <!-- 이벤트참여 목록입니다. -->
		   <% 
		      int pageNumber=1;
		      if (request.getParameter("pageNumber")!=null){
		         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		      }
		   %>
			 
              	<div class="container">
                  <div class="row">
                     <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                        <thead>
	                        <tr>
	                           <th style="background-color:#eeeeee; text-align:center;">번호</th>
	                           <th style="background-color:#eeeeee; text-align:center;">작성자</th>
	                           <th style="background-color:#eeeeee; text-align:center;">이벤트 이름</th>
	                           <th style="background-color:#eeeeee; text-align:center;">브랜드 이름</th>
	                           <th style="background-color:#eeeeee; text-align:center;">이벤트 사진</th>
	                        </tr>
                   		</thead>
                     	<tbody>
	                        <%
	                           JeventDAO jeventDAO = new JeventDAO();
	                           ArrayList<Jevent> list = jeventDAO.getList(pageNumber);
	                           for(int i = 0; i<list.size();i++){
	                        	   
	                        	 //아이디값을 비교하기
									if(session.getAttribute("Id").equals(list.get(i).getId())){
	                        		
	                        %>   
                           <tr>
                              <td><%= list.get(i).getJeventnum() %></td>
                              <td><%= list.get(i).getId() %></td>
                              <td><%= list.get(i).getEventName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></td>
                              <td><%= list.get(i).getBrandName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></td>
                              <td> <img src="/getget/upload/<%= list.get(i).getJeventimg() %>" style="width : 20%;"> </td>
                           </tr>
                           
	                        <%
									}
								}
	                        %>
                   		 </tbody>
                 	 </table>
			                  <%
			                     if(pageNumber != 1){
			                  %>
			                     <a href="faq.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
			                  <%
			                     } if(jeventDAO.nextPage(pageNumber+1)){                     
			                  %>
			                     <a href="faq.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
			                  <%
			                     }
			                  %>
				 </div>
				</div>
   
   
</body>
</html>
