<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<title>GetGet reginew 글쓰기</title>
		<%@ include file="../headermeta.jsp" %>
</head>
<body>
		<%@ include file="../header.jsp" %>
		<br><br><br>
		<div class="AreaFlex">
			<section class="info_box">
				<h2><span>이벤트</span> 등록하기</h2>
			</section>
	
			<div class="container">
				<div class="row">
					<form method="post" action="/getget/RegiNewAction" enctype="multipart/form-data">
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
								<thead>
									<!-- <tr>
										<th colspan="2" style="background-color:#eeeeee; text-align:center;"> 글쓰기</th>
									</tr> -->
								</thead>
								<tbody>
									<tr>
										<td>이벤트 제목 : <input type="text" class="form-control" placeholder="이벤트제목" name="eventName" maxlength="50"></td>
									</tr>
									<tr>	
										<td>이벤트 내용 : <textarea class="form-control" placeholder="이벤트 내용을 입력하세요" name="content" maxlength="2048"></textarea></td>
									</tr>
									<tr>
										<td>브랜드이름 : <input type="text" class="form-control" placeholder="브랜드이름" name="brandName" maxlength="50"></td>
									</tr>
									<tr>	
										<td>할인정도 : <textarea class="form-control" placeholder="부여할 할인내용을 글자로 입력해주세요" name="coupon" maxlength="50"></textarea></td>
									</tr>
									</tbody>
								</table>
								
								<div class="container">
									<label for="reginewImg">썸네일 이미지</label>
									<input type="file" id="reginewImg" name="reginewImg" />
									<div class="select_img"><img src="" /></div>
					<!-- <tr>
										<td>등록번호 : <input type="text" class="form-control" placeholder="이벤트번호" name="number" maxlength="50"></td>
									</tr> -->
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
					
								<div class="container">
									<label for="reginewImgDetail">상세정보 이미지</label>
									<input type="file" id="reginewImgDetail" name="reginewImgDetail" />
									<div class="select_img_detail"><img src="" /></div>
					
								<script>
								  $("#reginewImgDetail").change(function(){
								   if(this.files && this.files[0]) {
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $(".select_img_detail img").attr("src", data.target.result).width(500);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
								 </script>
					 
					 				<%=request.getRealPath("/") %>
					 
								</div>
								
								<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
							</form>
						</div>
					</div>
					
			</div>

	<br>
		
	</main>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>