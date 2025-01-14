<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
    /* 테이블 기본 스타일 */
    .striped-table {
        width: 1000px;
        border-collapse: collapse;
        margin: 20px 0;
        font-family: Arial, sans-serif;
    }

    .striped-table th, .striped-table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .striped-table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    .striped-table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .striped-table tr:hover {
        background-color: #f1f1f1;
    }

    /* 링크 스타일 */
    .striped-table a {
        color: #007BFF;
        text-decoration: none;
    }

    .striped-table a:hover {
        text-decoration: underline;
    }

    /* 권한 텍스트 색상 */
    .auth-0 {
        color: green;
    }

    .auth-1 {
        color: red;
    }

    .auth-2 {
        color: orange;
    }

    .auth-9 {
        color: blue;
    }

    /* 페이지 네비게이션 스타일 */
    .align-center {
        text-align: center;
        margin-top: 20px;
    }

    .pagination {
        display: inline-block;
    }

    .pagination a {
        color: #007BFF;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        margin: 0 5px;
        border-radius: 4px;
    }

    .pagination a:hover {
        background-color: #f1f1f1;
    }

    .pagination .active {
        background-color: #007BFF;
        color: white;
    }

    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .striped-table th, .striped-table td {
            padding: 8px;
        }
    }
</style>
	<hr>
<div class="main-div" style="height:1000px;">

	<div class="admin-one">
		<ul>
			<li><a href="admin_list">사용자 조회</a></li>
			<li><a href="#">아티스트 정보 조회</a></li>
			<li><a href="#">이벤트 관리</a></li>
			<li><a href="#">사이트 관리</a></li>
			<li><a href="#">1대1문의 관리</a></li>
		</ul>
	</div>
	<div class="admin-two">

	<h2>회원관리(관리자 전용)</h2>
	<form action="admin_artist" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>아이디</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>이름</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>이메일</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>전체</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword"
				  id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록"
				   onclick="location.href='admin_list'">
			</li>
		</ul>
	</form>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 회원정보가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>아이디</th>
			<th>아티스트 이름</th>
			<th>그룹 이름</th>
			<th>이메일</th>
		
		</tr>
		<c:forEach var="member" items="${list}">
		<tr>
			<td>${member.id}</td>
			
			<td>${member.name}</td>
			
			<td>${member.group_name}</td>
			<td>${member.email}</td>
		
			
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>

	</div>

</div>