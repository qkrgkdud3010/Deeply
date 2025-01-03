<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<div class="video-upload-content">
    <!-- 메인 타이틀 -->
    <section class="main-title">
        <h1>영상 업로드</h1>
    </section>

    <script type="text/javascript">
        function toggleDropdown() {
            const dropdown = document.getElementById('dropdown-menu');
            dropdown.classList.toggle('hidden');
        }

        function selectCategory(category) {
            document.getElementById('selected-category').innerText = category;
            toggleDropdown();
        }
    </script>

    <!-- 업로드 섹션 -->
    <section class="upload-section">
        <h2>영상 업로드</h2>
        <!-- 파일 업로드는 제거하므로, 일반 POST로 변경 -->
        <form action="/videos/upload" method="post">
            <!-- CSRF 토큰 -->
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />

            <!-- 제목 입력 -->
            <div class="title-container">
                <input type="text" name="title" maxlength="100"
                       placeholder="제목을 입력하세요" class="upload-title">
                <span class="char-limit">0/100</span>
            </div>

            <!-- 카테고리와 멤버십 여부 선택 -->
            <div class="selection-row">
                <!-- 카테고리 선택 (기존 디자인 유지) -->
                <div class="category-select" onclick="toggleDropdown()">
                    <div class="category-icon"></div>
                    <span id="selected-category" class="category-text">카테고리 선택</span>
                    <div id="dropdown-menu" class="dropdown-menu hidden">
                        <div class="dropdown-item" onclick="selectCategory('음악')">음악</div>
                        <div class="dropdown-item" onclick="selectCategory('교육')">교육</div>
                        <div class="dropdown-item" onclick="selectCategory('엔터테인먼트')">엔터테인먼트</div>
                        <div class="dropdown-item" onclick="selectCategory('스포츠')">스포츠</div>
                    </div>
                </div>

                <!-- 멤버십 여부 선택 -->
                <div class="membership-toggle">
                    <label for="isExclusive">
                        <input type="checkbox" id="isExclusive" name="isExclusive" value="1">
                        <span>멤버십 영상</span>
                    </label>
                </div>
            </div>

            <!-- 탭 버튼 (글, 이미지 혹은 비디오, 링크, 폴) -->
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
                <!-- 1) 글 탭 -->
                <div class="tab-panel active" data-tab="text">
                    <textarea name="description" class="description-input"
                              placeholder="내용을 입력하세요"></textarea>
                </div>

                <!-- 2) 이미지 혹은 비디오 (파일 업로드 제거, 대신 안내 문구만 남김) -->
                <div class="tab-panel" data-tab="media">
                    <!-- 파일 업로드 부분 제거 -->
                    <p>여기에 이미지 혹은 비디오 관련 안내나 추가 기능을 넣을 수 있습니다.</p>
                </div>

                <!-- 3) 링크 탭 (link -> mediaUrl로 변경) -->
                <div class="tab-panel" data-tab="link">
                    <input type="url" name="mediaUrl" placeholder="링크를 입력하세요">
                </div>

                <!-- 4) 폴 탭 -->
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
