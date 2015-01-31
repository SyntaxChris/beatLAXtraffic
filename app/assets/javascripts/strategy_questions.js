$(document).ready(function(){
	var guy = 0,
		stopwatch = 0,
		noParking = 0,
		hassle = 0,
		other = 0,
		$body = $('body');

 	$body.on('click', '.strategy-bbl.other-bbl', function(){
 		
 		$(this).animate({
 			width: '220%',
 			left: '-160%',
 		});
 		$('.strategy-icon', this).css({
 			'padding-right': '5%',
 			'text-align': 'right'
 		});
 		$('.strategy-icon svg', this).animate({
 			width: '14%',
 		}, 400);
 		$('.bbl-title', this).animate({
 			'margin-top': '2%'
 		});
 		$('.bbl-title', this).css({
 			'text-align': 'right',
 			'right': '3%'
 		});
 		$('.other-text-form').delay(250).fadeIn();
 	});

 	$body.on('click', '#save, #cancel', function(){
 		var thisId = $(this).attr('id');
 		var checkmark = $(this).parents().eq(4).find('.checkmark');

 		
 		if(thisId === 'save' && $('textarea#strategy-text').val() !== ""){
 			checkmark.find('circle').css('fill', '#F0943F');
 			checkmark.find('circle').css('stroke-width', '0');
 			checkmark.find('polyline').css('stroke', 'white');
 			$("#pencil-left").css("fill", "#F0822C");
			$("#pencil-middle").css("fill", "#F29532");
			$("#pencil-right").css("fill", "#F3B43C");
			other = 1;

 		}else{
 			checkmark.find('circle').css('fill', '#FFFFFF');
 			checkmark.find('circle').css('stroke-width', '3');
 			checkmark.find('polyline').css('stroke', '#757575');
 			$("#pencil-left").css("fill", "#777777");
			$("#pencil-middle").css("fill", "#919191");
			$("#pencil-right").css("fill", "#B7B7B7");
			$('textarea#strategy-text').val('')
			other = 0;
 		}

 		var total = guy + stopwatch + noParking + hassle + other;

		if(total > 0){
			$('.strategy-text').fadeIn();
		}else{
			$('.strategy-next').fadeOut();
		}


 		$('.strategy-bbl.other-bbl').animate({
 			width: '65%',
 			left: '0',
 		});
        $('.strategy-bbl.other-bbl .strategy-icon').css({
        	'padding-right': '0',
 			'text-align': 'center'
 		});
 		$('.strategy-bbl.other-bbl .strategy-icon svg').animate({
 			width: '50%',
 		});
 		$('.strategy-bbl.other-bbl .bbl-title').animate({
 			'margin-top': '0',
 			'padding-right': '0',
 			// 'padding-bottom': '10%'
 		});
 		$('.strategy-bbl.other-bbl .bbl-title').css({
 			'text-align': 'center'
 		});
 		$('.other-text-form').fadeOut(350);

 	});

 	$body.on('click', '.text-form-btn, textarea', function(e){
 		e.stopPropagation();
 	});


 	$body.on('click', '.strategy-bbl', function(){
 		var bubbleId = $(this).find('.strategy-icon').children().attr('id'),
        	checkmark = $(this).parents().eq(0).find('.checkmark'),
        	font = $('.bbl-title', this);

 		switch(bubbleId){
 			case 'guy':
 				if(guy === 0){
 					checkmark.find('circle').css('fill', '#98CC2D');
 					checkmark.find('circle').css('stroke-width', '0');
 					checkmark.find('polyline').css('stroke', 'white');
 					$("#guy-answer").css("color", "#98CC2D");
 			        $("#guy-background").css("fill", "#98CC2D");
 			        font.css('color', '#98CC2D');
 					guy = 1;
 				}else{
 					checkmark.find('circle').css('fill', '#FFFFFF');
 					checkmark.find('circle').css('stroke-width', '3');
 					checkmark.find('polyline').css('stroke', '#757575');
 					$("#guy-answer").css("color", "#BCBCBC");
 			        $("#guy-background").css("fill", "#CCCCCC");
 			        font.css('color', '#BCBCBC');
 					guy = 0;
 				}
 			break;

 			case 'stopwatch':
 			 	if(stopwatch === 0){
 			 		checkmark.find('circle').css('fill', '#D05E4B');
 					checkmark.find('circle').css('stroke-width', '0');
 					checkmark.find('polyline').css('stroke', 'white');
		 			$("#stopwatch-answer").css("color", "#D05E4B");
		 			$("#timer-face").css("fill", "#D05E4B");
		 			font.css('color', '#D05E4B');
 					stopwatch = 1;
 				}else{
 					checkmark.find('circle').css('fill', '#FFFFFF');
 					checkmark.find('circle').css('stroke-width', '3');
 					checkmark.find('polyline').css('stroke', '#757575');
		 			$("#stopwatch-answer").css("color", "#BCBCBC");
		 			$("#timer-face").css("fill", "#BCBCBC");
		 			font.css('color', '#BCBCBC'); 					
 					stopwatch = 0;
 				}
 			break;

 			case 'no-parking':
 			 	if(noParking === 0){
 			 		checkmark.find('circle').css('fill', '#2FA3CA');
 					checkmark.find('circle').css('stroke-width', '0');
 					checkmark.find('polyline').css('stroke', 'white');
 					$(".parking-background").css("fill", "#2FA3CA");
 					$(".car-color").css("fill", "#FCC859")
 					$("#parking-sign-bg").css("fill", "#24B7EA");
 					font.css('color', '#2FA3CA');
 					noParking = 1;
 				}else{
 					checkmark.find('circle').css('fill', '#FFFFFF');
 					checkmark.find('circle').css('stroke-width', '3');
 					checkmark.find('polyline').css('stroke', '#757575');
 					$(".parking-background").css("fill", "#BCBCBC");
					$(".car-color").css("fill", "#CCCCCC")
					$("#parking-sign-bg").css("fill", "#CCCCCC");
 					font.css('color', '#BCBCBC');
 					noParking = 0;
 				}
 			break;

 			case 'hassle':
 			 	if(hassle === 0){
 			 		checkmark.find('circle').css('fill', '#F9D43A');
 					checkmark.find('circle').css('stroke-width', '0');
 					checkmark.find('polyline').css('stroke', 'white');
 					$("#hassle-answer").css("color", "#DD734E");
 					$("#hassle-background").css("fill", "#DD734E");
 					$("#hassle-edge").css("fill", "#DDBD03");
 					$("#hassle-face").css("fill", "#F9D43A");
 					font.css('color', '#DDBD03');
 					hassle = 1;
 				}else{
 					checkmark.find('circle').css('fill', '#FFFFFF');
 					checkmark.find('circle').css('stroke-width', '3');
 					checkmark.find('polyline').css('stroke', '#757575');
 					$("#hassle-answer").css("color", "#BCBCBC");
		 			$("#hassle-background").css("fill", "#BCBCBC");
					$("#hassle-edge").css("fill", "#999999");
					$("#hassle-face").css("fill", "#D8D8D8");
 					font.css('color', '#BCBCBC');
 					hassle = 0;
 				}
 			break;

 		}

 		var total = guy + stopwatch + noParking + hassle + other;
		
		if(total > 0){
			$('.strategy-next').fadeIn();
		}else{
			$('.strategy-next').fadeOut();
		}
 	});




});