$(function () {
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
	
	       
});