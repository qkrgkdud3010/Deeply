<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/artistPage.js"></script>
<sec:authorize access="isAuthenticated()"><sec:authentication property="principal" var="principal" /></sec:authorize>


<div class="artist-main background-black">
	<form:form modelAttribute="vo" action="detail?artist_num=${vo.group_num}" id="modify_artist" enctype="multipart/form-data">
	<div class="a-mainpic align-center">
		<img class="img-previewer" id="previewImage">
		<button class="amainpic-select bold-title">이미지 수정</button>
		<input type="file" name="group_photo" id="group_photo">
		
	</div>
	<div class="artist-detail">
		<div class="vertical-center">
			<div class="width-80">
				<div class="font-white bold-title vertical-center font-2">
					<form:label path="fandom_name">팬덤명</form:label><form:input path="fandom_name"/>	
				</div>
				<div class="font-white bold-title vertical-center font-2">
					<form:label path="fandom_name">아티스트(그룹)명</form:label><form:input path="group_name"/>
				</div>
			</div>
			<div class="width-20">
				<c:if test="${empty principal.artistVO || principal.artistVO.group_name != vo.group_name}">
					<hr class="premium-hr">
					<div class="premium-btn font-white bold-title align-center">팔로우 하기</div>
					<hr class="premium-hr">
				</c:if>
			</div>
			
		</div>
		<div class="a-desc font-white">
			<div><form:label class="bold-title font-2" path="intro_desc">아티스트 상세 정보</form:label></div>
			<div><form:textarea path="intro_desc"/></div>
		</div>
	</div>
	<div class="modify-submit align-center">
	<form:button class="modify-submit-btn">수정</form:button>
	</div>
	</form:form>
</div>
