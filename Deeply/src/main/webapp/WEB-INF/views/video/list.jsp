<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <title>Video List</title>
</head>
<body>
    <h1>Video List</h1>
    <ul>
        <c:forEach items="${videos}" var="video">
            <li>
                <strong>${video.title}</strong><br>
                <span>${video.description}</span><br>
                Views: ${video.views}, Likes: ${video.likes}
            </li>
        </c:forEach>
    </ul>
</body>
</html>
