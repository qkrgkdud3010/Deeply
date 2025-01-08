<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<div class="modify-main main-container">
	
	
	<div class="content-container">
    <div class="button page-action">
        <!-- 수정: modelAttribute="itemVO" 추가 -->
        <form:form modelAttribute="itemVO" method="post" action="update" enctype="multipart/form-data">
            <div class="button form-actions">
		<input type="submit" value="수정" /> 
		<input type="button" value="취소" onclick="location.href='/item/list'" />
	</div>
            <ul>
                <li>
                    <form:label path="upload">파일 업로드</form:label>
                    <input type="file" name="upload" id="upload">
                   
                    
                    
                    
                    
                </li>
                <li>
                    <form:label path="item_name">상품명</form:label>
                    <!-- 수정: path="item_name" 추가 -->
                    <form:input type="text" maxlength="20" path="item_name" />
                    <form:errors path="item_name" cssClass="error-color" />
                </li>
                <li>
                    <form:label path="item_price">가격</form:label>
                    <!-- 수정: path="item_price" 추가 -->
                    <form:input type="number" min="1" max="9999999" path="item_price" placeholder="가격을 입력하세요." />
                    <form:errors path="item_price" cssClass="error-color" />
                </li>
                <li>
                    <form:label path="item_stock">판매 수량</form:label>
                    <!-- 수정: path="item_stock" 추가 -->
                    <form:input type="number" min="1" max="9999999" path="item_stock" placeholder="판매 수량을 입력하세요." />
                    <form:errors path="item_stock" cssClass="error-color" />
                </li>
                <li>
                    <form:label path="item_description">상품 설명</form:label>
                    <!-- 수정: path="item_description" 추가 -->
                    <form:textarea path="item_description" placeholder="상품 설명을 입력하세요."></form:textarea>
                    <form:errors path="item_description" cssClass="error-color" />
                </li>
            </ul>
        </form:form>
    </div>

    <!-- 반품/교환 규정 포함 -->
    <div class="item-policy title">반품/교환 규정</div>
    <div class="item-policy">
        <%@ include file="returnPolicy.jsp" %> <!-- 수정: include 유지 -->
    </div>
    
    </div>
</div>