<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>GetGet-로그인</title>
	<%@ include file="/headermeta.jsp" %>

	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/join.css">
</head>
<body>
	<%@ include file="/header.jsp" %>
	
	<main>
	<br><br><br><br>
        <div class="contents">
            <h2 class="h2">로그인</h2>
            <p>할인도 편리하게, GetGet!을 찾아주셔서 감사합니다.<br>회원이 되시면 GetGet!만의 혜택과 서비스를 누릴 수 있습니다.</p>
      
          	<fieldset>

			<!--  <tr>
				<td><input type="radio" name="사용자구분"> 개인 회원    
				<input type="radio" name="사용자구분"> 사업자
				</td>
			</tr>-->
		<form class = "login" method = "post" action="LoginAction.jsp">
		<input type ="text" placeholder="ID" name="id">
		<input type ="password" placeholder="PASSWORD" name="passwd">
		<input type = "submit" value="로그인">
		</form>
			
		</fieldset> 
		  </div>  
	
			<table align="center" height="70">
			  <tr>
			   <td><a href="join1.jsp">회원가입 | </td>  
			   <td><a href="">아이디 찾기 | </td>
			   <td><a href="">비밀번호 찾기</td>
			  </tr>
			</table>
			
		<!-- 사진첨부관련
        <div class="fieldlabel"><label for="profile">프로필사진</label></div>
        <div class="formfield">
            <input type="file" id="profile" name="profile" required>
        </div>-->
		
	
        <!--<div class="btnfield">
            <input type="submit" value="회원가입">
        </div> -->
		
		</fieldset> 
    </form>
</body>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

















