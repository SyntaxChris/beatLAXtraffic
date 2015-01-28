$(document).ready(function(){
	var outcomeAry = ["Nope, no parking", "This lot's all full", "Completely packed", "None here either", "No spaces", "Can't fit there"];
	var timeSpent = 5,
    $body = $('body');

    $('.parking-result').text(outcomeAry[Math.floor(Math.random() * 7)])

	$body.on('click', '#x-btn-keep-looking', function(){
		timeSpent += 5;
		$('.timer-c .inner .timer-number').text(timeSpent);
		$('.parking-result').text(outcomeAry[Math.floor(Math.random() * 7)]);
	});
});