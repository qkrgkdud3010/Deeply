<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 그룹별 영상 페이지 -->
<div class="page-container">

    <!-- 동적으로 그룹명을 표시하도록 변경 -->
    <h1 class="main-heading">${groupName}</h1>
    
    <div class="heading-container">
        <h2 class="section-heading">멤버십 전용</h2>
        <div class="right-container">
            <div class="upload-button">영상 업로드</div>
            <p>멤버십 영상 페이지 바로가기 &gt;</p>
        </div>
    </div>

    <!-- 첫 번째 영상 섹션 -->
    <div class="video-section">
        <div class="scroll-container" id="scrollContainer1">
            <div class="scroll-track" id="scrollTrack1">

                <!-- 첫 번째 forEach: 최대 7개만 출력하는 예시 -->
                <c:forEach var="video" items="${videos}" varStatus="status">
                    <c:if test="${status.index < 7}">
                        <!-- 유튜브 썸네일 처리 로직 -->
                        <c:choose>
                            <c:when test="${fn:contains(video.mediaUrl, 'youtube.com/watch?v=')}">
                                <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'v=')}" />
                                <c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
                            </c:when>
                            <c:when test="${fn:contains(video.mediaUrl, 'youtu.be/')}">
                                <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'youtu.be/')}" />
                                <c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="thumbnailUrl" value="${video.mediaUrl}" />
                            </c:otherwise>
                        </c:choose>

                        <div class="video-card">
                            <img src="${thumbnailUrl}" alt="썸네일" />
                            <div class="video-card-title">${video.title}</div>
                            <div class="video-card-description">${video.description}</div>
                        </div>
                    </c:if>
                </c:forEach>

                <div class="more-button">카테고리 영상 더보기</div>
            </div>
        </div>
        <div class="scroll-button scroll-left" id="scrollLeft1">&lt;</div>
        <div class="scroll-button scroll-right" id="scrollRight1">&gt;</div>
    </div>

    <h2 class="section-heading">DB에서 불러온 내 영상</h2>

    <!-- 두 번째 영상 섹션 -->
    <div class="video-section">
        <div class="scroll-container" id="scrollContainer2">
            <div class="scroll-track" id="scrollTrack2">
                <c:forEach var="video" items="${videos}">
                    <c:choose>
                        <c:when test="${fn:contains(video.mediaUrl, 'youtube.com/watch?v=')}">
                            <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'v=')}" />
                            <c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
                        </c:when>
                        <c:when test="${fn:contains(video.mediaUrl, 'youtu.be/')}">
                            <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'youtu.be/')}" />
                            <c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="thumbnailUrl" value="${video.mediaUrl}" />
                        </c:otherwise>
                    </c:choose>
                    <div class="video-card">
                        <img src="${thumbnailUrl}" alt="썸네일" />
                        <div class="video-card-title">${video.title}</div>
                        <div class="video-card-description">${video.description}</div>
                    </div>
                </c:forEach>
                <div class="more-button">카테고리 영상 더보기</div>
            </div>
        </div>
        <div class="scroll-button scroll-left" id="scrollLeft2">&lt;</div>
        <div class="scroll-button scroll-right" id="scrollRight2">&gt;</div>
    </div>

</div>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    const sections = [
        { container: 'scrollContainer1', left: 'scrollLeft1', right: 'scrollRight1' },
        { container: 'scrollContainer2', left: 'scrollLeft2', right: 'scrollRight2' },
    ];

    sections.forEach((section) => {
        const scrollContainer = document.getElementById(section.container);
        const leftButton = document.getElementById(section.left);
        const rightButton = document.getElementById(section.right);

        leftButton.addEventListener('click', () => {
            scrollContainer.scrollBy({ left: -330, behavior: 'smooth' });
        });

        rightButton.addEventListener('click', () => {
            scrollContainer.scrollBy({ left: 330, behavior: 'smooth' });
        });

        function updateButtons() {
            leftButton.style.display = scrollContainer.scrollLeft > 0 ? 'flex' : 'none';
            rightButton.style.display =
                scrollContainer.scrollLeft < scrollContainer.scrollWidth - scrollContainer.clientWidth
                    ? 'flex'
                    : 'none';
        }

        scrollContainer.addEventListener('scroll', updateButtons);
        updateButtons();
    });
});
</script>
