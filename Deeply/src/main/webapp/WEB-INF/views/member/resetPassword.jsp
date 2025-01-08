<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 재설정</title>
</head>
<body>
    <h1>비밀번호 재설정</h1>
    <form action="/member/resetPassword" method="post">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="hidden" name="email" value="${email}"> <!-- 이메일을 hidden 필드로 전송 -->
        <label for="newPassword">새 비밀번호:</label>
        <input type="password" name="newPassword" required><br><br>

        <button type="submit">비밀번호 변경</button>
    </form>

    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
</body>
</html>