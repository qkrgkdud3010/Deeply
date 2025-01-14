<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>



<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<input type="hidden" id="chat_num" value="${chat_num}">


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    ajax();  // 페이지 로드시 자동으로 ajax() 호출
});
    var auser_num = ${param.artist_num};
    function ajax() {
    
        var csrfToken = $("meta[name='_csrf']").attr("content"); // CSRF 토큰 값
        var csrfHeader = $("meta[name='_csrf_header']").attr("content"); // CSRF 헤더 이름

        $.ajax({
            url: "chatting", // 서버 경로
            type: "POST",
            data: {auser_num: auser_num},
            headers: {
                [csrfHeader]: csrfToken // CSRF 토큰을 헤더에 추가
            },
            success: function(response) {
                console.log("서버 응답:", response);
                alert("성공");
            },
            error: function(xhr, status, error) {
                console.error("에러 발생:", error);
                alert("에러");
            }
        });
    }
    </script>
    
 
<div class="page-main">

  <h2>형성된 채팅방</h2>
  ${param.artist_num}
  
	<c:if test="${chat_kind==1}">
	<div>
	 	<button type="submit" onclick="location.href='chWrite'">채팅방 닫기</button>
	 </div>
	</c:if>
	
	<c:if test="${chat_kind==0}">
	<div>
	
	 	<button type="submit" onclick="${pageContext.request.contextPath}/main/main">채팅방 나가기</button>
	 </div>
	</c:if>

  
</div>


