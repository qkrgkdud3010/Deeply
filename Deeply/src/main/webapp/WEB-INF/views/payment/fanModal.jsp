<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Membership Modal</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border-radius: 8px;
	width: 300px;
	text-align: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.modal-content h2 {
	color: #333;
}

.modal-content button {
	margin: 10px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	cursor: pointer;
}

.modal-content button.cancel {
	background-color: #6c757d;
}
</style>
</head>
<body>
	<div id="joinMembership" class="modal">
		<div class="modal-content">
			<h2>멤버십을 가입하시겠습니까?</h2>
			<button onclick="closeModal('joinMembership')" class="blue-close-btn">X</button>
			<p>다음 결제일 : {premium_member.fan_end}</p>
			<p>주의사항 : 다음 결제일까지 해지하지 않을 시 매달 자동 갱신되며, 결제 후 환불은 불가합니다.</p>
			<button onclick="successJoin()">가입</button>
			<button class="cancel" onclick="closeModal()">취소</button>
		</div>
	</div>
	
	<div id="successJoin" class="modal">
		<div class="modal-content">
			<button onclick="closeModal('successJoin')" class="blue-close-btn">X</button>
			<c:if test="${artist.group_name == artist.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${artist.name}</span>님의 멤버십
				</h2>
				<h2>멤버십 가입이 완료되었습니다.</h2>
			</c:if>
			<c:if test="${artist.group_name != artist.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${artist.group_name} ${artist.name}</span>님의 멤버십
				</h2>
				<h2>멤버십 가입이 완료되었습니다.</h2>
			</c:if>
		</div>
	</div>

	<div id="removeMembership" class="modal">
		<div class="modal-content">
			<h2>멤버십을 해지하시겠습니까?</h2>
			<button onclick="closeModal('removeMembership')" class="blue-close-btn">X</button>
			<p>다음 결제일 : {premium_member.fan_end}</p>
			<p>주의사항 : 해지시에도 다음 결제일 이전까지 멤버십 사용이 가능하며 남은 기간에 비례해 환불하는 것은 불가능합니다.</p>
			<button onclick="successRemove()">해지</button>
			<button class="cancel" onclick="closeModal()">취소</button>
		</div>
	</div>

	<div id="successRemove" class="modal">
		<div class="modal-content">
			<button onclick="closeModal('successRemove')" class="blue-close-btn">X</button>
			<c:if test="${artist.group_name == artist.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${artist.name}</span>님의 멤버십
				</h2>
				<h2>멤버십 해지가 완료되었습니다.</h2>
			</c:if>
			<c:if test="${artist.group_name != artist.name}">
				<h2 class="membership-title">
					아티스트 <span class="blue-artiname">${artist.group_name} ${artist.name}</span>님의 멤버십
				</h2>
				<h2>멤버십 해지가 완료되었습니다.</h2>
			</c:if>
		</div>
	</div>
	
<script>

	function showModal(modalId){
		document.getElementById('customModal').style.display = 'block';
	}
	
	function closeModal(modalId){
		document.getElementById('customModal').style.display = 'none';
	}
	
	function successJoin(){
		$.ajax({
			type: 'post',
			url: 'joinMembership',
			data: {},
			data-type: 'json',
			success: function(param){
				if(response.success){
					//잔액이 충분할 경우
					closeModal('joinMembership');
					showModal('successJoin');
				}else{
					//잔액이 부족할 경우
					alert('예치금이 부족하여 예치금 충전 페이지로 이동합니다.');
				}
			},
			error: function(){
				alert('네트워크 오류가 발생했습니다.');
			}
		});
	};

	function successRemove(){
		$.ajax({
			type:'post',
			url:'',
			data:'',
			data-type:'json',
			success:function(param){
				if('멤버십 회원이 맞으면'){
					closeModal('removeMembership');
					showModal('successRemove');
				}else{
					alert('현재 멤버십 회원이 아니므로 해지할 수 없습니다.');
				}
			},
			error:function(){
				alert('네트워크 오류가 발생했습니다.')
			}
		})
	}
	
</script>

</body>
</html>