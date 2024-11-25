<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%-- header --%>
    <jsp:include page="../common/header.jsp" />

    <div class="outer">
        <br><br>
        <div class="inner-area">
            <h2>게시글 상세보기</h2>
            <br>
            <a href="list" class="btn btn-secondary" style="float:right;">목록보기</a>
            <br><br>

            <table align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">
                        ${ b.boardTitle }
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        ${ b.boardWriter }
                    </td>
                    <th>작성일</th>
                    <td>
                        ${ b.createDate }
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                        <c:choose>
                        
                        	<c:when test="${ not empty b.originName }">
                        	
                        		<a href="<%= request.getContextPath() %>/${ b.changeName }" download="${ b.originName }">${ b.originName }</a>
                        	
                        	</c:when>
                        	
                        	<c:otherwise>
                        		첨부파일 없음
                        	</c:otherwise>
                        	
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <p style="height:150px;">
                            ${ b.boardContent }
                        </p>
                    </td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 작성자와 로그인한 계정이 동일한 경우만 표시 -->
                <c:if test="${ loginUser.userId eq b.boardWriter }">
	                <a class="btn btn-primary" onclick="postSubmit('update');">수정</a>
	                <a class="btn btn-danger" onclick="postSubmit('delete');">삭제</a>
                </c:if>
            </div>
            <br><br>
            
            <form action="" method="post" id="postForm">
            	<input type="hidden" name="bno" value="${ b.boardNo }" />
            </form>
            
            <script>
            	function postSubmit(type) {
            		const postForm = document.getElementById("postForm");
            		// document.querySelector("#postForm")
            		
            		if (type == 'update') {
            			// 게시글 수정 페이지로 요청
            			postForm.action = 'updateForm';
            		} else if (type == 'delete') {
            			// 게시글 삭제 요청
            			postForm.action = 'delete';
            		}
            		
            		postForm.submit();
            	}
            </script>

            <table id="replyArea" class="table" align="center">
                <thead>
                	<%-- 
                			* 로그인한 사용자만 댓글을 작성할 수 있도록
                			  => 만약, 로그인을 하지 않았다면 
                			  					입력창 부분에 '로그인 후 이용가능합니다.' 메시지를 표시하고 입력하지 못하도록
                			  					[등록] 버튼을 비활성화 
                	--%>
                	<c:choose>
                	
                		<c:when test="${ not empty loginUser }">
                			<%-- 로그인 했을 경우 --%>
												<tr>
		                        <th colspan="2">
		                            <textarea id="content" cols="55" rows="2" class="form-control" style="resize: none;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle;">
		                            <button class="btn btn-secondary" onclick="addReply();">등록</button>
		                        </th>
		                    </tr>                		
                		</c:when>
                		
                		<c:otherwise>
                			<%-- 로그인 하지 않았을 경우 --%>
                			<tr>
		                        <th colspan="2">
		                            <textarea id="content" cols="55" rows="2" class="form-control" style="resize: none;" readonly placeholder="로그인 후 이용 가능합니다."></textarea>
		                        </th>
		                        <th style="vertical-align:middle;">
		                            <button class="btn btn-secondary" disabled>등록</button>
		                        </th>
		                    </tr>  
                		</c:otherwise>
                	</c:choose>
                    
                    <tr>
                        <td colspan="3">댓글 (<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>     
            <br><br>
        </div>


    </div>
    <script>
    	// onload
    	$(function(){
    		// 해당 게시글의 댓글 목록 조회 (ajax)
    		selectReplyList();
    	});
    	
    	function selectReplyList() {
    		$.ajax({
    			url: "rlist",
    			
    			data: { bno: ${ b.boardNo } },
    			
    			success: function(result) {
    				console.log(result);
    				
    				// 댓글 목록이 있을 경우 화면에 표시
    				//  => 댓글 목록 없을 경우 : 빈 배열
    				//  => 댓글 목록 있는 경우 : 배열에 데이터 담겨져있음
    				if (result != null && result.length > 0) {
    					let replyValue = "";
    					
    					for(let r of result) {
    						replyValue += "<tr>"
    										+ "<th>" + r.replyWriter + "</th>"
    										+ "<td>" + r.replyContent + "</td>"
    										+ "<td>" + r.createDate + "</td>"
    									+ "</tr>";
    					}
    					
    					$("#replyArea tbody").html(replyValue);
    					$("#rcount").text(result.length);
    				}
    			},
    			
    			error: function(err) {
    				console.log("댓글 조회 실패!");
    				console.log(err);
    			}
    		});
    	}
    
    	function addReply() {
    		// alert( $("#replyArea #content").val() );
    		
    		// 입력된 내용이 있을 경우 추가 요청하도록 (공백x)
    		if ($("#replyArea #content").val().trim().length > 0) {
	    		// 댓글 추가 요청 (ajax)
	    		//  => /spring/board/rinsert?replyContent=입력된내용&refBno=게시글번호&replyWriter=작성자
	    		$.ajax({
	    			url: 'rinsert', 		// 요청 주소
	    			data: {
	    				replyContent: $("#replyArea #content").val(),
	    				refBno: '${ b.boardNo }',	// 숫자는 문자열로 감싸지 않아도 됨
	    				replyWriter: '${ loginUser.userId }'
	    			},		// 전달 데이터
	    			success: function(result) {		// 요청 성공 시 (통신 성공)
	    				console.log(result);
	    				if (result === 'success') {
		    				// 댓글 추가 성공 시 (result = 'success'), 입력창 부분을 초기화 댓글 목록 다시 조회
	    					$("#replyArea #content").val('');
	    					selectReplyList();
	    				} else {
		    				// 댓글 추가 실패 시 (result = 'failed'), '댓글 추가에 실패했습니다.' 메시지를 출력(alert)
	    					alert('댓글 추가에 실패했습니다');
	    				}
	    				
	    			},
	    			error: function(err) {			// 요청 실패 시 (통신 실패)
	    				console.log('댓글 추가 요청 실패');
	    				console.log(err);
	    			}
	    		});
    		} else {
    			alert("내용 입력 후 추가 가능합니다.");
    		}
    	}
    </script>

    <%-- footer --%>
    <jsp:include page="../common/footer.jsp" />    
</body>
</html>