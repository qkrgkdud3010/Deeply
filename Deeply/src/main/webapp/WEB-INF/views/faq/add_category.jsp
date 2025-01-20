<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카테고리 추가</title>
</head>
<body>
<h1>카테고리 추가</h1>
<form action="${pageContext.request.contextPath}/faq/categories/add" method="post">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
    <label for="categoryName">카테고리명:</label>
    <input type="text" id="categoryName" name="categoryName" maxlength="50" required />
    <br/><br/>
    <label for="description">설명:</label>
    <textarea id="description" name="description" maxlength="200"></textarea>
    <br/><br/>
    <button type="submit">추가</button>
</form>
</body>
</html>
