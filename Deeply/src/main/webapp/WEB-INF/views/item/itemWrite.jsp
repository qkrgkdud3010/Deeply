<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    let result = '${result}';
    if (result == 'success') {
        alert('글 등록이 완료되었습니다.');
    }
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/customjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/shop.js"></script>
<script type="text/javascript">
	$(function(){
		$('#item_description').summernote({
	        height: 300
	    });
	});
</script>

<div class="write-main main-container">
	
	
	<div class="content-container">
    <div class="button page-action">
        <!-- 수정: modelAttribute="itemVO" 추가 -->
        <form:form modelAttribute="itemVO" method="post" action="write" id="item_writeForm" enctype="multipart/form-data">
            <div class="button form-actions">
		<!-- 수정: type="submit"으로 변경 -->
		<input type="submit" value="등록" id="item_writeSubmit"/> <input type="button" value="취소" onclick="location.href='/item/main'" />
	</div>
            <ul>
                <li>
                    <form:label path="upload">파일 업로드</form:label>
                    <!-- 수정: path 속성 추가 -->
                    <button class="upload-btn" id="upload_btn">파일 업로드</button>
                    <input type="file" class="file-submit" name="upload" id="upload" multiple>
                    <form:errors path="upload" cssClass="error-color" />
    				<img src="" class="items-img" alt="상품 이미지" />
                </li>
                <li>
                    <form:label path="item_name">상품명</form:label>
                    <!-- 수정: path="item_name" 추가 -->
                    <form:input type="text" maxlength="20" path="item_name" placeholder="상품명을 입력하세요." />
                    <form:errors path="item_name" cssClass="error-color" />
                </li>
                <li>
                    <form:label path="item_name">상품 등급</form:label>
                    <!-- 수정: path="item_name" 추가 -->
                    <button class="item-premium-btn" data-num="0">일반 상품</button>
                    <button class="item-premium-btn" data-num="1">프리미엄 상품</button>
                    <form:hidden path="category" id="category_val"/>
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
                    <form:textarea path="item_description" placeholder="상품 설명을 입력하세요."/>
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
