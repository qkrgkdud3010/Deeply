<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%><!-- 로그인 관련 태그 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<div class="item-main main-container">
	<c:if test="${!empty principal.artistVO && principal.artistVO.group_name.equals(agroup.group_name)}">
	${item.item_num}
	<input type="button" value="수정하기" onclick="location.href='/item/update?item_num=${item.item_num}'"/>
	<input type="button" value="삭제하기" id="delete_btn"/>
		<script type="text/javascript">
			const delete_btn = document.getElementById('delete_btn')
			delete_btn.onclick = function() {
				const choice = confirm('삭제하시겠습니까?');
				if (choice) {
					location.replace('delete?item_num=${item.item_num}');
				}
			};
			
			function goHistory(n) {
		        if (window.history.length > Math.abs(n)) {
		            history.go(n);
		        } else {
		            // 이동 가능한 단계가 없을 경우 기본 페이지로 이동
		            window.location.href = '/item/main';
		        }
		    }
		</script>
		
		<input type="button" value="등록하기" onclick="location.href='/item/write'">
		<a href="javascript:history.go(-1);" class="btn-back">이전으로</a>
	</c:if>
		<div class="content-container">
			<div class="artist-name">반갑습니다. ${item.group_name}
				<span class="date">등록일 : 
					<fmt:formatDate value="${item.item_regdate}" pattern="yyyy년 MM월 dd일" />
					<c:if test="${!empty item.item_modifydate}">수정일 : 
						<fmt:formatDate value="${item.item_modifydate}" pattern="yyyy년 MM월 dd일" />
					</c:if>
				</span>
			</div>
		<div class="item-info">
			<div class="box-shadow">
				<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" class="items-img">
			</div>
				<div class="box-shadow">
					<ul>
						<li>상품명 : ${item.item_name}</li>
						<li>가격 : ${item.item_price}원</li>
						<li>수량 : ${item.item_stock}개</li>
					</ul>
				</div>
		</div>
		
	
	<div>
	<div>상품설명
		</div>
	<c:if test="${fn:endsWith(item.filename,'.jpg') ||
                    fn:endsWith(item.filename,'.JPG') ||
                    fn:endsWith(item.filename,'.jpeg') ||
                    fn:endsWith(item.filename,'.JPEG') ||
                    fn:endsWith(item.filename,'.gif') ||
                    fn:endsWith(item.filename,'.GIF') ||
                    fn:endsWith(item.filename,'.png') ||
                    fn:endsWith(item.filename,'.PNG')}">
    <div class="align-center">
       <%--<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" class="ckeditor-img">--%>
        <c:out value="${item.item_description}" escapeXml="false"/>
    </div>
    </c:if>
		

	<!-- 반품/교환 규정 포함 -->
  		  <div class="item-policy title">반품/교환 규정</div>
   			 <div class="item-policy">
     		   <%@ include file="returnPolicy.jsp" %> <!-- 수정: include 유지 -->
  		  </div>
	</div>
</div>

</div>