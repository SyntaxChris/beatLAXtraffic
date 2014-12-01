$(document).ready(function(){
	// TOGGLE ALL
	var clicks = 0;
	$( "#toggle-questions" ).click(function() {
		clicks += 1;
		$("#clicks").text(clicks);
  		if (clicks === 1) {
  			$( "#strategy-questions").hide();
	  		$( "#lines" ).show();
	  		$( "#cars" ).show();
	  		$( "#tile-questions" ).show();
  		}
  		else if (clicks === 2) {
  			$( "#tile-questions" ).hide();
  			$( "#clock-questions" ).show();
  		}
  		else if (clicks === 3) {
  			$( "#lines" ).hide();
	  		$( "#cars" ).hide();
	  		$( "#clock-questions" ).hide();
  			$( "#icon-questions" ).show();
  		}
  		else if (clicks === 4) {
  			$( "#icon-questions" ).hide();
  			$( "#lines" ).show();
	  		$( "#cars" ).show();
  			$( "#spinner-questions" ).show();
  		}
  		else if (clicks === 5) {
  			$( "#lines" ).hide();
	  		$( "#cars" ).hide();
  			$( "#spinner-questions" ).hide();
  			$( "#strategy-questions").show();
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
 	$(".icon").click(function() {
 		var iconChosen = $(this)
 		var description = iconChosen.text();
 		var removeBind = function(){
 			$( "#yea").unbind( "click" );
			$( "#nah").unbind( "click" );
			$( "#yea-small").unbind( "click" );
			$( "#nah-small").unbind( "click" );
 		};

		$("#icon-description").html(description);
		$("#icon-description-small").html(description);

		$("#icon-pop-up").fadeIn();
		$("#icon-pop-up-small").fadeIn();

		$("#yea").click(function(){
			if ($("#holder-1").children().attr("class") !== "icon") {
				iconChosen.clone().appendTo("#holder-1");
				$( "#icon-pop-up").fadeOut();
				$("#holder-1").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-2").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-2");
	            $( "#icon-pop-up").fadeOut();
	            $("#holder-2").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-3").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-3");
	            $( "#icon-pop-up").fadeOut();
	            $( ".submit-row" ).fadeIn();
	            $("#holder-3").children().children(".remove-icon").fadeIn();
			}
			// Remove listners.
			removeBind();
		});

		$("#yea-small").click(function(){
			if ($("#holder-1-small").children().attr("class") !== "icon") {
				iconChosen.clone().appendTo("#holder-1-small");
				$( "#icon-pop-up-small").fadeOut();
				$("#holder-1-small").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-2-small").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-2-small");
	            $( "#icon-pop-up-small").fadeOut();
	            $("#holder-2-small").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-3-small").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-3-small");
	            $( "#icon-pop-up-small").fadeOut();
	            $( ".submit-row-small" ).fadeIn();
	            $("#holder-3-small").children().children(".remove-icon").fadeIn();
			}
			// Remove listners.
			removeBind();
		});

		$("#nah").click(function(){
			$( "#icon-pop-up").fadeOut();
			// Remove listeners.
			removeBind();
		});
		$("#nah-small").click(function(){
			$( "#icon-pop-up-small").fadeOut();
			// Remove listeners.
			removeBind();
		});
	});

	$("#holder-1").click(function(){
		$(this).empty();
	});

	$("#holder-2").click(function(){
		$(this).empty();
	});

	$("#holder-3").click(function(){
		$(this).empty();
	});
	$("#holder-1-small").click(function(){
		$(this).empty();
	});

	$("#holder-2-small").click(function(){
		$(this).empty();
	});

	$("#holder-3-small").click(function(){
		$(this).empty();
	});

 	// END ICON QUESTIONS


 	// SPINNER QUESTIONS
 	$('#spin-button').click(function(){
	 	if (Math.floor(Math.random()*2) === 1){
	 		$("#wheel").addClass("full");
		 	setTimeout(
		 		function(){
		   			$("#full").css("fill", "red");
		   			$("#spin-button").hide();
		   			$("#lines").fadeIn();
		   			$("#cars").fadeIn();
		   			$("#chance-time").hide();
		   			$("#try-again").show();
		  		}, 6000
		  	);
	 	}
	 	else {
	 		$("#wheel").addClass("not-full");
	 		setTimeout(
		 		function(){
		 			$("#chance-time").hide();
		 			$("#spin-button").hide();
		 			$("#try-again").hide();
		 			$("#parking-congrats").show();
		 			$("#spinner-components").hide();
		 			$("#parking-trophy").fadeIn();
		   			$("#not-full").css("fill", "red");
		   			$("#lines").fadeIn();
		  		}, 6000
	  		);
	 	}
 	});

 	$("#yup-spinner").click(function(){
 		$("#try-again").hide();
 		$("#lines").hide();
 		$("#cars").hide();
 		$("#chance-time").show();
 		$("#spin-button").show();
 		$("#wheel").removeClass("full");
 		$("#full").css("fill", "#ECF0F1");
 	});
 	// END SPINNER QUESTIONS

 	// STRATEGY QUESTIONS
 	var personToggle = 0;
 	$("#person").click(function(){
 		personToggle += 1;

 		if (personToggle === 1) {
 			$("#guy-background").css("fill", "#98CC2D");
 			$("#shirt").css("fill", "#FBDD61");
 		};

 		if (personToggle === 2) {
			$("#guy-background").css("fill", "#CCCCCC");
			personToggle = 0;
			$("#shirt").css("fill", "#A3A3A3");
 		};
 	});
 	// END STRATEGY QUESTIONS
});



