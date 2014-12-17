$(document).ready(function(){
	// TOGGLE ALL
	var clicks = 0;
	$( "#toggle-questions" ).click(function() {
		clicks += 1;
		$("#clicks").text(clicks);
		if (clicks === 1) {
		// 	$( "#distance-questions").show();
		// 	$( "#parking-lot" ).hide();
		// 	$( "#mission-intro").hide();
		// 	$( "#strategy-questions").hide();
		// 	$( "#lines" ).hide();
  // 		$( "#cars" ).hide();
		// 	$( "#dashboard").hide();
		// }
		// else if (clicks === 2) {
			$( "#distance-questions" ).hide();
  		$( "#mission-intro" ).show();
  	}
		else if (clicks === 2) {
			$( "#strategy-questions").show();
			$( "#distance-questions").hide();
			$( "#mission-intro").hide();
			$( "#parking-lot" ).hide();
			$( "#lines" ).hide();
  		$( "#cars" ).hide();
			$( "#dashboard").show();
			$('body').trigger('startDashboardAnimation');
		}
		else if (clicks === 3) {
			$( "#strategy-questions").hide();
			$( "parking-lot" ).show();
  		$( "#lines" ).show();
  		$( "#cars" ).show();
  		$( "#tile-questions" ).show();
		}
		else if (clicks === 4) {
			$( "#tile-questions" ).hide();
			$( "#clock-questions" ).show();
		}
		else if (clicks === 5) {
			$( "parking-lot" ).hide();
			$( "#lines" ).hide();
  		$( "#cars" ).hide();
  		$( "#clock-questions" ).hide();
			$( "#icon-questions" ).show();
		}
		else if (clicks === 6) {
			$( "#icon-questions" ).hide();
			// $( "#parking-lot" ).show();
			// $( "#lines" ).show();
  		// $( "#cars" ).show();
			$( "#spinner-questions" ).show();
		}
		else if (clicks === 7) {
			$( "parking-lot" ).hide();
			$( "#lines" ).hide();
  		$( "#cars" ).hide();
			$( "#spinner-questions" ).hide();
			$( "#interactive-map" ).show();
		}
		else if (clicks === 8) {
			$( "#interactive-map" ).hide();
			$( "#successful-pickup" ).show();
			$( "#dashboard" ).hide();
		}
		else if (clicks === 9) {
			$( "#successful-pickup" ).hide();
			$( "#circle-pickup" ).show();
			$( "#dashboard" ).show();
		}
		else if (clicks === 10) {
			$( "#circle-pickup" ).hide();
			$( "#timer-pickup" ).show();
		}
		else if (clicks === 11) {
			$( "#timer-pickup" ).hide();
			$( ".red-car" ).toggleClass('animate', false);
			$( "#distance-questions").show();
			clicks = 0;
		}
	});
	// END TOGGLE ALL


	// DISTANCE QUESTIONS
	$("#circle-1").click(function(){
		$("#house").animate({
			"bottom":"341px"
		});
	});

	$("#circle-2").click(function(){
		$("#house").animate({
			"bottom":"281px"
		});
	});

	$("#circle-3").click(function(){
		$("#house").animate({
			"bottom":"221px"
		});
	});

	$("#circle-4").click(function(){
		$("#house").animate({
			"bottom":"161px"
		});
	});

	$("#circle-5").click(function(){
		$("#house").animate({
			"bottom":"101px"
		});
	});
	// END DISTANCE QUESTIONS




	// TILE QUESTIONS
	$('[id=other-info]').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});
	$('[id=other-info-small]').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('[id=char-count-small]').text(cs + " characters left");
	});
	$('[id=other-strategy]').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('[id=char-count-strategy]').text(cs);
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
		   			$("#parking-lot").fadeIn();
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
		   			$("#parking-lot").fadeIn();
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
 	
 	var guyToggle = 0;
 	var stopWatchToggle = 0;
 	var carParkingToggle = 0;
 	var hassleToggle = 0;
 	var otherToggle = 0;

 	$('#guy').click(function(){
 		if(guyToggle === 0){
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "#98CC2D");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "0");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#FFFFFF");
 			$("#guy-answer").css("color", "#98CC2D");
 			$("#guy-background").css("fill", "#98CC2D");
	 		$("#shirt").css("fill", "#FBDD61");
 			guyToggle += 1;
 		}
 		else {
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "none");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "2.963,4.9383");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#757575");
 			$("#guy-answer").css("color", "#BCBCBC");
 			$("#guy-background").css("fill", "#CCCCCC");
			$("#shirt").css("fill", "#A3A3A3");
 			guyToggle = 0;
 		}
 	});

 	$('#stopwatch').click(function(){
 		if(stopWatchToggle === 0){
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "#D05E4B");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "0");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#FFFFFF");
 			$("#stopwatch-answer").css("color", "#D05E4B");
 			$("#timer-face").css("fill", "#D05E4B");
 			stopWatchToggle += 1;
 		}
 		else {
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "none");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "2.963,4.9383");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#757575");
 			$("#stopwatch-answer").css("color", "#BCBCBC");
 			$("#timer-face").css("fill", "#BCBCBC");
 			stopWatchToggle = 0;
 		}
 	});

 	$('#no-parking').click(function(){
 		if(carParkingToggle === 0){
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "#2FA3CA");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "0");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#FFFFFF");
 			$("#parking-answer").css("color", "#2FA3CA");
 			$(".parking-background").css("fill", "#2FA3CA");
 			$(".car-color").css("fill", "#FCC859")
 			$("#parking-sign-bg").css("fill", "#24B7EA");
 			carParkingToggle += 1;
 		}
 		else {
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "none");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "2.963,4.9383");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#757575");
 			$("#parking-answer").css("color", "#BCBCBC");
			$(".parking-background").css("fill", "#BCBCBC");
			$(".car-color").css("fill", "#CCCCCC")
			$("#parking-sign-bg").css("fill", "#CCCCCC");
 			carParkingToggle = 0;
 		}
 	});

 	$('#hassle').click(function(){
 		if(hassleToggle === 0){
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "#DD734E");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "0");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#FFFFFF");
 			$("#hassle-answer").css("color", "#DD734E");
 			$("#hassle-background").css("fill", "#DD734E");
 			$("#hassle-edge").css("fill", "#DDBD03");
 			$("#hassle-face").css("fill", "#F9D43A");
 			hassleToggle += 1;
 		}
 		else {
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "none");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "2.963,4.9383");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#757575");
 			$("#hassle-answer").css("color", "#BCBCBC");
 			$("#hassle-background").css("fill", "#BCBCBC");
			$("#hassle-edge").css("fill", "#999999");
			$("#hassle-face").css("fill", "#D8D8D8");
 			hassleToggle = 0;
 		}
 	});

 	$('#strategy-other').click(function(){
 		if(otherToggle === 0){
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "#FFD93B");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "0");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#FFFFFF");
 			$("#other-strategy-answer").css("color", "#F29532");
 			$("#pencil-left").css("fill", "#F0822C");
 			$("#pencil-middle").css("fill", "#F29532");
 			$("#pencil-right").css("fill", "#F3B43C");
 			$("#text-container").animate({width: '98%'}, function(){
 				$(this).css({
 					"position":"absolute"
 				});
 			});
 			$("#text-container-filler").animate({width: '0%'});
 			$("#slide-content").fadeIn();
 			otherToggle += 1;
 		}
 		else {
 			$(this).siblings(0).children().children("g").children("circle").css("fill", "none");
 			$(this).siblings(0).children().children("g").children("circle").css("stroke-dasharray", "2.963,4.9383");
 			$(this).siblings(0).children().children("polyline").css("stroke", "#757575");
 			$("#other-strategy-answer").css("color", "#BCBCBC");
 			$("#pencil-left").css("fill", "#777777");
 			$("#pencil-middle").css("fill", "#919191");
 			$("#pencil-right").css("fill", "#B7B7B7");
 			$("#text-container").animate({width: '0%'});
 			$("#text-container-filler").animate({width: '98%'});
 			$("#slide-content").fadeOut();
 			otherToggle = 0;
 		}
 	});
 	// END STRATEGY QUESTIONS
});



