<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/globals.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleguide.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    <title>자주 묻는 질문 (FAQ)</title>
    <style>
      /* FAQ 답변 숨김 기본 스타일 */
      .answer {
        padding: 10px 20px;
        background-color: #f9f9f9;
        border-top: 1px solid #ccc;
      }

      .hidden {
        display: none;
      }

      .q {
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="screen">
      <div class="div">
        <!-- 네비게이션 바 -->
        <div class="navbar">
          <img class="image" src="${pageContext.request.contextPath}/assets/img/image-30.png" alt="Logo" />
          <div class="text-wrapper"><%= session.getAttribute("nickname") != null ? session.getAttribute("nickname") + "님" : "회원" %></div>
          <div class="text-wrapper-2">아티스트</div>
          <div class="text-wrapper-3">SHOP</div>
          <div class="text-wrapper-4">로그아웃</div>
          <img class="face" src="${pageContext.request.contextPath}/assets/img/face-1.png" alt="User Face" />
          <div class="text-wrapper-5">커뮤니티</div>
        </div>
        
        <!-- FAQ 섹션 -->
        <div class="overlap">
          <div class="FAQ">
            <div class="text-wrapper-23">자주 묻는 질문</div>
            <div class="questions">
              <!-- 질문 1 -->
              <div class="q">
                <div class="overlap-group">
                  <div class="rectangle"></div>
                  <div class="text">
                    <div class="div-wrapper">
                      <div class="text-wrapper-24">멤버십 구독 혜택은 무엇인가요?</div>
                    </div>
                    <img class="vector toggle-icon" src="${pageContext.request.contextPath}/assets/img/vector-2.svg" alt="Toggle Icon" />
                  </div>
                </div>
                <div class="answer hidden">
                  <p>멤버십 구독을 통해 다양한 혜택을 누리실 수 있습니다. 예를 들어, 독점 콘텐츠 접근, 할인 혜택, 우선 구매권 등이 포함됩니다.</p>
                </div>
              </div>
              
              <!-- 질문 2 -->
              <div class="q">
                <div class="overlap-group">
                  <div class="rectangle"></div>
                  <div class="text">
                    <div class="div-wrapper">
                      <div class="text-wrapper-24">아티스트와의 소통은 어떻게 이루어지나요?</div>
                    </div>
                    <img class="vector toggle-icon" src="${pageContext.request.contextPath}/assets/img/vector-2.svg" alt="Toggle Icon" />
                  </div>
                </div>
                <div class="answer hidden">
                  <p>아티스트와의 소통은 플랫폼 내 메시징 시스템을 통해 이루어집니다. 또한, 정기적인 라이브 Q&A 세션도 제공됩니다.</p>
                </div>
              </div>
              
              <!-- 질문 3 -->
              <div class="q">
                <div class="overlap-group">
                  <div class="rectangle"></div>
                  <div class="text">
                    <div class="div-wrapper">
                      <div class="text-wrapper-24">배송은 며칠 정도 소요되나요?</div>
                    </div>
                    <img class="vector toggle-icon" src="${pageContext.request.contextPath}/assets/img/vector-2.svg" alt="Toggle Icon" />
                  </div>
                </div>
                <div class="answer hidden">
                  <p>배송은 보통 주문 후 3-5일 내에 완료됩니다. 지역에 따라 약간의 차이가 있을 수 있습니다.</p>
                </div>
              </div>
              
              <!-- 질문 4 -->
              <div class="q">
                <div class="overlap-group">
                  <div class="rectangle"></div>
                  <div class="text">
                    <div class="div-wrapper">
                      <div class="text-wrapper-24">예매 후 티켓 확인은 어떻게 하나요?</div>
                    </div>
                    <img class="vector toggle-icon" src="${pageContext.request.contextPath}/assets/img/vector-2.svg" alt="Toggle Icon" />
                  </div>
                </div>
                <div class="answer hidden">
                  <p>예매 후, 등록하신 이메일로 티켓 확인 링크가 전송됩니다. 또한, 마이페이지에서도 티켓 상태를 확인하실 수 있습니다.</p>
                </div>
              </div>
              
              <!-- 질문 5 -->
              <div class="q">
                <div class="overlap-group">
                  <div class="rectangle"></div>
                  <div class="text">
                    <div class="div-wrapper">
                      <div class="text-wrapper-24">응모 후 당첨 확인은 어디서 하나요?</div>
                    </div>
                    <img class="vector toggle-icon" src="${pageContext.request.contextPath}/assets/img/vector-2.svg" alt="Toggle Icon" />
                  </div>
                </div>
                <div class="answer hidden">
                  <p>응모 후, 당첨 여부는 등록하신 이메일과 마이페이지에서 확인하실 수 있습니다. 또한, 당첨 시 개별 연락을 드립니다.</p>
                </div>
              </div>
            </div>
          </div>
          
          <!-- 1대1 문의하기 버튼 -->
          <div class="heading">1대1 문의하러가기</div>
        </div>
        
        <!-- (필요 시) 게시글 작성 필드 -->
        <div class="create-post-field">
          <div class="title">제목</div>
          <div class="text-wrapper-28">0/300</div>
        </div>
      </div>
    </div>
    
    <!-- FAQ 토글 스크립트 -->
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        const toggleIcons = document.querySelectorAll('.toggle-icon');
        
        toggleIcons.forEach(icon => {
          icon.addEventListener('click', function() {
            const answer = this.closest('.q').querySelector('.answer');
            if (answer.classList.contains('hidden')) {
              answer.classList.remove('hidden');
              this.src = '${pageContext.request.contextPath}/assets/img/vector-up.svg'; // 위로 향하는 화살표 이미지로 변경
            } else {
              answer.classList.add('hidden');
              this.src = '${pageContext.request.contextPath}/assets/img/vector-2.svg'; // 아래로 향하는 화살표 이미지로 변경
            }
          });
        });
      });
    </script>
  </body>
</html>
