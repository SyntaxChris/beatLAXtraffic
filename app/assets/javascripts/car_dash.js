$(document).ready(function(){
	var sliderPercentage = 87;
	var ratioNum;
	var ratio;
	var clicks = 0;
	var progression = 0;

	function slideRatio(n){
		ratio = sliderPercentage/n;
		progression += ratio;

		if(progression <= sliderPercentage){
			$("#progression-bar").animate({'width': progression + "%"}, 500);
			$("#car-container").animate({'margin-left': progression + "%"}, 500);
		}
	};
	
    $('#x-btn-circle-next, #x-btn-timer-next, #x-btn-wait-next, #x-btn-upvote, #x-btn-downvote, #last-question-set.next, #x-btn-next-though').click(function(){
    	if($("#car-slider").css("display") === "block"){
    		clicks += 1;
    		ratioNum = $('#car-scenario').data('ratio-num');
    		if(clicks <= ratioNum){
    			slideRatio(ratioNum);
    		}
    	}
    });
});