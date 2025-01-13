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
		$('.e-img').attr('src', '../assets/upload/'+event.perf_photo);
		$('.e-title').text(event.perf_title);
		$('.e-date').text(event.perf_date);
		$('.e-time').text(event.perf_time +" ~ "+event.end_time);
		$('.e-period').text(event.perf_date + ' ~ ' + event.end_date);
		$('.e-membership').text(event.mem_date);
		$('.e-place').text(event.hall_name);
		$('.e-desc').text(event.perf_desc);
		$('.e-address').text(event.location);
		$('.e-price').text(event.ticket_price + '원');
		$('.e-vip-price').text(Math.round(event.ticket_price * 1.4) + '원');
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
	
	$('.dropdown-item').click(function (e) {
	    e.preventDefault();
	    
	    $('#hall_num').val($(this).data('value'));
	    
	    $('#drop_title').text($(this).text());
	});
	
	$('#event_dur1').click(function(e){
		e.preventDefault();
		$('.event-end-date').hide();
		$(this).css('background','#0369A1');
		$('#event_dur2').css('background','none');
	});
	$('#event_dur2').click(function(e){
		e.preventDefault();
		$('.event-end-date').show();
		$(this).css('background','#0369A1');
		$('#event_dur1').css('background','none');
	})
	
	
	
	$('#date-range').flatpickr({
	      mode: "range", // 범위 모드 활성화
	      dateFormat: "Y-m-d", // 날짜 형식 설정
	      onChange: function (selectedDates, dateStr, instance) {
			
			if (selectedDates.length === 2) {
				if (selectedDates[0].getTime() === selectedDates[1].getTime()) {
				               alert("서로 다른 날짜를 입력해주세요");
				               instance.clear(); // 선택된 날짜 초기화
				               $('#date-range').val(''); // 입력 필드 초기화
				               return;
				           }
				console.log("선택된 날짜:", dateStr); // 선택된 날짜 출력
				const formattedDate = dateStr.replace(' to ', ' ~ ');
				$('#date-range').val(formattedDate);
				$('#booking_filter').submit();
			}
			
			
	      }
	  });
	  
	  $('#calendar_img').click(function () {
	         
	    const today = new Date();
	    const hundredDaysLater = new Date();
	    hundredDaysLater.setDate(today.getDate() + 100);

	         
	    const formatDate = (date) => {
	        const year = date.getFullYear();
	        const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
	        const day = String(date.getDate()).padStart(2, '0');
	        return `${year}-${month}-${day}`;
	    };

	    const startDate = formatDate(today);
	    const endDate = formatDate(hundredDaysLater);

	    $('#date-range').val(`${startDate} ~ ${endDate}`);
		$('#booking_filter').submit();
	 });
	 
	 $('.booking-btn').click(function(){
		$('#event_status').val($(this).data('value'));
	 }); 
	 
	 $('.register-event-btn').click(function(e){
		e.preventDefault();
	 });
});