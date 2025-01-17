<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
</sec:authorize>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navigation.css">

      
   <main>
    <!-- 알람 정보 출력 -->
    <section>
        <h2>알람 내용</h2>
        <c:if test="${not empty alarmList}">
            <ul>
                <c:forEach var="alarm" items="${alarmList}">
               
                    
                    <!-- al_kind 값에 따라 다른 내용 출력 -->
                    <c:choose>
                        <c:when test="${alarm.al_kind == 3}">
                            <li>아티스트 번호: ${alarm.artist_num}</li>
                            <li>답장 제목: ${alarm.al_title}</li>
                        </c:when>
                        <c:when test="${alarm.al_kind == 4}">
                         <li>아티스트 또는 그룹 번호: ${alarm.artist_num}</li>
                            <li>공연 제목: ${alarm.al_title}</li>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </ul>
        </c:if>
        
        <c:if test="${empty alarmList}">
            <p>알람이 없습니다.</p>
        </c:if>
    </section>
</main>