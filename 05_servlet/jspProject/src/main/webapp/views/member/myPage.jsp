<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	.outer {
		background-color: rgb(71, 234, 255);
		color: white;
		width: 1000px;
		margin: auto;
		margin-top: 50px;
	}

	#enroll-form table { margin: auto; }
	#enroll-form input { margin: 5px; }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>

		<h2 align="center">마이페이지</h2>

		<form id="enroll-form" action="<%= contextPath %>/update.me" method="post">
			<table>
				<tr>
					<td>* 아이디</td>
					<td>
						<input type="text" name="userId" maxlength="12" value="${ loginUser.userId }" readonly>
					</td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td>
						<input type="text" name="userName" maxlength="6" value="${ loginUser.userName }" required>
					</td>
				</tr>
				<tr>
					<td>
						전화번호
					</td>
					<td>
						<input type="tel" name="phone" placeholder="- 포함해서 입력" value="${ loginUser.phone }">
					</td>
				</tr>
				<tr>
					<td>
						이메일
					</td>
					<td>
						<input type="email" name="email" value="${ loginUser.email }">
					</td>
				</tr>
				<tr>
					<td>
						주소
					</td>
					<td>
						<input type="text" name="address">
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="interest" id="baseball" value="야구">
						<label for="baseball">야구</label>
						
						<input type="checkbox" name="interest" id="cartoon" value="만화">
						<label for="cartoon">만화</label>
						
						<input type="checkbox" name="interest" id="soccer" value="축구">
						<label for="soccer">축구</label>
						
						<br>
	
						<input type="checkbox" name="interest" id="study" value="공부">
						<label for="study">공부</label>
						
						<input type="checkbox" name="interest" id="game" value="게임">
						<label for="game">게임</label>
					</td>
				</tr>
			</table>
	
			<br><br>
	
			<div align="center">
				<button class = "btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#updatePwdModal">비밀번호 변경</button>
				<button class = "btn btn-sm btn-info" type="submit">정보 수정</button>
				<button class = "btn btn-sm btn-secondary" type="button" data-toggle="modal" data-target="#delMemberModal">회원 탈퇴</button>
			</div>

			<br><br>
		</form>
	</div>
	<!-- 회원탈퇴용 모달 -->
	 <div class="modal fade" id="delMemberModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title fs-5" id="delMemberModalLabel">회원탈퇴</h2>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
					<div class="modal-body">
						<form action="<%= contextPath %>/delete.me" method="post">
							<input type="hidden" name="userId" value="${ loginUser.userId }">
							<b>
								탈퇴 후 복구 불가능합니다. <br>
								그래도 탈퇴하시겠습니까?
							</b>
							<br><br>
							<div class="mb-3">
								<label for="userPwd" class="col-form-label">비밀번호 : </label>
								<input type="password" class="form-control" id="userPwd" name="userPwd" required>
							</div>

							<button type="submit" class="btn btn-sm btn-warning">탈퇴하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	 </div>

	<!-- 비밀번호 변경용 모달 -->
	<div class="modal fade" id="updatePwdModal" tabindex="-1" aria-labelledby="updatePwdModal" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="updatePwdModal">비밀번호 변경</h1>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
			</div>
			<div class="modal-body">
			  <form action="<%= contextPath %>/updatePwd.me" method="post">
				<div class="mb-3">
				  <label for="userPwd" class="col-form-label">현재 비밀번호 : </label>
				  <input type="password" class="form-control" id="userPwd" name="userPwd">
				</div>
				<div class="mb-3">
				  <label for="newPassword" class="col-form-label">변경할 비밀번호 :</label>
				  <input type="password" class="form-control" id="newPassword" name="newPassword"></input>
				</div>

				<div class="mb-3">
				  <label for="newPasswordCheck" class="col-form-label">변경할 비밀번호 확인:</label>
				  <input type="password" class="form-control" id="newPasswordCheck" name="newPasswordCheck"></input>
				</div>
				<br>

				<button class="btn btn-sm btn-info " onclick="return pwdCheck();">비밀번호 변경</button>

			  </form>
			</div>
			<!-- <div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			  <button type="button" class="btn btn-primary">Send message</button>
			</div> -->
		  </div>
		</div>
	  </div>

	<script>
		// onload = function(){}
		$(function(){
			const interest = "${ loginUser.interest }";
			const checkArr = $("input[name=interest]"); // [input, input, input, ..]
			
			console.log(interest);
			console.log(checkArr);
			
			for(let check of checkArr){ // checkbox 요소에 하나씩 접근
				// check => js방식으로 접근된 요소로 인식됨!
				if(interest.includes(check.value)){
					//check.prop("checked", true); // jquery 방식
					 check.checked = true; // js방식
				}
			}
		});	
	
	
	
		function pwdCheck(){
			const pwd = document.querySelector("#updatePwdModal input[name=newPassword]").value;
			const pwdCheck = document.querySelector("#updatePwdModal input[name=newPasswordCheck]").value;

			if(pwd != pwdCheck){
				alert("비밀번호와 비밀번호 확인 입력값이 다릅니다.");
				return false;
			}
		}

		function idCheck(){
			// 중복체크 버튼 클릭 시 사용자가 입력한 아이디 값을 서버로 보내서 
			// 중복되는 데이터가 있는 지 조회한 후에 결과를 받을 것임!

			// (1) 사용 가능 => 사용 가능합니다. 메시지 출력, 회원가입 버튼을 활성화
			// (2) 사용 불가능 => 사용할 수 없는 아이디입니다. 메시지 출력, 다시 입력할 수 있도록 유도

			const idEle = $("#enroll-form input[name=userId]");

			console.log("userId : " + idEle.val());

			console.log("*** ajax 요청 전 ***");
			$.ajax({
				url : 'idCheck.me',
				type : 'get',
				data : { userId: idEle.val() },
				success : function(result){
					// result ==> 중복된 아이디가 있을 경우("NNN"), 없을경우 ("NNY")
					console.log(result);
					if(result == "NNY"){
						//사용 가능 => 사용 가능합니다. 메시지 출력, 회원가입 버튼 활성화
						alert("사용 가능한 아이디입니다.");

						$("#enroll-form button[type=submit]").removeAttr("disabled");
					}else{
						// 사용 불가능 => 사용할 수 없는 아이디입니다. 메시지 출력
						alert("사용 불가능한 아이디입니다. 다시 입력해주세요");
						idEle.focus();
					}
				},
				error : function(err){
					console.log(err);
				}
			});
		}
	</script>
</body>
</html>