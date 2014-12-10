$(document).ready(function(){
	// TOGGLE ALL
	var clicks = 0;
	$( "#toggle-questions" ).click(function() {
		clicks += 1;
		$("#clicks").text(clicks);
			if (clicks === 1) {
				$( "#mission-intro").hide();
				$( "#strategy-questions").show();
				$( "#dashboard").show();
				$('body').trigger('startDashboardAnimation');
  		}
  		else if (clicks === 2) {
  			$( "#strategy-questions").hide();
	  		$( "#lines" ).show();
	  		$( "#cars" ).show();
	  		$( "#tile-questions" ).show();
  		}
  		else if (clicks === 3) {
  			$( "#tile-questions" ).hide();
  			$( "#clock-questions" ).show();
  		}
  		else if (clicks === 4) {
  			$( "#lines" ).hide();
	  		$( "#cars" ).hide();
	  		$( "#clock-questions" ).hide();
  			$( "#icon-questions" ).show();
  		}
  		else if (clicks === 5) {
  			$( "#icon-questions" ).hide();
  			$( "#lines" ).show();
	  		$( "#cars" ).show();
  			$( "#spinner-questions" ).show();
  		}
  		else if (clicks === 6) {
  			$( "#lines" ).hide();
	  		$( "#cars" ).hide();
  			$( "#spinner-questions" ).hide();
  			$( "#interactive-map" ).show();
  		}
  		else if (clicks === 7) {
  			$( "#interactive-map" ).hide();
  			$( "#dashboard" ).hide();
  			$( "#mission-intro" ).show();
  			clicks = 0
  		}
	});
	// END TOGGLE ALL


	// TILE QUESTIONS
	$('[id=other-info]').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});
	$('[id=other-info-small]').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('[id=char-count-small]').text(cs + " characters left");
	});
	$('.other-submit').click(function() {
	    $('[id=user-text-input]').hide();
	    $('[id=other-small-textbox]').hide();
	    $('.next').show();
	    if (otherCheck === 0){
			$(".unchecked-other-tile svg path").attr("fill", "#AA75D3");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "white");
    		otherCheck = 1;
    	}
    	else {
			$(".unchecked-other-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "#757575");
    		otherCheck = 0;
    	}
	});
	$('[id=small-other]').click(function(){
		$('[id=other-small-textbox]').show();
	});
	$('[id=other-cancel]').click(function(){
		$('[id=other-small-textbox]').hide();
	});


	$.fn.toggleAttr = function(attr,val){
    	return this.each(function(){
	        var $this = $(this);
	        if ($this.is("[" + attr + "]")) {
	            $this.removeAttr(attr);
	        }
	        else {
	            $this.attr(attr,val);            
	        }
    	});
	}

	var phoneCheck = 0;
	var shopCheck = 0;
	var hangoutCheck = 0;
	var eatCheck = 0;
	var otherCheck = 0;

	$('[id=phone-landscape]').click(function() {
    	$(".unchecked-phone-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (phoneCheck === 0){
			$(".unchecked-phone-tile svg path").attr("fill", "#FC9C52");
    		$(".unchecked-phone-tile svg polyline").attr("stroke", "white");
    		phoneCheck = 1;
    	}
    	else {
			$(".unchecked-phone-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-phone-tile svg polyline").attr("stroke", "#757575");
    		phoneCheck = 0;
    	}
	});

	$('[id=shop-landscape]').click(function() {
    	$(".unchecked-shop-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (shopCheck === 0){
			$(".unchecked-shop-tile svg path").attr("fill", "#F7C001");
    		$(".unchecked-shop-tile svg polyline").attr("stroke", "white");
    		shopCheck = 1;
    	}
    	else {
			$(".unchecked-shop-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-shop-tile svg polyline").attr("stroke", "#757575");
    		shopCheck = 0;
    	}
	});

	$('[id=hang-out-landscape]').click(function() {
    	$(".unchecked-hangout-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (hangoutCheck === 0){
			$(".unchecked-hangout-tile svg path").attr("fill", "#39BAD8");
    		$(".unchecked-hangout-tile svg polyline").attr("stroke", "white");
    		hangoutCheck = 1;
    	}
    	else {
			$(".unchecked-hangout-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-hangout-tile svg polyline").attr("stroke", "#757575");
    		hangoutCheck = 0;
    	}
	});

	$('[id=eat-landscape]').click(function() {
    	$(".unchecked-eat-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (eatCheck === 0){
			$(".unchecked-eat-tile svg path").attr("fill", "#558AD8");
    		$(".unchecked-eat-tile svg polyline").attr("stroke", "white");
    		eatCheck = 1;
    	}
    	else {
			$(".unchecked-eat-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-eat-tile svg polyline").attr("stroke", "#757575");
    		eatCheck = 0;
    	}
	});

	$('[id=other-landscape]').click(function() {
		$('[id=user-text-input]').toggle();
		$('.next').toggle();
    	$(".unchecked-other-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (otherCheck === 0){
			$(".unchecked-other-tile svg path").attr("fill", "#AA75D3");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "white");
    		otherCheck = 1;
    	}
    	else {
			$(".unchecked-other-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "#757575");
    		otherCheck = 0;
    	}
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
 	});
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
 	var stopWatchToggle = 0;
 	var carParkingToggle = 0;
 	var hassleToggle = 0;
 	var otherToggle = 0;

 	$("#person").click(function(){
 		personToggle += 1;

 		if (personToggle === 1) {
 			$("#guy-background").css("fill", "#98CC2D");
 			$("#shirt").css("fill", "#FBDD61");
 			$("#unchecked").hide();
 			$("#checked").show();
 		};

 		if (personToggle === 2) {
			$("#guy-background").css("fill", "#CCCCCC");
			$("#shirt").css("fill", "#A3A3A3");
 			$("#checked").hide();
 			$("#unchecked").show();
 			personToggle = 0;
 		};
 	});


 	$("#stop-watch").click(function(){
 		stopWatchToggle += 1;

 		if (stopWatchToggle === 1) {
 			$("#timer-face").css("fill", "#D05E4B");
 			$("#uncheckedStop").hide();
 			$("#checkedStop").show();
 		};

 		if (stopWatchToggle === 2) {
			$("#timer-face").css("fill", "#BCBCBC");
 			$("#checkedStop").hide();
 			$("#uncheckedStop").show();
 			stopWatchToggle = 0;
 		};
 	});

 	$("#car-parking").click(function(){
 		carParkingToggle += 1;

 		if (carParkingToggle === 1) {
 			$("#grayed").hide();
 			$("#colored").show();
 			$("#uncheckedParking").hide();
 			$("#checkedParking").show();
 		};

 		if (carParkingToggle === 2) {
 			$("#colored").hide();
 			$("#checkedParking").hide();
			$("#grayed").show();
 			$("#uncheckedParking").show();
 			carParkingToggle = 0;
 		};
 	});

 	$("#hassle").click(function(){
 		hassleToggle += 1;

 		if (hassleToggle === 1) {
 			$("#hassle-background").css("fill", "#DD734E");
 			$("#hassle-edge").css("fill", "#DDBD03");
 			$("#hassle-face").css("fill", "#F9D43A");
 			$("#uncheckedHassle").hide();
 			$("#checkedHassle").show();
 		};

 		if (hassleToggle === 2) {
			$("#hassle-background").css("fill", "#BCBCBC");
			$("#hassle-edge").css("fill", "#999999");
			$("#hassle-face").css("fill", "#D8D8D8");
			$("#checkedHassle").hide();
 			$("#uncheckedHassle").show();
 			hassleToggle = 0;
 		};
 	});

 	// $("#other-explain").click(function(){
 		
 	// });
 	// END STRATEGY QUESTIONS
});



