<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>카테고리 관리</title>
</head>
<body>
<input type="hidden" name="_csrf" value="${_csrf.token}">
<h1>FAQ 카테고리 관리</h1>
<a href="${pageContext.request.contextPath}/faq/categories/add">카테고리 추가</a>
<table border="1">
    <thead>
        <tr>
            <th>카테고리 ID</th>
            <th>카테고리명</th>
            <th>설명</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="category" items="${categories}">
            <tr>
                <td>${category.categoryId}</td>
                <td>${category.categoryName}</td>
                <td>${category.description}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/faq/categories/edit/${category.categoryId}">수정</a>
                    <a href="${pageContext.request.contextPath}/faq/categories/delete/${category.categoryId}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
