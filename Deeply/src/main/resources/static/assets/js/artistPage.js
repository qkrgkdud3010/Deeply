$(function () {
	
	let photo_path = $('#previewImage').attr('src');	
	
	$('.member-selection-close').click(function(){
		$('.member-selection-container').hide();
	});
	
	$('.ad-letter').click(function(){
		$('.member-selection-container').show();
		if ($('.member-selection-container').length > 0) {
			$('.member-selection-container')[0].scrollIntoView({ behavior: 'smooth', block: "center"});
		}
	});
	
	$('.amainpic-select').click(function(e){
		e.preventDefault();
		$('#group_photo').click();
	});
	
	
	$('#group_photo').change(function(){
				
		let my_photo = this.files[0];
		if(!my_photo){
			//선택을 취소하면 원래 처음 화면으로 되돌림
			$('#previewImage').attr('src',photo_path);
			alert('파일 선택 안됨');
			return;
		}
		//화면에서 이미지 미리보기
		const reader = new FileReader();
		reader.readAsDataURL(my_photo);
							
		reader.onload=function(){
			$('#previewImage').attr('src',reader.result);
				
		};		
	});
});