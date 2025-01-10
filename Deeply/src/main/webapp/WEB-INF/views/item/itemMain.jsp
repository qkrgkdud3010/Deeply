<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<div class="artist-name">반갑습니다. 상품의 메인 페이지 </div>
		<c:if test="${count == 0}">
			<div class="result-display">표시할 게시물이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
			<c:forEach items="${groupedItems}" var="entry" varStatus="status">
				<!-- group_name을 key로 출력 -->
				<div class="main-items">
					<c:if test="${fn:length(entry.value) > 0}">
					<div><h3>${entry.key}</h3></div>
					<!-- group_name -->

					<!-- itemVO 리스트를 4개씩 나누기 -->
					<div class="value-list">
						<c:forEach items="${entry.value}" var="item" begin="0" end="3">
							<div class="item-card">
								<a href="${pageContext.request.contextPath}/item/list?item_num=${item.item_num}">
								<img
									src="${pageContext.request.contextPath}/assets/upload/${item.filename}"
									width="180px" height="180px" class="item-img">
								</a>
								<hr class="custom-hr" noshade="noshade" width="100%">
								<span class="item-name list-text" style="font-size: 18px;">${item.item_name}</span>
								<span class="item-name list-price"
									style="font-size: 18px; color: #0369A1;">${item.item_price}</span>
							</div>
						</c:forEach>
					</div>
					<a class="right-align" href="list?user_num=${entry.value[0].user_num}">-> 전체보기</a>
					</c:if>
				</div>
			</c:forEach>
			<!-- 페이징 -->
			<div class=list-paging>${page}</div>
		</c:if>

	</div>
</div>