<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/customjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/shop.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#item_price').keyup(function(){
 	   customNumberLocale($(this),false);    
	});
</script>


<div class="modify-main main-container">
	
	
	<div class="content-container">
    <div class="button page-action">
        <!-- 수정: modelAttribute="itemVO" 추가 -->
       
        <form:form modelAttribute="item" method="post" action="update" enctype="multipart/form-data">
            <div class="button form-actions">
		<input type="submit" value="수정" /> 
		<input type="button" value="취소" onclick="location.href='/item/list'" />
		
	</div>
            <ul>
                <li>
                    <c:if test="${item.filename != null}">
                    <button class="upload-btn" id="upload_btn">파일 업로드</button>
                    <input type="file" class="file-submit" name="upload" id="upload" multiple>
    				<img src="${pageContext.request.contextPath}/assets/upload/${item.filename}" class="items-img" alt="상품 이미지" />
					
					
					</c:if>
                    
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
                    <form:input type="number" min="1" max="9999999" id="item_price" path="item_price" placeholder="가격을 입력하세요." />
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
                <li>
                    <form:label path="item_description">상품 설명</form:label>
                    <c:if test="${!empty item.desc_photo1}">
                    <img src="${pageContext.request.contextPath}/assets/upload/${item.desc_photo1}" class="preview_photo1" alt="Preview 1">
                    <form:hidden path="desc_photo3" value="${item.desc_photo1}"/>
                    </c:if>
                    <c:if test="${empty item.desc_photo1}">
                    
                    </c:if>
                    <button class="upload-btn" id="desc_btn1">설명 사진1</button>
                    <c:if test="${!empty item.desc_photo2}">
                    <img src="${pageContext.request.contextPath}/assets/upload/${item.desc_photo2}" class="preview_photo2" alt="Preview 2">
                    <form:hidden path="desc_photo3" value="${item.desc_photo2}"/>
                    </c:if>
                    <button class="upload-btn" id="desc_btn2">설명 사진2</button>
                    <c:if test="${!empty item.desc_photo3}">
                    <img src="${pageContext.request.contextPath}/assets/upload/${item.desc_photo3}" class="preview_photo3" alt="Preview 3">
                    <form:hidden path="desc_photo3" value="${item.desc_photo3}"/>
                    </c:if>
                    <button class="upload-btn" id="desc_btn3">설명 사진3</button>
                    <input type="file" class="file-submit" id="desc_photo1" name="upload1">
                    <input type="file" class="file-submit" id="desc_photo2" name="upload2">
                    <input type="file" class="file-submit" id="desc_photo3" name="upload3">
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
