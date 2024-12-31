<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!-- jQuery CDN을 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 회원가입 시작 -->

<div class="main-div">
<script type="text/javascript">

var csrfToken = $('meta[name="_csrf"]').attr('content');
var csrfHeader = $('meta[name="_csrf_header"]').attr('content');
function submitEmail() {
    var email = document.getElementById("email").value;  // 이메일 입력값 가져오기
   document.getElementById('verificationSection').style.display = 'block';
    
    // 인증 요청 버튼을 숨기고 클릭 방지
    var requestButton = document.getElementById('requestVerificationButton');

 
    // 이메일 유효성 검사 (필요한 경우 추가)
    if (!email || !validateEmail(email)) {
        alert("유효한 이메일을 입력하세요.");
        return;
    }

    // AJAX 요청 보내기
    $.ajax({
        url: '/member/emailSubmit',  // 서버의 이메일 전송 처리 URL
        type: 'POST',
        headers: {
            [csrfHeader]: csrfToken  // CSRF 토큰을 헤더에 포함
        },
        contentType: 'application/json',
        data: JSON.stringify({ "email": email }),  // JSON 형식으로 이메일 전송
        success: function(response) {
            // 성공적으로 이메일 인증 코드가 발송되면 페이지에 결과를 표시
         alert("이메일이 전송되었습니다");
       
            // 이메일 인증 페이지로 이동할 필요가 없으면 이 부분에서 결과를 페이지에 보여줄 수 있습니다.
        },
        error: function(xhr, status, error) {
            alert("이메일 전송 완료 .");
        }
    });
}

// 이메일 유효성 검사 함수 (필요한 경우)
function validateEmail(email) {
    var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return re.test(email);
}

//인증 코드 검증
function verifyEmail() {
    var email = $('#email').val();  // 이메일 값 가져오기
    var code = $('#code').val();    // 인증 코드 값 가져오기

    $.ajax({
        url: '/member/verifyEmail',  // 서버의 이메일 인증 처리 URL
        headers: {
            [csrfHeader]: csrfToken  // CSRF 토큰을 헤더에 포함
        },
        type: 'POST',
        data: { 
            email: email,  // 이메일
            code: code     // 인증 코드
        },
        success: function(response) {
           
            if (response.status === 'verified') {
                alert("인증번호 일치");
                $('#registerSection').show();
            } else {
            	alert("인증번호 불일치");
               
            }
        },
        error: function(xhr, status, error) {
            alert("인증에 실패했습니다. 다시 시도해주세요.");
        }
    });
}

</script>
	<div class="register-wrap">
		<div class="register-image"></div>

		<div class="register-content">

			<img class="logo-img"
				src="${pageContext.request.contextPath}/assets/images/DeeplyLoginLogo.png">
			<h1>Create your Account</h1>
			<h2>계정을 만들어 주세요</h2>
			<div style="width:290px;">
			<form:form class="register-form" modelAttribute="memberVO"
				action="registerUser" id="member_register">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<form:input path="email" id="email" class="Authentication" type="text" placeholder="email" />
				<div class="inz" onclick="submitEmail()">인증요청</div>
				<div style="display:none;" id="verificationSection">
					<form:input path="verificationCode" id="code" class="Authentication" type="text" placeholder="인증번호" />
					<div class="inz" onclick="verifyEmail()" >인증 하기</div>
				</div>
				
				<div style="display:none;" id="registerSection">
				<form:input class="Authentication" path="id" placeholder="아이디" />
				<input type="button" id="confirm_id" value="중복체크"
					class="default-btn">
				<span id="message_id"></span>
				<form:input path="passwd_hash" type="text" placeholder="비밀번호" />
				<form:input path="" type="text" placeholder="비밀번호확인" />
				<form:input path="name" type="text" placeholder="이름" />
				<form:input path="nick_name" class="Authentication" type="text"
					placeholder="닉네임" />
				<input type="button" id="confirm_id" value="중복체크"
					class="default-btn">
				<form:input path="zipcode" id="zipcode" class="Authentication2"
					type="text" placeholder="우편번호" />
				<input type="button" onclick="execDaumPostcode()" value="우편번호찾기"
					class="default-btn2">
				<form:input path="address1" id="address1" type="text"
					placeholder="주소" />
		
				<form:input path="address2" type="text" placeholder="상세주소" />
		<form:input path="phone" id="phone" type="text" placeholder="번호" />
			
			</div>
				<div class="line-with-text2">
					<span>or</span>
				</div>
				<table class="register-api">
					<tr>
						<td><img class="inline-img2" alt=""
							src="${pageContext.request.contextPath}/assets/images/naver.png">
							<span class="inline-text2">네이버로그인</span></td>
						<td><img class="inline-img2" alt=""
							src="${pageContext.request.contextPath}/assets/images/kakao.png">
							<span class="inline-text2">카카오로그인</span></td>
					</tr>
					<tr>
					

					</tr>
				</table>
				<form:button class="register-submit" value="registerUser">회원가입</form:button>
			</form:form>
				</div>
		</div>
	</div>
</div>
<!-- 다음 우편번호 API 시작 -->
<div id="layer"
	style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
	<img
		src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
		id="btnCloseLayer"
		style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
		onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if (data.addressType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;
						//document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || documentcumentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || documentcumentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
</script>
<!-- 다음 우편번호 API 끝 -->
<!-- 회원가입 끝 -->





