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
   				<img src="/getget/upload/<%=reginew.getReginewImg() %>" style="width : 100%;">
            	<br><br>
            	<h2><%=reginew.getEventName() %></h2>
            	<li><%=reginew.getBrandName() %></li>
     
     
    	  	<div id="detail_menu">
	              <nav>
		              <ul>
		                  <li><a href="#nav">상세설명</a></li>
		                  <li><a href="#header">이벤트안내</a></li>
		              </ul>
			          <ul>
			              <li><img src="/getget/upload/<%=reginew.getReginewImgDetail() %>" style="width : 100%;"></li>
			          </ul>
	              </nav>   
            </div>
     		      <a href="popularevent.jsp" class="btn btn-primary">목록</a>	
	     			  <%
	                  	if(Id != null && Id.equals(reginew.getId())){
	                  %>
                        <a href="regieventUpdate.jsp?eventList=<%= eventList %>" class="btn btn-primary">수정</a>
                        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="regieventDeleteAction.jsp?eventList=<%= eventList %>" class="btn btn-primary">삭제</a>
                      <%
                        }
                      %>
    		 
			      <!-- 이벤트 등록 관련! -->
			      <div class="container">
			            <div class="row">
			               <form method="post" action="/getget/JeventAction" enctype="multipart/form-data">
			                  <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			                        <thead>
				                        <tr>
											<th colspan="2" style="background-color:#eeeeee; text-align:center;">이벤트 참여 글쓰기</th>
										</tr>
			                        </thead>
			                        <tbody>
			                           <tr>
			                              <td>아이디 : <input type="text" class="form-control" value="<%=Id %>" name="id" maxlength="50"></td>
			                           </tr>
			                           <tr>
			                              <td>이벤트 제목 : <input type="text" class="form-control" value="<%=reginew.getEventName() %>" name="eventName" maxlength="50"></td>
			                           </tr>
			                           <tr>
			                              <td>브랜드이름 : <input type="text" class="form-control" value="<%=reginew.getBrandName() %>" name="brandName" maxlength="50"></td>
			                           </tr>
			                           <tr>
			                              <td>이미지 : 
			                              	<div class="container">
			                              		<label for="reginewImg"></label>
					                        	<input type="file" id="reginewImg" name="Jeventimg" />
					                        	<div class="select_img"><img src="" /></div>
					                        	<script>
						                          $("#reginewImg").change(function(){
						                           if(this.files && this.files[0]) {
						                            var reader = new FileReader;
						                            reader.onload = function(data) {
						                             $(".select_img img").attr("src", data.target.result).width(500);        
						                            }
						                            reader.readAsDataURL(this.files[0]);
						                           }
						                          });
					                     		 </script>
			                 					 <%=request.getRealPath("/") %>
			                      			 </div>
					                      </td>
			                            </tr>
			                       	</tbody>
			                   </table>
			                        <input type="submit" class="btn2" value="글쓰기">
			                </form>
			           </div>
			      </div>
			</div>
         </div>
        
         
     <!-- 이벤트참여 목록입니다. -->
		   <% 
		      int pageNumber=1;
		      if (request.getParameter("pageNumber")!=null){
		         pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		      }
		   %>
			 <section class="info_box">
		     	<h2><span>이벤트</span> 참여목록</h2>
		     </section>
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
	                        	 //이벤트 제목 값을 비교하기
									 if(reginew.getEventName().equals(list.get(i).getEventName())){
									
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
	</div>
   </main>
   
   <jsp:include page="/footer.jsp"></jsp:include>
   
</body>
</html>
