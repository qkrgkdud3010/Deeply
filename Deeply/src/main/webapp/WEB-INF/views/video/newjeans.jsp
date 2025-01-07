<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>멤버십 영상 페이지</title>
<style>
/* 초기화 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: "Manrope", "Inter", sans-serif;
	background-color: #ffffff;
	color: #000;
}

/* 전체 페이지를 감싸는 컨테이너 */
.page-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 40px 20px;
	background-color: #ffffff;
}

/* 제목 및 섹션 헤딩 */
.main-heading{
	text-align: center; /* 텍스트 가운데 정렬 */
	margin-bottom: 20px;
	font-family: "Manrope-Bold", Helvetica;
	font-weight: 700;
	font-size: 38px;
	color: #000000;
}

.section-heading {
  display: flex; /* Flexbox 적용 */
  justify-content: space-between; /* 제목과 오른쪽 요소를 양쪽 끝으로 정렬 */
  align-items: center; /* 수직 정렬 */
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 20px;
  padding: 10px 0; /* 간격 추가 */
}

.right-container {
  display: flex;
  align-items: center;
  gap: 16px; /* 두 요소 간 간격 */
}

/* 업로드 버튼 스타일 */
.upload-button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 16px;
  background-color: #000;
  border-radius: 9999px;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
}

/* 멤버십 영상 페이지 바로가기 텍스트 스타일 */
.right-container p {
  margin: 0;
  color: #555;
  font-size: 16px;
  font-weight: normal;
  cursor: pointer;
}

/* 영상 리스트 컨테이너 */
.video-section {
	position: relative;
	width: 100%;
	height: 328px;
	margin-bottom: 40px;
}

/* 스크롤 가능한 컨테이너 */
.scroll-container {
	width: 100%;
	height: 100%;
	overflow-x: auto; /* 가로 스크롤 활성화 */
	overflow-y: hidden; /* 세로 스크롤 숨기기 */
	white-space: nowrap; /* 줄 바꿈 방지 */
	position: relative;
	scroll-behavior: smooth; /* 부드러운 스크롤 */
}

/* 스크롤바 숨기기 (웹킷 브라우저용) */
.scroll-container::-webkit-scrollbar {
	display: none;
}

/* 카드들이 배치되는 트랙 */
.scroll-track {
	display: flex;
	gap: 30px;
	height: 100%;
	/* transition: transform 0.3s ease; */ /* 필요 없을 경우 주석 처리 */
}

/* 각 동영상 카드 */
.video-card {
	flex: 0 0 300px; /* 고정된 크기 */
	min-width: 300px;
	height: 100%;
	padding: 20px;
	background-color: #1A1A1A;
	border-radius: 12px;
	border: 1px solid #e0e0e0;
	display: flex;
	flex-direction: column;
}

.video-card img {
	width: 100%;
	height: auto;
	object-fit: cover;
	border-radius: 8px;
}

.video-card-title {
	margin-top: 10px;
	font-family: "Manrope-SemiBold", Helvetica;
	font-weight: 600;
	font-size: 18px;
	color: #fff;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; /* 긴 제목 처리 */
}

.video-card-description {
	margin-top: 5px;
	color: #ccc;
	font-size: 14px;
}

/* "더보기" 버튼 */
.more-button {
	flex: 0 0 200px;
	background-color: #333;
	color: #fff;
	border-radius: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

.more-button:hover {
	background-color: #555;
}

/* 스크롤 버튼 */
.scroll-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 48px;
	height: 48px;
	background-color: #000;
	color: #fff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	cursor: pointer;
	opacity: 0.7;
	z-index: 10;
}

.scroll-button:hover {
	opacity: 1;
}

.scroll-left {
	left: 10px; /* 왼쪽 버튼 위치 수정 */
}

.scroll-right {
	right: 10px; /* 오른쪽 버튼 위치 수정 */
}

/* 반응형 디자인 (선택 사항) */
@media ( max-width : 1400px) {
	.video-section {
		width: 100%;
	}
	.scroll-left {
		left: 5px;
	}
	.scroll-right {
		right: 5px;
	}
}
</style>
</head>
<body>

	<div class="page-container">
		<h1 class="main-heading">뉴진스</h1>
		<h2 class="section-heading">
			멤버십 전용
			<div class="right-container">
				<div class="upload-button">영상 업로드</div>
				<p>멤버십 영상 페이지 바로가기 &gt;</p>
			</div>
		</h2>
		<h2 class="section-heading">DB에서 불러온 내 영상</h2>

		<!-- 영상 섹션 -->
		<div class="video-section">
			<!-- 스크롤 가능한 컨테이너 -->
			<div class="scroll-container" id="scrollContainer">
				<div class="scroll-track" id="scrollTrack">
					<!-- 동영상 카드 반복 -->
					<c:forEach var="video" items="${videos}">
						<!-- 썸네일 URL 설정 -->
						<c:choose>
							<c:when
								test="${fn:contains(video.mediaUrl, 'youtube.com/watch?v=')}">
								<c:set var="youtubeId"
									value="${fn:substringAfter(video.mediaUrl, 'v=')}" />
								<c:set var="thumbnailUrl"
									value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
							</c:when>
							<c:when test="${fn:contains(video.mediaUrl, 'youtu.be/')}">
								<c:set var="youtubeId"
									value="${fn:substringAfter(video.mediaUrl, 'youtu.be/')}" />
								<c:set var="thumbnailUrl"
									value="https://img.youtube.com/vi/${youtubeId}/0.jpg" />
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
					<!-- 더보기 버튼 -->
					<div class="more-button">카테고리 영상 더보기</div>
				</div>
			</div>

			<!-- 왼쪽 버튼 -->
			<div class="scroll-button scroll-left" id="scrollLeft">&lt;</div>

			<!-- 오른쪽 버튼 -->
			<div class="scroll-button scroll-right" id="scrollRight">&gt;</div>
		</div>
	</div>

	<script>
    document.addEventListener('DOMContentLoaded', () => {
      const scrollContainer = document.getElementById('scrollContainer');
      const leftButton = document.getElementById('scrollLeft');
      const rightButton = document.getElementById('scrollRight');

      leftButton.addEventListener('click', () => {
        console.log('슬라이드 왼쪽 클릭됨');
        scrollContainer.scrollBy({ left: -330, behavior: 'smooth' });
      });

      rightButton.addEventListener('click', () => {
        console.log('슬라이드 오른쪽 클릭됨');
        scrollContainer.scrollBy({ left: 330, behavior: 'smooth' });
      });

      // 추가: 버튼 비활성화 상태 관리 (선택 사항)
      function updateButtons() {
        leftButton.style.display = scrollContainer.scrollLeft > 0 ? 'flex' : 'none';
        rightButton.style.display = scrollContainer.scrollLeft < (scrollContainer.scrollWidth - scrollContainer.clientWidth) ? 'flex' : 'none';
      }

      // 초기 버튼 상태 설정
      window.onload = () => {
        updateButtons();
      };

      // 스크롤 시 버튼 상태 업데이트
      scrollContainer.addEventListener('scroll', updateButtons);
    });
  </script>
</body>
</html>
