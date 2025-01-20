<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hr2.css">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!-- 글상세 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/commu.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/videoAdapter.js"></script>
<div class="page-main">
    <!-- 작성자 정보 -->
    <div class="author-info">
        <img src="${pageContext.request.contextPath}/member/viewProfile?user_num=${artist.user_num}" width="100" height="100" class="foc-arti-photo">
        <span>${artist.group_name} ${artist.name}</span>
        <span>${artist.intro}</span>
    </div>
    <!-- 게시글 정보 -->
    <div class="post-title">
        <h3>${commu.c_title}</h3>
        <hr>
        <ul class="post-meta">
            <li class="post-date">
                <c:if test="${empty commu.c_update}">
                    ${commu.c_date}
                </c:if>
                <c:if test="${!empty commu.c_update}">
                    ${commu.c_update}
                </c:if>
            </li>
        </ul>
    </div>
    
    <!-- 게시글 내용 -->
    <div class="post-content">
        ${commu.c_content}
    </div>

    <!-- 버튼 -->
    <div class="post-buttons">
        <input type="button" class="grey-btn" value="이전으로" onclick="location.href='list'">
        <c:if test="${!empty principal && principal.memberVO.user_num == commu.user_num}">
            <input type="button" value="글 수정" class="grey-btn" style="font-align:right;" onclick="location.href='update?c_num=${commu.c_num}'">
            <input type="button" value="글 삭제" id="delete_btn">
            <script type="text/javascript">
                const delete_btn = document.getElementById('delete_btn');
                delete_btn.onclick = function () {
                    const choice = confirm('삭제하시겠습니까?');
                    if (choice) {
                        location.replace('delete?c_num=${commu.c_num}');
                    }
                };
            </script>
        </c:if>
    </div>

    <hr size="1" width="100%">
    
    <!-- 댓글 목록 출력 -->
    <div id="output"></div>
    <div id="loading" style="display:none;">
        <img src="${pageContext.request.contextPath}/assets/images/loading.gif" width="30" height="30">
    </div>
    <div class="paging-button" style="display:none;">
        <input type="button" value="더보기">
    </div>

    <!-- 댓글 UI -->
    <div class="reply-section">
        <span class="re-c_title"></span>
        <form id="cre_form">
            <input type="hidden" id="csrfHeaderName" value="${_csrf.headerName}">
            <input type="hidden" id="csrfTokenValue" value="${_csrf.token}">
            <input type="hidden" name="c_num" value="${commu.c_num}" id="c_num">
            <textarea rows="3" cols="50" name="cre_content" id="cre_content" class="crep-content" <c:if test="${empty principal}">disabled="disabled"</c:if>><c:if test="${empty principal}">로그인해야 작성할 수 있습니다.</c:if></textarea>
            <c:if test="${!empty principal}">
                <div id="cre_first">
                    <span class="letter-count">300/300</span>
                </div>
                <div id="cre_second" class="align-right">
                    <input type="submit" value="댓글 등록">
                </div>
            </c:if>
        </form>
    </div>

</div>