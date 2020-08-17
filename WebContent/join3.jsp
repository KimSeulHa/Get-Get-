<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>GetGet-회원가입</title>
	<%@ include file="/headermeta.jsp" %>
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/join.css">
</head>
<body>
	<%@ include file="/header.jsp" %>

	<main>
	<br><br><br><br>
        <div class="contents">
            <h2 class="h2">회원가입</h2>
            <p>할인도 편리하게, GetGet!을 찾아주셔서 감사합니다.<br>회원이 되시면 GetGet!만의 혜택과 서비스를 누릴 수 있습니다.</p>
            <ol class="step">
          
            <li >STEP1<div>약관동의</div></li>
            <li >STEP2<div>회원정보입력</div></li>
            <li class="on">STEP3<div>가입완료</div></li>
            </ol>
            
         <br><br><br>  
	<form method = "post" action="JoinAction.jsp" >
		<fieldset>

			<h2 class="h2">회원가입완료</h2>
			<a href="home.jsp" class="btn_type1">로그인</a>
			<br>
			
			
		
		</fieldset> 
    </form>
</body>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

















