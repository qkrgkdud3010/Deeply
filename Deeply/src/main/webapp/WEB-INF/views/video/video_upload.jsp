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
            <!-- 제목 입력 -->
            <div class="title-container">
                <input type="text" name="title" maxlength="100"
                    placeholder="제목을 입력하세요" class="upload-title">
                <span class="char-limit">0/100</span>
            </div>

            <!-- 탭 버튼 -->
            <div class="tabs-container">
                <div class="tab-button active">
                    <span class="tab-icon"></span> 글
                </div>
                <div class="tab-button">
                    <span class="tab-icon"></span> 이미지 혹은 비디오
                </div>
                <div class="tab-button">
                    <span class="tab-icon"></span> 링크
                </div>
                <div class="tab-button">
                    <span class="tab-icon"></span> 폴
                </div>
            </div>

            <!-- 카테고리 선택 -->
            <div class="category-select">
                <div class="category-icon"></div>
                <span class="category-text">카테고리 선택</span>
            </div>

            <!-- 텍스트 입력 -->
            <div class="description-container">
                <textarea name="description" class="description-input"
                    placeholder="내용을 입력하세요"></textarea>
            </div>

            <!-- 기능 버튼 -->
            <div class="form-actions">
                <button type="button" class="btn-draft">Save Draft</button>
                <button type="submit" class="btn-post">Post</button>
            </div>
        </form>
    </section>
</div>
