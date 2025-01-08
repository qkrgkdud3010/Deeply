<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%><!-- 로그인 관련 태그 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<div class="item-main main-container">
	<input type="button" value="수정하기" onclick="location.href='/item/update?item_num=${item.item_num}'"/>
	<input type="button" value="삭제하기" id="delete_btn"/>
		<c:if test="${!empty principal && principal.memberVO.user_num == item.user_num}">
			<script type="text/javascript">
				const delete_btn = document.getElementById('delete_btn')
				delete_btn.onclick = function(){
					const choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.replace('delete?item_num=${item.item_num}');
					}
				};
			</script>
		</c:if>



	<input type="button" value="취소" onclick="location.href='/item/list'"/>
		<div class="content-container">
			<div class="artist-name">반갑습니다. ${member.nick_name}님
				<span class="date">등록일 : ${item.item_regdate}
					<c:if test="${!empty item.item_modifydate}">수정일 : ${item.item_modifydate}</c:if>
				</span>
			</div>
		<div class="item-info">
			<div class="box-shadow">
				<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" width="180px" height="180px" class="detail-img">
			</div>
				<div class="box-shadow">
					<ul>
						<li>상품명 : ${item.item_name}</li>
						<li>가격 : ${item.item_price}원</li>
						<li>수량 : ${item.item_stock}개</li>
					</ul>
				</div>
		</div>
		</div>
	
	<div>
		상품설명
		<div>"${item.item_description}</div>

	<!-- 반품/교환 규정 포함 -->
  		  <div class="item-policy title">반품/교환 규정</div>
   			 <div class="item-policy">
     		   <%@ include file="returnPolicy.jsp" %> <!-- 수정: include 유지 -->
  		  </div>
	</div>


</div>