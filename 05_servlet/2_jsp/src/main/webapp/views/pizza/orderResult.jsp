<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자 주문 내역</title>
</head>
<body>
	<%
		String name = (String)request.getAttribute("name");
		String phone = (String)request.getAttribute("phone");
		String address = (String)request.getAttribute("address");
		String requestMsg = (String)request.getAttribute("requestMsg");
		
		String menu = (String)request.getAttribute("menu");
		String[] toppings = (String[])request.getAttribute("toppings");
		String[] sidemenus = (String[])request.getAttribute("sidemenus");
	%>
	<h1>피자 주문 내역</h1>
	<h3>주문자 정보</h3>
	<%-- <% out.print(address) %> --%>
	<p style="color:blue"><%= address %></p> 
	<p style="color:blue"><%= phone %></p>
	<h3>요청 사항</h3>
	<%-- isEmpty() : 문자열 메소드. 해당 문자열이 비어있는 지 체크 --%>
	<% if (requestMsg.isEmpty()) { %>
		없음
	<% } else { %>
		<%= requestMsg %>
	<% } %>
	<hr>
	
	<h3>주문 정보</h3>
	<%= menu %>
	<ul>
		<li>
			토핑 추가 항목
			<% if (toppings == null) { %>
				<br>없음
			<% } else { %>
				<ul>
					<% for(String topping: toppings) { %>
						<li><%= topping %></li>
					<% } %>
				</ul>
			<% } %>
		</li>
		<li>
			사이드 선택 항목
			<% if (sidemenus == null) { %>
				<br>없음
			<% } else {%>
				<ul>
					<% for (String side : sidemenus) { %>
						<li><%= side %></li>
					<% } %>
				</ul>
			<% } %>
		</li>
	</ul>
	<hr>
	<h2><%= name %>님!</h2>
	<h2>
		<span style="color:blue;">즐거운</span>
		<span style="color:red;">식사</span> 되세요
		<span style="color:yellow;">:)</span>
	</h2>
</body>
</html>