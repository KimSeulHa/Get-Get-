<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JEvent.JeventDAO" %>
<%@ page import="JEvent.Jevent" %>
<%@ page import="java.util.*"%>   
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="JeventDAO" class="JEvent.JeventDAO"/>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
   <title>GetGet! admin 쿠폰 관리</title>
   <%@ include file="../headermeta.jsp" %>
</head>
<body>
   <%@ include file="./header.jsp" %>
   <main>
   <br><br><br><br>
   <% 
      int pageNumber=1;
      if (request.getParameter("pageNumber")!=null){
         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
      }
   %>
         <div class="AreaFlex">
           <section class="info_box">
               <h2><span>이벤트 </span>참여 현황</h2>
           </section>
             
               <div class="container">
                  <div class="row">
                     <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                        <thead>
                        <tr>
                           <th style="background-color:#eeeeee; text-align:center;">번호</th>
                           <th style="background-color:#eeeeee; text-align:center;">작성자</th>
                           <th style="background-color:#eeeeee; text-align:center;">이벤트 제목</th>
                           <th style="background-color:#eeeeee; text-align:center;">이벤트 사진</th>
                           <th style="background-color:#eeeeee; text-align:center;">지급 승인</th>
                           <th style="background-color:#eeeeee; text-align:center;">쿠폰 지급</th>
                        </tr>
                     </thead>
      
                     <tbody>
                        <%
                           JeventDAO jeventDAO = new JeventDAO();
                           ArrayList<Jevent> list = jeventDAO.getList(pageNumber);
                           for(int i = 0; i<list.size();i++){
                        %>   
                           <tr>
                            <form action="JeventCouponAction.jsp" enctype="multipart/form-data">    
                              <td style="width : 50px;"><input type = "text" name = "Jeventnum" value = "<%= list.get(i).getJeventnum() %>" readonly ></td>
                              <td><input type = "text" name = "id" value = "<%= list.get(i).getId() %>" readonly></td>
                              <td><input type = "text" name = "eventName" value = "<%= list.get(i).getEventName() %>" readonly></td>
                              <td style="width : 200px;"><img src="/getget/upload/<%= list.get(i).getJeventimg() %>" style="width : 50%;" ></td>
                              
                              <td><input type = "submit" value="지급 승인"></td>
                           
                           </form>
                           
                                              
                        
                          <form method="post" action="/getget/CouponAction" enctype="multipart/form-data">
                          	  <td>
                          	 		<label for="couponImg"></label>
									<input type="file" id="couponImg" name="couponImg" style="width : 200px;" />
									<input type = "submit" value="쿠폰지급">
							  </td>
                          	  </form> 
                            </tr>
                        <%
                           }
                        %>
                     </tbody>
                  </table>
                  <%
                     if(pageNumber != 1){
                  %>
                     <a href="couponManage.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
                  <%
                     } if(jeventDAO.nextPage(pageNumber+1)){                     
                  %>
                     <a href="couponManage.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
                  <%
                     }
                  %>
               </div>
               </div>
            </div>
       <!-- </form> --> 
               
   <jsp:include page="../footer.jsp"></jsp:include>
   
</body>
</html>