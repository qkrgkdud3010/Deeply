$(function () {
	
	$('.member-selection-close').click(function(){
		$('.member-selection-container').hide();
	});
	
	$('.ad-letter').click(function(){
		$('.member-selection-container').show();
	});
});