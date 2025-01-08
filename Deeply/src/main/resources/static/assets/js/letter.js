$(function () {
	
	const targetElement = $('#letter_form');
	if (targetElement.length) {
	    const elementPosition = targetElement.offset().top;
	    window.scrollTo(0, elementPosition); // 즉시 스크롤 이동
	}
});