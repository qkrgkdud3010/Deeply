<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/assets/css/hy.css">
<div class="video-upload-content">
    <!-- 메인 타이틀 -->
    <section class="main-title">
        <h1>영상 업로드</h1>
    </section>

    <!-- 업로드 섹션 -->
    <section class="upload-section">
        <h2>영상 업로드</h2>
        <form action="/videos/upload" method="post" enctype="multipart/form-data">
            <!-- CSRF 토큰 -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <!-- 제목 입력 -->
            <div class="title-container">
                <input type="text" name="title" maxlength="100"
                    placeholder="제목을 입력하세요" class="upload-title">
                <span class="char-limit">0/100</span>
            </div>

            <!-- 탭 버튼 -->
            <div class="tabs-container">
                <div class="tab-button active" data-tab="text">
                    <span class="tab-icon"></span> 글
                </div>
                <div class="tab-button" data-tab="media">
                    <span class="tab-icon"></span> 이미지 혹은 비디오
                </div>
                <div class="tab-button" data-tab="link">
                    <span class="tab-icon"></span> 링크
                </div>
                <div class="tab-button" data-tab="poll">
                    <span class="tab-icon"></span> 폴
                </div>
            </div>

            <!-- 탭에 따른 콘텐츠 영역 -->
            <div class="tab-content" id="tab-content">
                <div class="tab-panel active" data-tab="text">
                    <textarea name="description" class="description-input"
                        placeholder="내용을 입력하세요"></textarea>
                </div>
                <div class="tab-panel" data-tab="media">
                    <input type="file" name="media" accept="image/*,video/*">
                </div>
                <div class="tab-panel" data-tab="link">
                    <input type="url" name="link" placeholder="링크를 입력하세요">
                </div>
                <div class="tab-panel" data-tab="poll">
                    <textarea name="poll-options" class="poll-input"
                        placeholder="폴 옵션을 입력하세요 (각 옵션은 줄바꿈으로 구분)"></textarea>
                </div>
            </div>

            <!-- 기능 버튼 -->
            <div class="form-actions">
                <button type="button" class="btn-draft">Save Draft</button>
                <button type="submit" class="btn-post">Post</button>
            </div>
        </form>
    </section>
</div>
<script src="${pageContext.request.contextPath}/assets/js/tabs.js" defer></script>
