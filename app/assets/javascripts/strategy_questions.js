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
});