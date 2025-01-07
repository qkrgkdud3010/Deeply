<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>자주 묻는 질문 (FAQ)</title>
<style>
/* FAQ 컨테이너 스타일 */
.faq-container {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
}

/* FAQ 헤더 */
.faq-header {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center; /* 수직 가운데 정렬 */
  align-items: center; /* 수평 가운데 정렬 */
  width: 100%; /* faq-item과 동일한 너비 */
  max-width: 1025px; /* faq-item과 동일한 최대 너비 */
  font-weight: 700;
  padding: 20px 40px;
  margin-top: 20px;
}

/* 제목 */
.faq-title {
  color: #000;
  text-align: center;
  font: 64px/1 Red Hat Display, sans-serif;
}

/* 1대1 문의 링크 */
.contact-link {
  margin-left: auto; /* 오른쪽 끝으로 이동 */
  color: #b0adad;
  font: 16px Manrope, sans-serif;
}

/* FAQ 항목 */
.faq-item {
  border-radius: 8px;
  background-color: #090909;
  display: flex;
  flex-direction: column;
  width: 100%;
  max-width: 1025px;
  color: #fff;
  padding: 20px;
  font: 600 24px/1 Inter, sans-serif;
  margin-top: 20px;
  cursor: pointer;
}

/* 아이콘 */
.faq-icon {
  width: 25px;
  margin-right: 10px;
  transition: transform 0.3s ease;
}

/* 질문 */
.faq-question {
  display: flex;
  align-items: center;
  gap: 10px;
}

/* 답변 */
.faq-answer {
  display: none; /* 기본적으로 숨김 */
  margin-top: 15px;
  padding: 10px;
  background-color: #333;
  border-radius: 8px;
  font-size: 16px;
  line-height: 1.5;
}

.faq-answer.visible {
  display: block;
}
</style>
</head>
<body>
<div class="faq-container">
  <!-- FAQ 헤더 -->
  <div class="faq-header">
    <h1 class="faq-title">자주 묻는 질문</h1>
    <a href="#contact" class="contact-link">1대1 문의하러가기</a>
  </div>

  <!-- FAQ 항목 1 -->
  <div class="faq-item">
    <div class="faq-question">
      <img
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/12b36863eb113cecbe74e8f24b9197734fb736dd08b58a5c542ce6cdc22a1f5c"
        alt="아이콘"
        class="faq-icon"
      />
      <h2>멤버십 구독 혜택은 무엇인가요?</h2>
    </div>
    <div class="faq-answer">
      <p>멤버십 구독 시 독점 콘텐츠, 할인 혜택, 이벤트 우선권 등을 누릴 수 있습니다.</p>
    </div>
  </div>

  <!-- FAQ 항목 2 -->
  <div class="faq-item">
    <div class="faq-question">
      <img
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/12b36863eb113cecbe74e8f24b9197734fb736dd08b58a5c542ce6cdc22a1f5c"
        alt="아이콘"
        class="faq-icon"
      />
      <h2>아티스트와의 소통은 어떻게 이루어지나요?</h2>
    </div>
    <div class="faq-answer">
      <p>플랫폼 내 메시징 시스템과 정기적인 라이브 Q&A 세션을 통해 소통할 수 있습니다.</p>
    </div>
  </div>

  <!-- FAQ 항목 3 -->
  <div class="faq-item">
    <div class="faq-question">
      <img
        src="https://cdn.builder.io/api/v1/image/assets/TEMP/12b36863eb113cecbe74e8f24b9197734fb736dd08b58a5c542ce6cdc22a1f5c"
        alt="아이콘"
        class="faq-icon"
      />
      <h2>배송은 며칠 정도 소요되나요?</h2>
    </div>
    <div class="faq-answer">
      <p>주문 후 3~5일 내에 배송됩니다. 지역에 따라 다소 차이가 있을 수 있습니다.</p>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", () => {
  const faqItems = document.querySelectorAll(".faq-item");

  faqItems.forEach((item) => {
    const question = item.querySelector(".faq-question");
    const answer = item.querySelector(".faq-answer");
    const icon = item.querySelector(".faq-icon");

    question.addEventListener("click", () => {
      const isVisible = answer.classList.contains("visible");

      // 모든 FAQ 초기화
      document.querySelectorAll(".faq-answer").forEach((ans) => ans.classList.remove("visible"));
      document.querySelectorAll(".faq-icon").forEach((ic) => {
        ic.src =
          "https://cdn.builder.io/api/v1/image/assets/TEMP/12b36863eb113cecbe74e8f24b9197734fb736dd08b58a5c542ce6cdc22a1f5c";
      });

      if (!isVisible) {
        answer.classList.add("visible");
        icon.src =
          "https://cdn.builder.io/api/v1/image/assets/TEMP/7b42bb8c3c2581d45372b7ca3d972196219c939457af4b9bd4e6a739575a970f";
      }
    });
  });
});
</script>
</body>
</html>
