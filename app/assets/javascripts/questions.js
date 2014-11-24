$(document).ready(function(){
	// TOGGLE ALL
	var clicks = 0;
	$( "#toggle-questions" ).click(function() {
		clicks += 1;
		$("#clicks").text(clicks);
  		if (clicks === 1) {
  			$( '#parking-lot' ).show();
	  		$( "#tile-questions" ).show();
	  		$( "#clock-questions" ).hide();
	  		$( "#icon-questions" ).hide();
  		}
  		else if (clicks === 2) {
  			$( "#tile-questions" ).hide();
  			$( "#clock-questions" ).show();
  		}
  		else if (clicks === 3) {
  			$( "#clock-questions" ).hide();
  			$( '#parking-lot' ).hide();
  			$( "#icon-questions" ).show();
  			clicks = 0
  		}
	});
	// END TOGGLE ALL

	// TILE QUESTIONS
	$('#other-button-landscape').click(function(){
		$('#user-text-input').toggle();
	});

	$('#other-info').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});
	// END TILE QUESTIONS

	// TIMER QUESTIONS
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
 	// END TIMER QUESTIONS	

 	// ICON QUESTIONS
 	$(".icon").click(function(){
		$("#1").empty();
		// $("#pet-icon").appendTo("#holder-1");
	});
 	// END ICON QUESTIONS
});



