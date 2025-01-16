<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  -->
<script
	src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>

<div class="payment-1">
	<hr>
	<h2>결제 방식</h2>
	<form>
		<div style="display:none;">
			<label for="usePoints">사용할 포인트: </label> <input type="number"
				step="1000" id="usePoints" value="0" min="0" /> 원
		</div>
		<h4>주의사항</h4>
		
		<h5>- 무통장 입금시 이체실수에는 책임지지 않습니다.</h5>
		<h5>- 체결 후 결제 정보 변경은 불가능하며 분할 납부 변경은 카드사 문의 바랍니다. 단, 카드사별 정책에 따라
			분할 납부 변경 시 수수료가 발생할 수 있습니다.</h5>
		<h4>주문 정보</h4>
		<div class="payment-2">
			<h2>합계금액</h2>
<div id="payment-info" data-user-num="${memberVO.user_num}"></div>
			<div style="width: 300px; display:none;">
			
				<div style="float: left;" id="originalPrice">${payPrice}원</div>
			</div>

			<p style="clear: both; display:none;">
				사용한 포인트: <span id="usedPoints">0</span> 원
			</p>
			<p style="clear: both;">
				최종 결제 금액: <span id="finalPrice">${payPrice}</span> 원
			</p>


		</div>
		<div class="submit-1" >결제하기</div>
	</form>
</div>

<script>

var csrfToken = $('meta[name="_csrf"]').attr('content');
var csrfHeader = $('meta[name="_csrf_header"]').attr('content');
const userNum = parseInt(document.querySelector("#payment-info").getAttribute("data-user-num"));
console.log(userNum);  // 제대로 값이 출력되는지 확인

	document
			.getElementById('usePoints')
			.addEventListener(
					'input',
					function() {
						// 기본 결제 금액과 포인트 입력값을 가져옵니다.
						const originalPrice = parseInt(document
								.getElementById('originalPrice').textContent
								.replace("원", "").trim());
						let usePoints = parseInt(document
								.getElementById('usePoints').value);

						// 포인트가 기본 결제 금액을 넘지 않도록 제한
						if (usePoints > originalPrice) {
							usePoints = originalPrice; // 포인트를 결제 금액 이상으로 입력하지 못하게 함
							document.getElementById('usePoints').value = usePoints;
							alert("포인트는 결제 금액을 넘을 수 없습니다.");
						}

						// 최종 결제 금액 계산 (기본 금액에서 사용한 포인트 차감)
						const finalPrice = originalPrice - usePoints;

						// 최종 결제 금액과 사용 포인트를 업데이트
						document.getElementById('finalPrice').textContent = finalPrice;
						document.getElementById('usedPoints').textContent = usePoints;
					});

	document.querySelector('.submit-1').addEventListener('click', async function() {
	    // finalPrice 아이디를 가진 HTML 요소에서 값을 가져옵니다.
	    const finalPrice = parseInt(document.getElementById('finalPrice').textContent);

	    if (finalPrice === 0) {
	        // 가격이 0일 때 수행할 작업
	        // 추가로 다른 작업을 수행하려면 이곳에 코드를 추가할 수 있습니다.
	        return;  // 결제 요청을 막고 함수 종료
	    }

	    try {
	        // PortOne.requestPayment 호출
	        const response = await PortOne.requestPayment({
	            storeId: "store-e9d5634a-49fe-4954-a880-a860d3b70483",  // 상점 ID
	            channelKey: "channel-key-dc06b7ca-d864-444d-987b-349a97f1be61",  // 채널 키
	            paymentId: crypto.randomUUID(),  // 결제 고유 ID (랜덤 생성)
	            orderName: "Deeply카드결제",  // 상품명
	            totalAmount: finalPrice,  // 결제 총 금액을 finalPrice로 설정
	            currency: "CURRENCY_KRW",  // 통화 (KRW)
	            payMethod: "CARD",  // 결제 방법 (카드)
	            customer: { // 구매자 정보
	                customerId: "customer-12345", // 구매자 고유 ID
	                fullName: "John Doe", // 구매자 전체 이름
	                phoneNumber: "010-1234-5678", // 구매자 연락처
	                email: "test@portone.io", // 구매자 이메일
	                address: { // 선택 사항: 구매자 주소
	                    street: "123 Main Street",
	                    city: "Seoul",
	                    state: "Seoul",
	                    postalCode: "12345",
	                    country: "KR",
	                    addressLine1: "123 Main Street", // 일반주소
	                    addressLine2: "Apt 101", // 상세주소
	                }
	            }
	        });

	        if (response.code !== undefined) {
	            // 오류 발생 시
	            alert("거래 취소 ");
	            const notified = await fetch(`${pageContext.request.contextPath}/charge/complete`, {
		            method: "POST",
		            headers: { "Content-Type": "application/json",
		                'X-CSRF-TOKEN': csrfToken },
		            body: JSON.stringify({
		                totalAmount: finalPrice,
		                user_num: userNum
		            }),
		        });
		        window.location.href = "/main/main";
	        } else {
	            // 결제 요청이 성공한 경우
	            alert("결제 성공 메인으로 이동합니다!");
	            // 결제 완료 후 서버 처리 부분
		     
	        }
	    
	      

	        if (notified.ok) {
	            alert("결제 성공 메인으로 이동합니다");
	          

	        } else {
	        	 const errorResponse = await notified.json();
	        	    console.error("Error Response:", errorResponse);
	            alert("결제 완료 후 서버 처리 실패!");
	        }
	    } catch (error) {
	    }
	});
	console.log(finalPrice, userNum); // 실제 값이 어떻게 전달되는지 확인
</script>