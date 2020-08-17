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
            <li class="on">STEP2<div>회원정보입력</div></li>
            <li>STEP3<div>가입완료</div></li>
            </ol>
            
         <br><br><br>  
	<form method = "post" action="JoinAction.jsp" >
		<fieldset>
			<!-- 
			<div class="fieldlabel"><label>회원구분</label></div>
			<div class="formfield">
				<input type="radio" name="member_type" value="개인" alt="개인" checked >개인
				<input type="radio" name="member_type" value="사업자" alt="사업자" >사업자
			</div>
			-->
			
			<br>
			
			<div class="fieldlabel"><label for="userId">아이디</label></div>
			<div class="formfield"><input type ="text" placeholder="ID" name="id"></div>
			
			<div class="fieldlabel"><label for="userPw">패스워드</label></div>
			<div class="formfield">
				<input type ="password" placeholder="PASSWORD" name="passwd">
			</div>
			
			<div class="fieldlabel"><label for="userPwCheck">패스워드확인</label></div>
			<div class="formfield">
				<input type ="password" placeholder="PASSWORD" name="passwd">
			</div>
		
			<div class="fieldlabel"><label for="userName">이름</label></div>
			<div class="formfield"><input type ="text" placeholder="NAME" name="name"></div>
      

			<div class="fieldlabel"><label for="email01">전화번호</label></div>
				<div class="formfield"><input type ="text" placeholder="PHONENUMBER" name="phoneNumber">

				</datalist>
				</div>
        
		<!--  <div class="fieldlabel"><label>이메일수신</label></div>
			<div class="formfield">
				<input type="radio" name="emailYn" value="Y" checked>수신
				<input type="radio" name="emailYn" value="N">미수신
			</div>
        <br>
		<div class="fieldlabel"><label>SMS수신</label></div>
			<div class="formfield">
				<input type="radio" name="smsYn" value="Y"checked>수신
				<input type="radio" name="smsYn" value="N">미수신
			</div>
        <br>
		-->
			
		<!-- 사진첨부관련
        <div class="fieldlabel"><label for="profile">프로필사진</label></div>
        <div class="formfield">
            <input type="file" id="profile" name="profile" required>
        </div>-->
		
		<br>
			  <div class="btn_center">
                <input class = "btn_type1" type = "submit" value="회원가입">
            </div>
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

















