$(document).ready(function(){
	var timeSpent = 5,
      $body = $('body');

	$body.on('click', '#x-btn-keep-looking', function(){
		timeSpent += 5;
		$('.timer-c .inner .timer-number').text(timeSpent);
	});
});