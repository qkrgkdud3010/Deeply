<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        let result = '${result}' || '';
        if (result === 'success') {
            alert('채팅방 형성이 완료되었습니다.');
        }
    });
    
</script>
<div class="page-main">

  <h2>형성된 채팅방</h2>

    <!-- Spring Form 태그 -->
    <form:form action="/table" method="post" modelAttribute="chatVO">
        <!-- chat_num을 hidden input으로 설정 -->
        <form:input path="chat_num" id="chat_num" type="hidden" />
        
        <!-- 확인용 출력 -->
        <p>채팅방 번호: <c:out value="${chat_num}" /></p>
        
        <!-- 버튼 (필요 시 자동 동작 추가 가능) -->
        <button type="submit" id="submitBtn">채팅방 정보 제출</button>
    </form:form>

    <script>
        // 필요하면 자동 제출을 활성화
        document.getElementById("submitBtn").click();
    </script>

</div>