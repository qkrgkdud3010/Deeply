<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카테고리 수정</title>
</head>
<body>
<h1>카테고리 수정</h1>
<form action="${pageContext.request.contextPath}/faq/categories/edit" method="post">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="hidden" name="categoryId" value="${category.categoryId}" />
    <label for="categoryName">카테고리명:</label>
    <input type="text" id="categoryName" name="categoryName" maxlength="50" value="${category.categoryName}" required />
    <br/><br/>
    <label for="description">설명:</label>
    <textarea id="description" name="description" maxlength="200">${category.description}</textarea>
    <br/><br/>
    <button type="submit">수정</button>
</form>
</body>
</html>
