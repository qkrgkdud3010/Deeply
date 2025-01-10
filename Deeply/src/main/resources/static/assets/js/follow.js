$(function(){
	//팔로우 상태 읽기(팔로우 선택 여부)
	function selectFollow(follower_num,follow_num){
		//서버와 통신
		$.ajax({
			url:'/follow/follow',
			type:'get',
			data:{follower_num:follower_num,follow_num:follow_num},
			dataType:'json',
			success:function(param){
				displayFollow(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		})
	}
	
	$('.output_follow').on('click', function(){
		    const followNum = $(this).attr('data-num');
		    const followerNum = $(this).attr('data-rnum');

		    $.ajax({
		        url: '/follow/follow',
		        type: 'post',
		        data: { follow_num: followNum, follower_num:followerNum },
		        dataType: 'json',
		        beforeSend: function(xhr) {
		            xhr.setRequestHeader($('table').attr('data-header'), $('table').attr('data-token'));
		        },
		        success: function(param) {
		            if(param.result === 'logout') {
		                alert('로그인 후 팔로우가 가능합니다');
		            } else if(param.result === 'success') {
		                alert('팔로우 완료!');
		            } else {
		                alert('팔로우 오류 발생');
		            }
		        },
		        error: function() {
		            alert('네트워크 오류 발생');
		        }
		    });
		});

	function displayFollow(param, followNum) {
	    let output;
	    if(param.status === 'following') {
	        output = '../assets/images/hr2/follow.png';
	    } else if(param.status === 'unfollow') {
	        output = '../assets/images/hr2/unfollow.png';
	    } else {
	        alert('팔로우 표시 오류 발생');
	    }
	    $(`img[data-num="${followNum}"]`).attr('src', output);
	}
	
	//팔로우 표시 공통 함수
	function displayFollow(param){
		let output;
		if(param.status == 'following'){
			output = '../assets/images/hr2/follow.png';
		}else if(param.status == 'unfollow'){
			output = '../assets/images/hr2/unfollow.png';			
		}else{
			alert('팔로우 표시 오류 발생');
		}
		//문서 객체에 추가
		$('.output_follow').attr('src',output);
	}
	//초기 데이터 표시
	selectFollow($('.output_follow').attr('data-num'));
});