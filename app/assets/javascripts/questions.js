$(document).ready(function(){
	$('#other-button-landscape').click(function(){
		$('#user-text-input').toggle();
	});

	$('#other-info').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});

	// timer question color change for labels
	$("#timer-question-label-1").hover(
		function () {
			$("#timer-question-label-1").css('cursor','pointer');
    		$("#timer-question-1").css("fill", "#A8E3F5");
 		},
		function () {
    		$("#timer-question-1").css("fill", "#008AE8");
 		}
 	);

 	$("#timer-question-label-2").hover(
		function () {
			$("#timer-question-label-2").css('cursor','pointer');
    		$("#timer-question-2").css("fill", "#A8E3F5");
 		},
		function () {
    		$("#timer-question-2").css("fill", "#1BB9EF");
 		}
 	);

 	$("#timer-question-label-3").hover(
		function () {
			$("#timer-question-label-3").css('cursor','pointer');
    		$("#timer-question-3").css("fill", "#A8E3F5");
 		},
		function () {
    		$("#timer-question-3").css("fill", "#079BED");
 		}
 	);

 	$("#timer-question-label-4").hover(
		function () {
			$("#timer-question-label-4").css('cursor','pointer');
    		$("#timer-question-4").css("fill", "#A8E3F5");
 		},
		function () {
    		$("#timer-question-4").css("fill", "#16ACEF");
 		}
 	);	
});

