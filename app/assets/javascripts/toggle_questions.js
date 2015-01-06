$(document).ready(function(){
	$("#splash-page").show();
	$("#skip-button").hide();
	var pageClicks = 0;

	$("#toggle-questions").click(function(){
		pageClicks += 1
		$("#clicks").text(pageClicks);

		if(pageClicks === 1){
			$("#splash-page").hide();
			$("#distance-questions").show();
			$("#skip-button").show();
		}
		else if(pageClicks === 2){
			$("#distance-questions").hide();
			$("#mission-intro").show();
		}
		else if(pageClicks === 3){
			$("#mission-intro").hide();
			$("#interactive-map").show();
			$("#dashboard").show();
		}
		else if(pageClicks === 4){
			$("#interactive-map").hide();
			$("#strategy-questions").show();
		}
		else if(pageClicks === 5){
			$("#strategy-questions").hide();
			$("#why-park-car").show();
		}
		else if(pageClicks === 6){
			$("#why-park-car").hide();
			$("#parking-lot").show();
			$("#spinner-questions").show();
		}
		else if(pageClicks === 7){
			$("#parking-lot").hide();
			$("#spinner-questions").hide();
			$("#tile-questions").show();
		}
		else if(pageClicks === 8){
			$("#tile-questions").hide();
			$("#late-flight").show();
		}
		else if(pageClicks === 9){
			$("#late-flight").hide();
			$("#parking-lot").show();
			$("#lines").show();
	 		$("#cars").show();
			$("#after-parking-questions").show();
		}
		else if(pageClicks === 10){
			$("#parking-lot").hide();
			$("#lines").hide();
	 		$("#cars").hide();
			$("#after-parking-questions").hide();
			$('#time-spent').show();
		}
		else if(pageClicks === 11){
			$('#time-spent').hide();
			$("#clock-questions").show();
		}
		else if(pageClicks === 12){
			$("#clock-questions").hide();
			$("#dashboard").hide();
			$("#successful-pickup").show();
		}
		else if(pageClicks === 13){
			$("#successful-pickup").hide();
			$("#car-slider").show();
			$("#circle-pickup").show();
			$('body').trigger('spinCar');
		}
		else if(pageClicks === 14){
			$("#circle-pickup").hide();
			$("#timer-pickup").show();
		}
		else if(pageClicks === 15){
			$( "#timer-pickup" ).hide();
			$( ".red-car" ).toggleClass('animate', false);
			$( "#willing-to-wait" ).show();
		}
		else if(pageClicks === 16) {
			$( "#willing-to-wait" ).hide();
			$("#car-slider").show();
			$("#dashboard").hide();
			$('body').toggleClass('rail-show', true);
			$("#rail-system").show();
		}
		else if(pageClicks === 17){
            $("#car-slider").hide();
			$("#dashboard").show();
			$('body').toggleClass('rail-show', false);
			$("#rail-system").hide();
			$("#icon-questions").show();
		}
		else if(pageClicks === 18){
			$("#dashboard").hide();
			$("#icon-questions").hide();
			$("#car-slider").show();
			$("#last-question-set").show();
		}
		else if(pageClicks === 19){
      		
			$("#last-question-set").hide();
			$("#think-strategy").show();
		}
		else if(pageClicks === 20){
			$("#think-strategy").hide();
			$("#congrats").show();
		}
		else {
			$("#car-slider").hide();
			$("#congrats").hide();
			$("#splash-page").show();
			pageClicks = 0;
		}
	});
});




