<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="coupon.CouponDAO" %>
<%@ page import="coupon.Coupon" %>
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
		<%@ include file="../headermeta.jsp" %>
</head>
<body>
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
								<th style="background-color:#eeeeee; text-align:center;">아이디</th>
								<th style="background-color:#eeeeee; text-align:center;">이벤트이름</th>
								<th style="background-color:#eeeeee; text-align:center;">쿠폰</th>
							</tr>
						</thead>
						<tbody>
							<%
								CouponDAO couponDAO = new CouponDAO();
								ArrayList<Coupon> clist = couponDAO.getList(pageNumber);
								for(int i = 0; i<clist.size();i++){
							%>	
							<tr>
								<td><%= clist.get(i).getCouponnum() %></td>
								<td><%= clist.get(i).getId() %></td>
								<td><%= clist.get(i).getEventName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&lt;")%></a> </td>
								<td style="width : 200px;"><img src="/getget/upload/<%= clist.get(i).getCouponImg() %>" style="width : 50%;" ></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
								
						</div>
					</div>
				
	
	
</body>
</html>