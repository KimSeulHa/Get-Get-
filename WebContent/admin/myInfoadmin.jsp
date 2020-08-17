<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet!</title>
	<%@ include file="../headermeta.jsp" %>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<main>
	<br><br><br><br>

		<section class="mypage_box">
			<h2><span>마이페이지</span></h2>
			<div class="AreaFlex">
					<form action="" method="POST" name="my_ifno_form" id="my_ifno_form">
						<h2>관리자 정보 관리</h2>
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
												<span id="my_info_id">getget</span>
											</span>
										</td>
										<th>
											<span class="bnk">성명</span>
										</th>
										<td>
											<span class="name">
												<span id="my_info_name">홍길동</span>
											</span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="dot">기존 비밀번호</span>
										</th>
										<td colspan="3">
											<input type="password" name="my_info_pw" id="my_info_pw" maxlength="12">
										</td>
									</tr>
									<tr>
										<th>
											<span class="dot">비밀번호 변경</span>
										</th>
										<td colspan="3">
											<div name="pw_change_bf" id="pw_change_bf" style="display: block">
												<a href="#" name="pw_change_btn" id="pw_change_btn">비밀번호 변경</a>
											</div>
											<div name="pw_change_af" id="pw_change_af" style="display: none">
												<p>
													<span class="dot">새로운 비밀번호</span>
													<input type="password" name="my_info_new_pw" id="my_info_new_pw" maxlength="16">
												</p>
												<p>
													<span class="dot">비밀번호 재확인</span>
													<input type="password" name="my_info_new_pw_confirm" id="my_info_new_pw_confirm" maxlength="16">
													<input type="hidden" name="pw_confirm_chk" id="pw_confirm_chk" value="false">
													<input type="button" value="비밀번호 변경" name="chk_input_chg_pw" id="chk_input_chg_pw">
												</p>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<span class="dot">이메일</span>
										</th>
										<td colspan="3">
											<input type="text" name="my_info_email1" id="my_info_email1" size="8" maxlength="20" autocomplete="off">
											@
											<input type="text" name="my_info_email2" id="my_info_email2" size="12" maxlength="20" autocomplete="off" readonly>
											<input type="hidden" name="email_chk" id="email_chk" value="true">
											<select id="email_selectbox">
												<option value="">선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="userinput">직접입력</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>
											<span class="dot">전화번호</span>
										</th>
										<td colspan="3">
											<select id="phone_selectbox">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<input type="hidden" name="my_info_phone1" id="my_info_phone1" size="4" readonly>
											-
											<input type="text" name="my_info_phone2" id="my_info_phone2" size="4" maxlength="4" autocomplete="off">
											-
											<input type="text" name="my_info_phone3" id="my_info_phone3" size="4" maxlength="4" autocomplete="off">
											<input type="hidden" name="phone_chk" id="phone_chk" value="true">
										</td>
									</tr>
								
								</tbody>
							</table>
						</div>
						<div class="MyinfoInput">
							<input type="button" value="회원 정보 수정" name="info_chg_submit" id="info_chg_submit">
							<input type="button" value="정보 수정 취소" onclick="history.back()">
							<input type="button" value="회원 탈퇴" name="withdrawal_btn" id="withdrawal_btn">
						</div>
					</form>
				</div>
		</section>
	<br>
		
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>

















