<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%><!-- 로그인 관련 태그 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let result = '${result}';
	if (result == 'success') {
		alert('글 등록이 완료되었습니다.');
	}
</script>



<div class="item-main main-container">
	<div class="button page-action">
		<c:if test="${!empty principal}">
			<input type="button" value="등록하기" onclick="location.href='/item/write'">
		</c:if>
	</div>
	<div class="listcontent-container item-container">
		<div class="artist-name">반갑습니다. </div>
		<c:if test="${count == 0}">
			<div class="result-display">표시할 게시물이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
			<c:forEach var="item" items="${list}" varStatus="status">
				<div class="item-card">
					<a href="${pageContext.request.contextPath}/item/detail?item_num=${item.item_num}">
						<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" width="180px" height="180px"
							class="item-img">
					</a>
					<hr class="custom-hr" noshade="noshade" width="100%">
					<span class="item-name list-text" style="font-size:18px;">${item.item_name}</span>
					<span class="item-name list-price" style="font-size:18px; color:#0369A1;">${item.item_price}</span>
				</div>
				
				<c:if test="${(status.index + 1) % 4 == 0}">
					<hr class="custom-hr" noshade="noshade" width="100%">
				</c:if>
			</c:forEach>
			<!-- 페이징 -->
			<div class=list-paging>${page}</div>
		</c:if>

	</div>
</div>