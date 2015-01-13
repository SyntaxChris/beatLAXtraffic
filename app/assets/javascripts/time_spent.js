$(document).ready(function(){
	var timeSpent = 5;

	$('#x-btn-keep-looking').click(function(){
		timeSpent += 5;
		$('.timer-c .inner .timer-number').text(timeSpent);
	});
});