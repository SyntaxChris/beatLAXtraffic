$(document).ready(function(){
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
 			$("#text-container").animate({width: '93%'}, function(){
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
 			$("#text-container-filler").animate({width: '93%'});
 			$("#slide-content").fadeOut();
 			otherToggle = 0;
 		}
 	});

	var passengerTog = 0;
	var stopWatchTog = 0;
	var parkingTog = 0;
	var hassleTog = 0;
	var otherTog = 0;
	var otherPop = 0;

	$(".bubble-container-small").click(function(){
		var bubbleId = $(this).attr("id");


		switch(bubbleId){
			case 'passenger':
				if(passengerTog === 0){
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 0);
					$(".check-ctnr svg g .circle-state", this).css("fill", "#98CC2D");
					$(".check-ctnr svg .checkmark", this).css("stroke", "white");
					$(".strategy-answer", this).css("color", "#98CC2D");


 					$("#passenger-background").css("fill", "#98CC2D");
	 				$("#passenger-shirt").css("fill", "#FBDD61");
	 				
					passengerTog += 1;
				}
				else{
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 3);
					$(".check-ctnr svg g .circle-state", this).css("fill", "white");
					$(".check-ctnr svg .checkmark", this).css("stroke", "#757575");
					$(".strategy-answer", this).css("color", "#BCBCBC");
					
 					$("#passenger-background").css("fill", "#CCCCCC");
					$("#passenger-shirt").css("fill", "#A3A3A3");
					passengerTog = 0;
				}
			break;

			case 'stop-watch':
				if(stopWatchTog === 0){
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 0);
					$(".check-ctnr svg g .circle-state", this).css("fill", "#D05E4B");
					$(".check-ctnr svg .checkmark", this).css("stroke", "white");
                    $(".strategy-answer", this).css("color", "#D05E4B");
					
 					$("#face").css("fill", "#D05E4B");

					stopWatchTog += 1;
				}
				else{
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 3);
					$(".check-ctnr svg g .circle-state", this).css("fill", "white");
					$(".check-ctnr svg .checkmark", this).css("stroke", "#757575");
					$(".strategy-answer", this).css("color", "#BCBCBC");

					
 					$("#face").css("fill", "#BCBCBC");

					stopWatchTog = 0;
				}
			break;

			case 'parking':
				if(parkingTog === 0){
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 0);
					$(".check-ctnr svg .checkmark", this).css("stroke", "white");
					$(".check-ctnr svg g .circle-state", this).css("fill", "#2FA3CA");
					$(".strategy-answer", this).css("color", "#2FA3CA");

					$(".parking-background").css("fill", "#2FA3CA");
 					$(".car-color").css("fill", "#FCC859")
 					$("#parking-sign").css("fill", "#24B7EA");
					parkingTog += 1;
				}
				else{
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 3);
					$(".check-ctnr svg g .circle-state", this).css("fill", "white");
					$(".check-ctnr svg .checkmark", this).css("stroke", "#757575");
					$(".strategy-answer", this).css("color", "#BCBCBC");

					$(".parking-background").css("fill", "#BCBCBC");
					$(".car-color").css("fill", "#CCCCCC")
					$("#parking-sign").css("fill", "#CCCCCC");

					parkingTog = 0;
				}
			break;

			case 'hassle':
				if(hassleTog === 0){
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 0);
					$(".check-ctnr svg .checkmark", this).css("stroke", "white");
					$(".check-ctnr svg g .circle-state", this).css("fill", "#FCC859");
					$(".strategy-answer", this).css("color", "#FCC859");

					$("#hassle-bg").css("fill", "#DD734E");
 					$("#edge").css("fill", "#DDBD03");
 					$("#hassle-fce").css("fill", "#F9D43A");
					hassleTog += 1;
				}
				else{
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 3);
					$(".check-ctnr svg g .circle-state", this).css("fill", "white");
					$(".check-ctnr svg .checkmark", this).css("stroke", "#757575");
					$(".strategy-answer", this).css("color", "#BCBCBC");

					$("#hassle-bg").css("fill", "#BCBCBC");
					$("#edge").css("fill", "#999999");
					$("#hassle-fce").css("fill", "#D8D8D8");

					hassleTog = 0;
				}
			break;

			case 's-other':
				if(otherTog === 0){
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 0);
					$(".check-ctnr svg .checkmark", this).css("stroke", "white");
					$(".check-ctnr svg g .circle-state", this).css("fill", "#F0822C");
					$(".strategy-answer", this).css("color", "#F0822C");

					$("#pencil-l").css("fill", "#F0822C");
 					$("#pencil-m").css("fill", "#F29532");
 					$("#pencil-r").css("fill", "#F3B43C");

					otherTog += 1;
				}
				else{
					$(".check-ctnr svg g .circle-state", this).css("stroke-width", 3);
					$(".check-ctnr svg g .circle-state", this).css("fill", "white");
					$(".check-ctnr svg .checkmark", this).css("stroke", "#757575");
					$(".strategy-answer", this).css("color", "#BCBCBC");

					$("#pencil-l").css("fill", "#777777");
 					$("#pencil-m").css("fill", "#919191");
 					$("#pencil-r").css("fill", "#B7B7B7");

 					$("#s-other-ctnr").fadeOut();
 					otherPop = 0;
					otherTog = 0;
				}
				if(otherPop === 0){
					$("#s-other-ctnr").fadeIn();
					otherPop += 1;
				}
			break;
		}

		var showNext = passengerTog + stopWatchTog + parkingTog + hassleTog + otherTog

		if(showNext > 0){
			$(".strategy-submit").fadeIn();
		}
		else{
			$(".strategy-submit").fadeOut();
		}


	});

	$(".save").click(function(){
		if(otherPop === 1){
			$("#s-other-ctnr").fadeOut();
			otherPop = 0;
		}
	});

	$(".cancel").click(function(){
		var hideNext = passengerTog + stopWatchTog + parkingTog + hassleTog

		if(hideNext === 0){
			$(".strategy-submit").fadeOut();
		}

		$("#s-other-ctnr").fadeOut();

		$(".bubble-container-small#s-other .check-ctnr svg g .circle-state").css("stroke-width", 3);
		$(".bubble-container-small#s-other .check-ctnr svg g .circle-state").css("fill", "white");
		$(".bubble-container-small#s-other .check-ctnr svg .checkmark").css("stroke", "#757575");
		$(".bubble-container-small#s-other .strategy-answer").css("color", "#BCBCBC");

		$("#pencil-l").css("fill", "#777777");
		$("#pencil-m").css("fill", "#919191");
		$("#pencil-r").css("fill", "#B7B7B7");

		otherPop = 0;
		otherTog = 0;
	});



});