<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>멤버십 영상 페이지</title>

    <style type="text/css">
    /***************************************************
     * 전역 스타일과 변수
     ***************************************************/
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
    /* 페이드인 애니메이션 */
    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /***************************************************
     * div-wrapper: 전체 컨테이너를 가운데 정렬
     ***************************************************/
    .div-wrapper {
      max-width: 1200px; 
      margin: 0 auto;
      padding: 40px 20px; 
      position: relative;
      background-color: #ffffff;
      overflow: hidden; 
    }

    /***************************************************
     * 제목들 (heading-4 / heading-5 / heading-6)
     ***************************************************/
    .heading-4,
    .heading-5,
    .heading-6 {
      margin-bottom: 20px;
      font-family: "Manrope-Bold", Helvetica;
      font-weight: 700;
      font-size: 38px;
      line-height: 1.3;
      color: #000000;
      white-space: nowrap; 
      position: static;
    }
    /* 가운데 정렬이 필요한 heading-6 */
    .heading-6 {
      text-align: center;
    }

    /***************************************************
     * 멤버십 페이지 바로가기(p 태그)
     ***************************************************/
    .p {
      margin: 10px 0;
      font-family: "Manrope-Bold", Helvetica;
      font-weight: 700;
      color: #b0adad;
      font-size: 24px;
      line-height: 36px;
      position: static;
    }

    /***************************************************
     * 업로드 버튼 (.spoiler-button-tag)
     ***************************************************/
    .spoiler-button-tag {
      display: inline-flex;
      flex-direction: row;
      align-items: center;
      gap: 8px;
      padding: 8px 16px;
      background-color: #000000;
      border-radius: 9999px;
      border: 1px solid var(--global-color-grey-60, #666);
      color: #fff;
      margin-bottom: 20px;
    }
    .frame-2 {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }
    .img-2 {
      width: 24px;
      height: 24px;
      object-fit: contain;
    }
    .spoiler {
      font-weight: 600;
      font-size: 14px;
      white-space: nowrap;
    }

    /***************************************************
     * sub-container: 가로 스크롤 영역
     ***************************************************/
    .sub-container {
      display: flex;
      gap: 30px;
      overflow-x: auto;
      padding: 10px 0;
      margin-bottom: 40px;
    }
    .sub-container::-webkit-scrollbar {
      height: 8px; 
    }
    .sub-container::-webkit-scrollbar-thumb {
      background: #ccc;
      border-radius: 4px;
    }

    /***************************************************
     * 카드 (.card)
     ***************************************************/
    .card {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      justify-content: flex-start;
      padding: 20px;
      flex: 0 0 auto; 
      min-width: 240px; 
      background-color: #1A1A1A;
      border-radius: 12px;
      border: 1px solid #e0e0e0; /* var(--black-15) */
      animation: fadeIn 0.8s ease-out;
      box-sizing: border-box;
      margin-bottom: -14px; 
    }

    /***************************************************
     * 카드 내부 (container)
     ***************************************************/
    .container {
      display: flex;
      flex-direction: column;
      gap: 5px;
      width: 100%;
      height: auto;
    }

    /***************************************************
     * 이미지 영역 (image-container)
     ***************************************************/
    .image-container {
      display: flex;
      flex: 1;
      gap: 5px;
      width: 100%;
    }
    .image {
      flex: 1; 
      object-fit: cover;
      border-radius: 8px;
    }

    /***************************************************
     * 카드 하단 내용 (.div)
     ***************************************************/
    .div {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-top: 8px;
      color: #ffffff; /* 텍스트 색상을 흰색으로 변경 */
    }

    /***************************************************
     * 제목 / 설명 등 (heading-3)
     ***************************************************/
    .heading-3 {
	  position: static;
	  font-family: "Manrope-SemiBold", Helvetica;
	  font-weight: 600;
	  font-size: 18px;
	  line-height: 27px;
	  color: #ffffff; /* 텍스트 색상을 흰색으로 변경 */
	  text-decoration: none;
	}

    </style>
</head>

<body>
  <div class="div-wrapper">
    <!-- 뉴진스 메인 타이틀 -->
    <h1 class="heading-6">뉴진스</h1>

    <!-- 멤버십 전용 영역 -->
    <h2 class="heading-5">멤버십 전용</h2>

    <!-- 영상 업로드 버튼 -->
    <div class="spoiler-button-tag">
      <div class="frame-2">
        <img class="img-2" src="img/add.svg" alt="업로드 아이콘" />
        <div class="span">
          <div class="spoiler">영상 업로드</div>
        </div>
      </div>
    </div>

    <!-- 멤버십 페이지 바로가기 -->
    <p class="p">멤버십 영상 페이지 바로가기 &gt;</p>

    <!-- DB에서 불러온 영상 목록 -->
    <h2 class="heading-4">DB에서 불러온 내 영상</h2>
    <div class="sub-container">
      <c:forEach var="video" items="${videos}">

        <div class="card">
          <div class="container">

            <div class="image-container">
              <!--
                  유튜브 링크이면 -> ID 추출 후 썸네일,
                  아니면 그대로 mediaUrl 사용
              -->
              <c:choose>
                
                <c:when test="${fn:contains(video.mediaUrl, 'youtube.com/watch?v=')}">
                  <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'v=')}"/>
                  <img class="image"
                       src="https://img.youtube.com/vi/${youtubeId}/0.jpg"
                       alt="유튜브 썸네일" />
                </c:when>

               
                <c:when test="${fn:contains(video.mediaUrl, 'youtu.be/')}">
                  <c:set var="youtubeId" value="${fn:substringAfter(video.mediaUrl, 'youtu.be/')}"/>
                  <img class="image"
                       src="https://img.youtube.com/vi/${youtubeId}/0.jpg"
                       alt="유튜브 썸네일" />
                </c:when>

               
                <c:otherwise>
                  <img class="image"
                       src="${video.mediaUrl}"
                       alt="업로드 미디어" />
                </c:otherwise>
              </c:choose>
            </div>

            <!-- 제목 표시 -->
            <div class="div" style="margin-top: 10px;">
              <div class="heading-3">${video.title}</div>
            </div>

            <!-- 설명 표시 -->
            <div class="div">
              <p>${video.description}</p>
            </div>
          </div>
        </div>

      </c:forEach>
    </div>
  </div>
</body>
</html>
