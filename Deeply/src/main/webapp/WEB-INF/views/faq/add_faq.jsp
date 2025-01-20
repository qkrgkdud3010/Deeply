<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>FAQ 추가</title>
</head>
<body>
<h1>FAQ 추가</h1>
<form action="${pageContext.request.contextPath}/faq/add" method="post">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
    <label for="category">카테고리:</label>
    <select name="categoryId" id="category" required>
        <option value="">선택하세요</option>
        <c:forEach var="category" items="${categories}">
            <option value="${category.categoryId}">${category.categoryName}</option>
        </c:forEach>
    </select>
    <br/><br/>
    <label for="question">질문:</label>
    <input type="text" id="question" name="question" maxlength="500" required />
    <br/><br/>
    <label for="answer">답변:</label>
    <textarea id="answer" name="answer" maxlength="1000" required></textarea>
    <br/><br/>
    <button type="submit">추가</button>
</form>
</body>
</html>
