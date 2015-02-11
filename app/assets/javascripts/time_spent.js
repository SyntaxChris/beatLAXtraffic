$(document).ready(function(){
	var outcomeAry = ["Nope, no parking", "This lot's all full", "Completely packed", "None here either", "No spaces", "Can't fit there"];
	var outcomePicker = 0;
	var timeSpent = 5,
    $body = $('body');

    

    $body.on('load', function(){
    	$('.parking-result').text(outcomeAry[outcomePicker]);
    });
    
	$body.on('click', '#x-btn-keep-looking', function(){
		timeSpent += 5;

		if(outcomePicker <= 5){
			outcomePicker += 1;
		}
		else{
			outcomePicker = 0;
		}

		$('.timer-c .inner .timer-number').text(timeSpent);
		$('.parking-result').text(outcomeAry[outcomePicker]);
	});
});