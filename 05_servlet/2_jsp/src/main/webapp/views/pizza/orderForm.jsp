<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자 주문</title>
</head>
<body>
	<h1>피자 주문하기</h1>
	<h2>현재 날짜</h2>
	<%
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	%>
	<%= sdf.format(today) %>
	<br><br>
	<form action="/2_jsp/orderPizza.do" method="get">
		<fieldset>
			<legend>주문자 정보</legend>
			<table>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" required />
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="phone" required />
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="address" required />
					</td>
				</tr>
				<tr>
					<td>요청사항</td>
					<td>
						<textarea name="requestMsg" placeholder="내용을 입력해주세요"></textarea>
					</td>
				</tr>
			</table>
		</fieldset>
		
		<fieldset>
			<legend>주문 정보</legend>
			<table>
				<tr>
					<td>피자</td>
					<td>
						<select name="menu">
							<option value="콤비네이션피자">콤비네이션피자</option>
							<option value="치즈피자">치즈피자</option>
							<option value="불고기피자">불고기피자</option>
							<option value="하와이안피자">하와이안피자</option>
							<option value="페퍼로니피자">페퍼로니피자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>토핑</td>
					<td>
						<input type="checkbox" name="topping"
								value="치즈" />치즈
						<input type="checkbox" name="topping"
								value="올리브" />올리브
						<input type="checkbox" name="topping"
								value="불고기" />불고기
						<input type="checkbox" name="topping"
								value="치즈 크러스트" />치즈 크러스트
						<br>
						<input type="checkbox" name="topping"
								value="파인애플" />파인애플
						<input type="checkbox" name="topping"
								value="베이컨" />베이컨
						<input type="checkbox" name="topping"
								value="포테이토" />포테이토
						<input type="checkbox" name="topping"
								value="새우" />새우
					</td>
				</tr>
				<tr>
					<td>사이드</td>
					<td>
						<input type="checkbox" name="sidemenu"
								value="콜라"/> 콜라
						<input type="checkbox" name="sidemenu"
								value="사이다"/> 사이다
						<input type="checkbox" name="sidemenu"
								value="피클"/> 피클
						<br>
						<input type="checkbox" name="sidemenu"
								value="치즈오븐스파게티"/> 치즈오븐스파게티
						<input type="checkbox" name="sidemenu"
								value="치킨텐더"/> 치킨텐더
					</td>
				</tr>
			</table>
		</fieldset>
		<br>
		<!-- <button type="submit">주문</button> -->
		<input type="submit" value="주문" />
		<input type="reset" />
	</form>
</body>
</html>