$(function () {
	let total = 0;
	
    $('.booking-item').click(function(){
		$('.event-detail').css('display', 'block');
		$.ajax({
			url:'detail',
			type:'get',
			data:{perf_num:$(this).attr('data-num')},
			dataType:'json',
			success:function(response){
				if ($('.event-detail').length > 0) {
				    $('.event-detail')[0].scrollIntoView({ behavior: 'smooth' });
				}
				displayEventDetails(response);
				
				$('#booking_submit_btn').click(function(){
					const url = '/booking/book?perf_num='+response.event.perf_num; 
					window.location.href=url;
				});
				
			},
				error:function(){
				alert('네트워크 오류');
			}
		});
					
	});
	
	function displayEventDetails(response){
		const event = response.event;
		$('.e-title').text(event.perf_title || '제목 없음');
		$('.e-date').text(event.perf_date || '제목 없음');
		$('.e-time').text(event.perf_time +" ~ "+event.end_time || '제목 없음');
		$('.e-period').text(event.perf_date + ' ~ ' + event.end_date || '제목 없음');
		$('.e-membership').text(event.mem_date || '제목 없음');
		$('.e-place').text(event.hall_name || '제목 없음');
		$('.e-desc').text(event.perf_desc || '제목 없음');
		$('.e-address').text(event.location || '제목 없음');
		$('.e-price').text(event.ticket_price || '제목 없음');
		$('.e-vip-price').text(event.ticket_price * 2.1 || '제목 없음');
	}
	
	$('.seat-item').click(function () {
	    const seat_num = $(this).text(); // 클릭된 좌석 번호 가져오기
	    const seat_price = Number($(this).data('price')); // 좌석 금액 가져오기 (숫자 변환)

	    // 이미 선택된 좌석인지 확인
	    if ($(this).hasClass('selected')) {
	        // 선택 해제 처리
	        $(this).removeClass('selected').css('color', ''); // 좌석 선택 스타일 제거

	        // 테이블에서 해당 좌석의 행 제거
	        $(`.receipt tbody tr[data-seat-num="${seat_num}"]`).remove();

	        // 총 금액 차감
	        total -= seat_price;

	        // 총 금액 행 업데이트
	        updateTotalRow(total);

	        // 입력 필드에서도 제거
	        if ($('#seat_n1').val() === seat_num) {
	            $('#seat_n1').val('');
	        } else if ($('#seat_n2').val() === seat_num) {
	            $('#seat_n2').val('');
	        }
	        return; // 클릭 이벤트 종료
	    }

	    // 좌석 선택 처리
	    if ($('#seat_n1').val() === "") {
	        $('#seat_n1').val(seat_num); // 첫 번째 필드에 좌석 번호 저장
	        $(this).addClass('selected').css('color', 'blue'); // 좌석 선택 스타일 추가
	    } else if ($('#seat_n2').val() === "") {
	        $('#seat_n2').val(seat_num); // 두 번째 필드에 좌석 번호 저장
	        $(this).addClass('selected').css('color', 'green'); // 좌석 선택 스타일 추가
	    } else {
	        alert('좌석은 최대 2개까지 선택할 수 있습니다.');
	        return;
	    }

	    // 총 금액 누적
	    total += seat_price;

	    // 테이블에 선택된 좌석 추가
	    $('.receipt tbody').append(`
	        <tr data-seat-num="${seat_num}">
	            <td>${seat_num}</td>
	            <td>${seat_price}원</td>
	            <td></td>
	        </tr>
	    `);

	    // 총 금액 행 업데이트
	    updateTotalRow(total);

	    $('#seat_price').val(total); // 숨겨진 입력 필드에 총 금액 저장
	});

	function updateTotalRow(total) {
	    // 기존 총 금액 행 제거
	    $('.receipt tbody .total-row').remove();

	    // 새로운 총 금액 행 추가
	    $('.receipt tbody').append(`
	        <tr class="total-row">
	            <td></td>
	            <td></td>
	            <td>${total}원</td>
	        </tr>
	    `);
	}
	
	       
});