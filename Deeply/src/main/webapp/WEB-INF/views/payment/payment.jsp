<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  -->
<script
	src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js" />
<script src="https://cdn.portone.io/v2/browser-sdk.js">
	const response = await
	PortOne.requestPayment({
		// Store ID 설정
		storeId : "store-4ff4af41-85e3-4559-8eb8-0d08a2c6ceec",
		// 채널 키 설정
		channelKey : "channel-key-893597d6-e62d-410f-83f9-119f530b4b11",
		paymentId : `payment-${crypto.randomUUID()}`,
		orderName : ${order_name},
		totalAmount : 1000,
		currency : "CURRENCY_KRW",
		payMethod : "CARD",
	});
</script>
<div>
	<hr>
	<h2>결제 방식</h2>
	<form>
		<div>
			<input type="button" value="카드 결제" class="bkline-btn" onclick="">
		</div>
		<h4>주의사항</h4>
		<h5>- 무통장 입금시 이체실수에는 책임지지 않습니다.</h5>
		<h5>- 체결 후 결제 정보 변경은 불가능하며 분할 납부 변경은 카드사 문의 바랍니다. 단, 카드사별 정책에 따라
			분할 납부 변경 시 수수료가 발생할 수 있습니다.</h5>
		<h4>주문 정보</h4>

	</form>
</div>