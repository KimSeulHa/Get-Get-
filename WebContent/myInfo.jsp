<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="userDAO" class="user.UserDAO"/>    

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
   <title>GetGet! myInfo</title>
   <%@ include file="/headermeta.jsp" %>
</head>
<body>
   <%@ include file="/header.jsp" %>
   
   <main>
   <br><br><br><br>
   
    <%

      User user = new UserDAO().getUser(Id);
      
          if(session.getAttribute("Id")!=null){
             Id=(String)session.getAttribute("Id");
         }
          
      
    %>
       
   
      <%
         if(Id==null){
      %>
      
      <h2>로그인해주세요.</h2>

   
      <%
         }else{
      %>
      <section class="mypage_box">
         <h2><span>마이페이지</span></h2>
         <div class="AreaFlex">
               <form action="myInfoUpdateAction.jsp" method="POST" name="my_ifno_form" id="my_ifno_form">
                  <h2>회원정보 관리</h2>
                  <div class="MyinfoBasicTable">
                     <table style="width: 100%">
                        <colgroup>
                           <col style="width: 16%">
                           <col style="width: 27%">
                           <col style="width: 17%">
                           <col style="width: 40%">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th>
                                 <span class="bnk">아이디</span>
                              </th>
                              <td>
                                 <span class="name">
                                    <input type = "Text" id="my_info_id" name="id" readonly value= "<%=user.getId() %>" ></span>
                                 </span>
                              </td>
                              <th>
                                 <span class="bnk">성명</span>
                              </th>
                              <td>
                                 <span class="name">
                                    <input type = "Text" id="my_info_name" name = "name" readonly value = "<%=user.getName() %>" ></span>
                                 </span>
                              </td>
                           </tr>
                           <tr>
                              <th>
                                 <span class="dot">비밀번호 변경</span>
                              </th>
                              <td colspan="3">
                                 <input type="password" name="passwd" id="my_info_pw" maxlength="12" value ="<%=user.getPasswd()%>">
                              </td>
                           </tr>
                           
                           <tr>
                              <th>
                                 <span class="dot">전화번호</span>
                              </th>
                              <td colspan="3">   
                                 <input type="text" name="phoneNumber" id="my_info_phone1" value = "<%=user.getPhoneNumber()%>"/>                           
                              </td>
                           </tr>
                        
                        </tbody>
                     </table>
                  </div>
                  <div class="MyinfoInput">
                     <input type="submit" value="회원 정보 수정" name="info_chg_submit" id="info_chg_submit">
                     <input type="button" value="정보 수정 취소" onclick="history.back()">
                     <input type="button" value="회원 탈퇴" name="withdrawal_btn" id="withdrawal_btn">
                  </div>
               </form>
            </div>
      </section>
         <% 
            }
         %>      
         
    

      
   </main>
   <footer>
      <div class="clear">
         <a href="#header">TOP</a>
         <div class="left">
            <div>
               <a href="#a">개인정보처리방침</a>
               <a href="#a">이용약관</a>
               <a href="#a">이메일무단수집거부</a>
               <a href="#a">사이트맵</a>
            </div>
            <p>
               GetGet<span></span>사업자번호 : 111-1111-11111<span></span>대표자 : 김슬하,정수아,박진선<br>
               경기도 용인시 처인구 김장량동 839-34<span></span>02-3484-2114<span></span>Copyright © 2019 getget Corporation., All rights reserved.
            </p>
         </div>
         
      </div>
   </footer>
</body>
</html>
















