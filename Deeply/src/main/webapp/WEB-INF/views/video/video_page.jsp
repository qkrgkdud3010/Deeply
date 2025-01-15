<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
/* 모든 CSS 스타일을 여기에 포함합니다 */
.youtube-frame {
    border: none; /* 기본 테두리 제거 */
    border-radius: 15px; /* 둥근 모서리 */
    width: 100%;
    height: 600px;
}

.post-container {
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 3px 14px rgba(0, 0, 0, 0.05);
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: start;
    width: 80%;
    padding: 20px 30px 149px;
    font-family: 'Noto Sans', sans-serif;
    margin: 0 auto;
}

.title {
    font-size: 24px;
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 20px;
}

.reply-section {
    width: 100%;
    border-radius: 6px;
    border: 1px solid #d1d5db;
}

/* 나머지 스타일은 동일하게 유지 */
.reply-input {
    height: 200px;
    align-self: stretch;
    display: flex;
    padding: 11px 0 0;
    flex-direction: column;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.reply-placeholder {
    color: #6b7280;
    font-size: 13px;
    font-weight: 400;
    margin: 0 0 0 18px;
}

.reply-input:focus, .reply-input:focus-within {
    outline: none;
    border-color: #d1d5db;
    box-shadow: 0 0 0 2px #d1d5db;
    border-radius: 6px;
}

.action-bar {
    border-radius: 0 0 6px 6px;
    background: #f3f4f6;
    display: flex;
    margin-top: 0px;
    width: 100%;
    flex-direction: column;
    font-size: 14px;
    color: #fff;
    font-weight: 700;
    padding: 0 12px 9px 80px;
}

.divider {
    background-color: #d1d5db;
    align-self: center;
    width: 600px;
    max-width: 100%;
    height: 1px;
    border: 1px solid rgba(209, 213, 219, 1);
}

.post-button {
    border-radius: 6px;
    background-color: #000;
    align-self: end;
    display: flex;
    margin-top: 8px;
    gap: 18px;
    padding: 7px 9px 7px 21px;
    cursor: pointer;
}

.post-button:hover {
    background-color: #333;
}

.post-icon {
    width: 16px;
    height: 16px;
    aspect-ratio: 1;
    object-fit: contain;
}

.separator {
    align-self: center;
    margin-top: 15px;
    width: 641px;
    max-width: 100%;
    height: 1px;
    border: 1px solid #e3e3e3;
}

.user-info {
    display: flex;
    width: 272px;
    max-width: 100%;
    gap: 20px;
    justify-content: space-between;
    margin: 20px 0 0 18px;
}

.user-meta {
    display: flex;
    align-items: center;
    gap: 8px;
}

.avatar {
    aspect-ratio: 1;
    object-fit: contain;
    width: 32px;
    border-radius: 11px;
}

.username {
    color: #1f2937;
    font-size: 12px;
    font-weight: 600;
    margin: auto 0;
}

.timestamp {
    color: #6b7280;
    font-size: 10px;
    font-weight: 400;
    margin: auto 0;
}

.thread-container {
    display: flex;
    margin-left: 33px;
    gap: 19px;
    flex-wrap: wrap;
}

.thread-line {
    background-color: #e5e7eb;
    width: 2px;
    height: 174px;
    border: 2px solid rgba(229, 231, 235, 1);
}

.post-content {
    align-self: start;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    flex-basis: 0;
}

.post-text {
    color: #1f2937;
    font-size: 13px;
    font-weight: 400;
}

.interaction-bar {
    display: flex;
    gap: 20px;
    font-size: 12px;
    color: #4b5563;
    font-weight: 600;
    margin: 16px 0 -30px 80px;
}

.action-button {
    display: flex;
    gap: 6px;
    align-items: center;
    cursor: pointer;
}

.action-button:hover {
    text-decoration: underline;
}

.comments-list {
    margin-top: 20px;
    width: 100%;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 6px;
}

.comment {
    border-bottom: 1px solid #e3e3e3;
    padding: 10px 0;
}

.comment:last-child {
    border-bottom: none;
}

.comment-text {
    margin: 5px 0 0 0;
    font-size: 14px;
    color: #333;
}
</style>

<div class="post-container">
    <!-- 제목 섹션 -->
    <div class="title">${title}</div>

    <!-- 유튜브 프레임 -->
    <iframe src="${youtubeLink}?autoplay=1&mute=1" class="youtube-frame"
        allow="autoplay; fullscreen"></iframe>

    <!-- 댓글 입력 섹션 -->
    <div class="reply-section">
        <div class="reply-input" role="textbox" tabindex="0"
            aria-label="댓글을 입력하세요..." contenteditable="true">
        </div>
        <div class="action-bar">
            <div class="divider"></div>
            <div class="post-button" role="button" tabindex="0"
                onclick="submitReply()">
                <div>POST</div>
                <img
                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/34589a6e18af93eeda25abd08e3bdb591479aeeac632ec925a6b974cb8722066?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450"
                    class="post-icon" alt="Post Icon" />
            </div>
        </div>
    </div>
    
    <!-- 구분선 -->
    <div class="separator"></div>
    
    <!-- 사용자 정보 섹션 -->
    <div class="user-info">
        <div class="user-meta">
            <img
                src="https://cdn.builder.io/api/v1/image/assets/TEMP/53eaa26f84ec76d03c516471430ad2cd3bcdad1e5edd32a44225a107e88f3a47?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450"
                class="avatar" alt="Benny Goodman's profile picture" />
            <div class="username">Benny Goodman</div>
            <div class="timestamp">10 min ago</div>
        </div>
    </div>

    <!-- 스레드 컨텐츠 -->
    <div class="thread-container">
        <div class="thread-line"></div>
        <div class="post-content">
            <p class="post-text">A Love Supreme is an album by American jazz
                saxophonist John Coltrane. He recorded it in one session on December
                9, 1964, at Van Gelder Studio in Englewood Cliffs.</p>
            <div class="interaction-bar">
                <!-- Comment Icon and Text -->
                <div class="action-button" role="button" tabindex="0"
                    onclick="replyToPost()">
                    <img
                        src="${pageContext.request.contextPath}/assets/images/comment.svg"
                        class="post-icon" alt="Comment Icon">
                    <div>Reply</div>
                </div>

                <!-- Boost Icon and Text -->
                <div class="action-button" role="button" tabindex="0"
                    onclick="boostPost()">
                    <img
                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/a2792805d54f608f2ffd8a4e021264f6b7d2f11455a059cfab9a9e0183cf3782?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450"
                        class="post-icon" alt="Boost Icon">
                    <div>Boost</div>
                </div>

                <!-- Like Icon and Text -->
                <div class="action-button" role="button" tabindex="0"
                    onclick="likePost()">
                    <img
                        src="${pageContext.request.contextPath}/assets/images/star.svg"
                        class="post-icon" alt="Like Icon">
                    <div>Like</div>
                </div>

                <!-- More Icon and Text -->
                <div class="action-button" role="button" tabindex="0"
                    onclick="moreOptions()">
                    <img
                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/969b6a12fe21c1d1769e8ed4b2ff5b28f481984b7f0b46d426588e1a95cdf523?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450"
                        class="post-icon" alt="More Options Icon">
                    <div>More</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script>

</script>
