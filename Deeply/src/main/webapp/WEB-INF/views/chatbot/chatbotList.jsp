<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 챗봇서비스 시작 -->
<style type="text/css">
	#chatting_message{
		border:1px solid black;
		width:660px;
		height:300px;
		margin:0 auto;
		padding:10px;
		overflow:auto;
	}
	.from-position{
		width:300px;
		margin:10px 0 10px 330px;
	}
	.from-position .item{
		background-color:yellow;
		padding:10px;
		min-height:50px;	
		border-radius: 20px;
		border-top-right-radius:0;	
	}
	.to-position{
		width:600px;
		margin:10px 0 10px 0;
	}
	.to-position .item{
		background-color:pink;
		padding:10px;
		min-height:50px;
		border-radius: 20px;
		border-top-left-radius:0;
	}
</style>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#message').keydown(function(event){
			if(event.keyCode == 13 && !event.shiftKey) {
				$('#chatting_form').trigger('submit');
			}
		});
		//채팅 메시지 처리
		$('#chatting_form').submit(function(event){	
			if($('#message').val().trim() == ''){
				alert('내용을 입력하세요!');
				$('#message').val('').focus();
				return false;
			}
			
			$('#chatting_message').append('<div class="from-position"><div class="item">'+$('#message').val().replace(/\r\n/g,'<br>').replace(/\r/g,'<br>').replace(/\n/g,'<br>')+'</div></div>');
			
			//form 이하의 태그에 입력한 데이터를 모두 읽어옴
			const form_data = $(this).serialize();
			
			//서버와 통신
			$.ajax({
				url:'chatbot',
				type:'post',
				data:form_data,
				dataType:'json',
				beforeSend:function(xhr){
					xhr.setRequestHeader($('#csrfHeaderName').val(),$('#csrfTokenValue').val());
				},
				success:function(param){
					$('#message').val('').focus();
					$('#chatting_message').append('<div class="to-position"><div class="item">'+param.response.replace(/\r\n/g,'<br>').replace(/\r/g,'<br>').replace(/\n/g,'<br>')+'</div></div>');
					//스크롤을 하단에 위치시킴
					$('#chatting_message').scrollTop(
							        $("#chatting_message")[0].scrollHeight);
				},
				error:function(){
					alert('네트워크 오류!');
				}
			});
			event.preventDefault();
		});		
	});
</script>
<div class="page-main">
	<h2>챗봇 서비스</h2>
	<div id="chatting_message"></div>
	<form method="post" id="chatting_form">
	  	<input type="hidden" id="csrfHeaderName" value="${_csrf.headerName}">
		<input type="hidden" id="csrfTokenValue" value="${_csrf.token}">
		<ul>
			<li>	
			    <label for="message">내용</label>
			    <textarea rows="5" cols="40" name="message" id="message"></textarea>
			    <input type="submit" value="전송">
			</li>
		</ul>
	</form>
</div>
<!-- 챗봇서비스 끝 -->


