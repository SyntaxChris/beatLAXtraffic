$(document).ready(function(){
	$("#timer-question-label-1").hover(
		function () {
			$("#timer-question-label-1").css('cursor','pointer');
    		$("#timer-question-1").css("fill", "#54ACE8");
 		},
		function () {
    		$("#timer-question-1").css("fill", "#008AE8");
 		}
 	);
 	$("#timer-question-label-2").hover(
		function () {
			$("#timer-question-label-2").css('cursor','pointer');
    		$("#timer-question-2").css("fill", "#73D4F5");
 		},
		function () {
    		$("#timer-question-2").css("fill", "#1BB9EF");
 		}
 	);
 	$("#timer-question-label-3").hover(
		function () {
			$("#timer-question-label-3").css('cursor','pointer');
    		$("#timer-question-3").css("fill", "#66BDED");
 		},
		function () {
    		$("#timer-question-3").css("fill", "#079BED");
 		}
 	);
 	$("#timer-question-label-4").hover(
		function () {
			$("#timer-question-label-4").css('cursor','pointer');
    		$("#timer-question-4").css("fill", "#68C4ED");
 		},
		function () {
    		$("#timer-question-4").css("fill", "#16ACEF");
 		}
 	);

	var click1 = 0
	var click2 = 0
	var click3 = 0
	var click4 = 0

 	$("#timer-question-label-1").click(function(){
 		if (click1 === 0){
 			$(this).animate({"opacity": "1.0"});
	 		$("#timer-question-label-2").animate({"opacity": "0.5"});
	 		$("#timer-question-label-3").animate({"opacity": "0.5"});
	 		$("#timer-question-label-4").animate({"opacity": "0.5"});
	 		click1 += 1;
 		} else {
 			$("#timer-question-label-2").animate({"opacity": "1.0"});
	 		$("#timer-question-label-3").animate({"opacity": "1.0"});
	 		$("#timer-question-label-4").animate({"opacity": "1.0"});
	 		click1 = 0;
 		}
 		click2 = 0;
 		click3 = 0;
 		click4 = 0;
 		$("#timer-question-submit").fadeIn();
 	});
 	$("#timer-question-label-2").click(function(){
 		if (click2 === 0){
 			$(this).animate({"opacity": "1.0"});
	 		$("#timer-question-label-3").animate({"opacity": "0.5"});
	 		$("#timer-question-label-4").animate({"opacity": "0.5"});
	 		$("#timer-question-label-1").animate({"opacity": "0.5"});
	 		click2 += 1;
 		} else {
 			$("#timer-question-label-3").animate({"opacity": "1.0"});
	 		$("#timer-question-label-4").animate({"opacity": "1.0"});
	 		$("#timer-question-label-1").animate({"opacity": "1.0"});
	 		click2 = 0;
 		}
 		click3 = 0;
 		click4 = 0;
 		click1 = 0;
 		$("#timer-question-submit").fadeIn();
 	});
 	$("#timer-question-label-3").click(function(){
 		 if (click3 === 0){
 		 	$(this).animate({"opacity": "1.0"});
	 		$("#timer-question-label-4").animate({"opacity": "0.5"});
	 		$("#timer-question-label-1").animate({"opacity": "0.5"});
	 		$("#timer-question-label-2").animate({"opacity": "0.5"});
	 		click3 += 1;
 		} else {
 			$("#timer-question-label-4").animate({"opacity": "1.0"});
	 		$("#timer-question-label-1").animate({"opacity": "1.0"});
	 		$("#timer-question-label-2").animate({"opacity": "1.0"});
	 		click3 = 0;
 		}
 		click4 = 0;
 		click1 = 0;
 		click2 = 0;
 		$("#timer-question-submit").fadeIn();
 	});
 	$("#timer-question-label-4").click(function(){
 		if (click4 === 0){
 			$(this).animate({"opacity": "1.0"});
	 		$("#timer-question-label-1").animate({"opacity": "0.5"});
	 		$("#timer-question-label-2").animate({"opacity": "0.5"});
	 		$("#timer-question-label-3").animate({"opacity": "0.5"});
	 		click4 += 1;
 		} else {
 			$("#timer-question-label-1").animate({"opacity": "1.0"});
	 		$("#timer-question-label-2").animate({"opacity": "1.0"});
	 		$("#timer-question-label-3").animate({"opacity": "1.0"});
	 		click4 = 0;
 		}
 		click1 = 0;
 		click2 = 0;
 		click3 = 0;
 		$("#timer-question-submit").fadeIn();
 	});
});