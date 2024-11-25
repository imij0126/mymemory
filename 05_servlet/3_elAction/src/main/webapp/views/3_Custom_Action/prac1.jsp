<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.ArrayList, com.kh.model.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    ul{
        list-style: none;
    }
</style>
</head>
<body>
    <c:set var="num1" value="25"/><br>
    <c:set var="num2" value="40" scope="request"/><br>

    <p>num1 : ${ num1 }</p>
    <p>num2 : ${ num2 }</p>
    <c:set var="addNum1" value="${ num1 + num2 }" scope="session"/>더하기 빼기<br>
    <c:set var="addNum2" value="${ num1 - num2 }" />더하기 빼기<br>
    <p>addNum1 : ${ addNum1 }</p>
    <p>addNum2 : ${ addNum2 }</p>
    <c:remove var="addNum1" scope="session"></c:remove>
    <p>addNum1 : ${ addNum1 }</p>
    <c:if test="${ num1 > num2 }">
        num1이 num2보다 큽니다.
    </c:if>
    <c:if test="${ num1 lt num2 }">
        num1이 num2보다 작다.
    </c:if>
    <br>
    <c:set var="hi" value="안녕"/>
    <c:if test="${ hi == '안녕' }">
        안냥안냥
    </c:if>
    <c:if test="${ hi != '안녕' }">
        헬로헬로
    </c:if>

    <hr>

    <c:choose>
        <c:when test="${ num1 > 20 }">
            <h3>20보다 큼</h3>
        </c:when>
        <c:when test="${ num1 >= 10 }">
            <h4>10보다 크거나 같음</h4>
        </c:when>
        <c:otherwise>10보다 작음</c:otherwise>
    </c:choose>

    <c:forEach var="i" begin="1" end="6">
        <h${ i }>i의 값은 : ${ i }</h${ i }>
    </c:forEach>

    <c:forEach var="x" begin="1" end="15">
        <c:choose>
            <c:when test="${ x % 2 == 0 }">
                <p>${ x }</p>
            </c:when>
        </c:choose>
    </c:forEach>

    <c:set var="game">
        사이버펑크2077,원스휴먼,라이브러리 오브 루이나,림버스 컴퍼니
    </c:set>
    <ul>
        <c:forEach var="g" items="${ game }">
            <li>${ g }</li>
        </c:forEach>
    </ul>

    <%
        ArrayList<Person> list = new ArrayList<>();

        list.add(new Person("김인창",30,"남자"));
        list.add(new Person("clem",27,"남자"));
        list.add(new Person("maru",28,"남자"));
    %>

    <%-- request.setAttribute("pList", list); --%>
    <c:set var="pList" value="<%= list  %>" scope="request">

    </c:set>
    <table border="2">
        <thead>
            <tr>
                <th>No</th>
                <th>이름</th>
                <th>나이</th>
                <th>성별</th>
            </tr>
        </thead>
    </table>
    <c:choose>
        
    </c:choose>
</body>
</html>