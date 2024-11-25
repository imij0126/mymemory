<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Spring</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    #top-area { display: flex; justify-content: space-around; padding: 1em;}

    #top-area a { text-decoration: none; color: black; }

    nav {margin:0;padding:0;}
    nav a {font-weight: bold; height: 50px; line-height: 50px; }
    nav a:hover, nav a.active { cursor: pointer;}
    nav a.active { background-color: #485ba6; color: white; }
    
    .outer {
        background-color: #e7e7e7;
        width: 80%;
        margin: auto;
    }
    .inner-area {
        border: 1px solid #000025;
        width: 80%;
        margin: auto;
        padding: 5% 15%;
        background: #e7ecf7;
    }  
    
    /* 게시판 css */
    #boardList, #topList {text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}

    #pagingArea {width:fit-content; margin:auto;}

    #searchForm {width:80%; margin: auto;}
    #searchForm>* {float:left; margin:5px;}
    
    .select {width:25%;}
    .text {width:48%;}
    .searchBtn{width:20%;}
</style>
</head>
<body>
	<%
		String contextPath = request.getContextPath();
	%>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	
    <div id="top-area">
        <img src="https://khedu.co.kr/resources/images/main/logo.svg" alt="kh_logo" width="150" />
        <div></div>
        
        <c:choose>
	        <c:when test="${ empty loginUser }">
		        <!-- 로그인 전 보여질 화면 -->
		        <div>
		            <a href="<%= contextPath %>/member/enrollForm">회원가입</a> &nbsp;|&nbsp;
		            <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
		        </div>
			</c:when>
			<c:otherwise>
		        <!-- 로그인 후 보여질 화면 -->
		        <div>
		            <label>${ loginUser.userName }님 환영합니다.</label> &nbsp;&nbsp;
		            <a href="<%= contextPath %>/member/myPage">마이페이지</a>
		            <a href="<%= contextPath %>/member/logout">로그아웃</a>        
		        </div>
        	</c:otherwise>
        </c:choose>
    </div>
    <hr>
    <nav class="container text-center">
        <div class="row">
            <a href="<%= contextPath %>" class="active col-3">HOME</a>
            <a class="col">공지사항</a>
            <a href="<%= contextPath %>/board/list" class="col">자유게시판</a>
            <a class="col">사진게시판</a>
        </div>
    </nav>
    <!-- 로그인 모달 -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">LOGIN</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<%= contextPath %>/member/login" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                    <label for="userId" class="col-form-label">ID:</label>
                    <input type="text" class="form-control" placeholder="Enter ID.." id="userId" name="userId" />
                    </div>
                    <div class="mb-3">
                    <label for="userPwd" class="col-form-label">PASSWORD:</label>
                    <input type="password" class="form-control" placeholder="Enter Password.." id="userPwd" name="userPwd" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                </div>
            </form>
          </div>
        </div>
      </div>
      <script>
        window.onload = () => {
            const menuList = document.querySelectorAll("nav a");
            menuList.forEach((menu)=>{              
                menu.addEventListener('click', (ev)=>{           
                    removeActiveClass(menuList);         
                    ev.target.classList.add("active");
                });

	// 현재 주소 기준으로 active 클래스 추가
               const lHref = location.href; 
               if (menu.href === lHref) {
            	   removeActiveClass(menuList);
            	   menu.classList.add("active");
               } else {
            	   activeMenu(menuList);
               }
            });
            
            
            
            document.title = 'Hello, Spring!';
            
        }
        const removeActiveClass = (list) => {
            list.forEach((menu)=>{
                menu.classList.remove("active");
            })
        }
        const activeMenu = (menuList) => {
        	
        	const paths = location.pathname.split("/");
        	if (paths.length > 2) {
        		const menu = paths[2];
        		
        		if(menu === 'board') {
             	   	removeActiveClass(menuList);
        			document.querySelector("nav a:nth-child(3)").classList.add("active");
        		}
        	}
        	
        }        
      </script>
</body>
</html>