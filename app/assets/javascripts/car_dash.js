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
			$("#progression-bar").animate({'width': progression + "%"}, 1000);
			$("#car-container").animate({'margin-left': progression + "%"}, 1000);
		}
	};
	

    $("#toggle-questions").click(function(){
    	if($("#car-slider").css("display") === "block"){
    		clicks += 1;
    		ratioNum = $('#car-scenario').data('ratio-num');
    		if(clicks <= ratioNum){
    			slideRatio(ratioNum);
    		}
    	}
    });
});