$(function () {
	$('#upload_btn').click(function(e){
		e.preventDefault();
		$('#upload').click();
	});
	
	$('#upload').change(function(){
		let my_photo = this.files[0];
		if(!my_photo){
		//선택을 취소하면 원래 처음 화면으로 되돌림
		$('.items-img').attr('src',photo_path);
		alert('파일 선택 안됨');
		return;
		}
		//화면에서 이미지 미리보기
		const reader = new FileReader();
		reader.readAsDataURL(my_photo);
									
		reader.onload=function(){
		$('.items-img').attr('src',reader.result);
						
		};		
	});
	$('[id^="desc_btn"]').click(function(e) {
	    e.preventDefault(); // 기본 동작 방지
	    const btnId = $(this).attr('id'); // 현재 클릭된 버튼의 ID 가져오기
	    const photoId = btnId.replace('desc_btn', 'desc_photo'); // 버튼 ID를 photo ID로 변환
	    $('#' + photoId).click(); // 해당 photo ID를 클릭
	});
	
	$('[id^="desc_photo"]').change(function() { 
	    let myPhoto = this.files[0];
	    const previewClass = $(this).attr('id').replace('desc_photo', 'preview_photo'); // 클래스와 ID 매칭

	    if (!myPhoto) {
	        // 선택 취소 시 초기 이미지로 되돌림
	        $('.' + previewClass).attr('src', photo_path);
	        alert('파일 선택 안됨');
	        return;
	    }

	    // 화면에서 이미지 미리보기
	    const reader = new FileReader();
	    reader.readAsDataURL(myPhoto);

	    reader.onload = function() {
	        $('.' + previewClass).attr('src', reader.result);
	    };
	});
	
	$('#item_writeSubmit').submit(function(e) {
	    if ($('#upload').val() === "") {
	        e.preventDefault(); // 폼 제출 중단
	        alert('상품 이미지는 필수로 등록해주세요');
	    }
	});
});