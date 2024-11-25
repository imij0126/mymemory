<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.outer {
		background-color: skyblue;
		color: darkblue;
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

		<h2 align="center">회원가입</h2>

		<form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
			<table>
				<tr>
					<td>* 아이디</td>
					<td>
						<input class="form-control" type="text" name="userId" maxlength="12" required>
					</td>
					<td>
						<input class="btn btn-sm btn-outline-light" type="button" value="중복체크" onclick="idCheck();">
					</td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td>
						<input class="form-control" type="password" name="userPwd" maxlength="15" required>
					</td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td>
						<input class="form-control" type="password" name="userPwdCheck" maxlength="15" required>
					</td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td>
						<input class="form-control" type="text" name="userName" maxlength="6" required>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;&nbsp;이메일
					</td>
					<td>
						<input class="form-control" type="email" name="email">
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;성별</td>
					<td>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="genderM" name="gender" value="M" checked >
							<label class="form-check-label" for="genderM">남자</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" id="genderF" name="gender" value="F" >
							<label class="form-check-label" for="genderF">여자</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;생년월일</td>
					<td>
						<input class="form-control" type="date" id="birth" onchange="setBirthday();">
						<input type="hidden" name="birthday">
					</td>
				</tr>			
				<tr>
					<td>
						&nbsp;&nbsp;전화번호
					</td>
					<td>
						<input class="form-control" type="tel" name="phone" placeholder="- 포함해서 입력">
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;&nbsp;주소
					</td>
					<td>
						<input class="form-control" type="text" name="address">
					</td>
				</tr>
			</table>
	
			<br><br>
	
			<div align="center">
				<button class="btn btn-primary" type="submit" onclick="return pwdCheck();" disabled>회원가입</button>
				<button class="btn btn-warning" type="reset">초기화</button>
			</div>

			<br><br>
		</form>
	</div>

	<script>
		function setBirthday() {
			
			// 생년월일 데이터 
			const birthEle = document.querySelector("#enroll-form #birth");
			const birthdayEle = document.querySelector("#enroll-form input[name=birthday]");
			
			const dateArr = birthEle.value.split('-');
			birthdayEle.value = dateArr[0].substring(2) + dateArr[1] + dateArr[2];
			
		}
	
		function pwdCheck() {
			const pwd = document.querySelector("#enroll-form input[name=userPwd]").value;
			const pwdCheck = document.querySelector("#enroll-form input[name=userPwdCheck]").value;

			if (pwd != pwdCheck) {
				alert("비밀번호와 비밀번호 확인 입력값이 다릅니다.");
				return false;
			}
			
		}

		function idCheck() {
			// 중복체크 버튼 클릭 시 사용자가 입력한 아이디 값을 서버로 보내서
			// 중복되는 데이터가 있는 지 조회한 후에 결과를 받을 것임!

			// (1) 사용 가능 => 사용 가능합니다. 메시지 출력, 회원가입 버튼을 활성화
			// (2) 사용 불가능 => 사용할 수 없는 아이디입니다. 메시지 출력, 다시 입력할 수 있도록 유도

			const idEle = $("#enroll-form input[name=userId]");

			console.log("userId: "+idEle.val());

			console.log("*** ajax 요청 전 ***");
			$.ajax({
				url: 'idCheck.me',
				type: 'get',
				data: { userId: idEle.val() },
				success: function(result) {
					// result ==> 중복된 아이디가 있을 경우 ("NNN"), 없을 경우 ("NNY")
					console.log(result);
					if (result == "NNY") {
						// 사용 가능 => 사용 가능합니다. 메시지 출력, 회원가입 버튼을 활성화
						alert("사용 가능한 아이디입니다.");

						$("#enroll-form button[type=submit]").removeAttr("disabled");
					} else {
						// 사용 불가능 => 사용할 수 없는 아이디입니다. 메시지 출력, 다시 입력할 수 있도록 유도
						alert("사용 불가능한 아이디입니다. 다시입력해주세요.");

						idEle.focus();
					}
					
				},
				error: function(err) {
					console.log(err);
				}
			});
		}
	</script>
</body>
</html>