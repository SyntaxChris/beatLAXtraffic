$(document).ready(function(){
	var carPark = 0;
	var avoidTraffic = 0;
	var people = 0;
	var otherPark = 0;
	
	$('.parking-bubble').click(function(){

		var bubbleLogoId = $(".bubble-logo svg", this).attr("id");

		switch(bubbleLogoId){
			case 'car-park':
				if(carPark === 0){
					carPark = 1;
				}
				else{
					carPark = 0;
				};

				$('.circle-state', this).attr('data-car', 
	    			$('.circle-state', this).attr('data-car') === 'open' ? 'closed' : 'open'
	    		);

	    		$('.bubble-fill', this).attr('data-car', 
	    			$('.bubble-fill', this).attr('data-car') === 'unfilled' ? 'filled' : 'unfilled'
	    		);

	    		$('.checkmark-fill', this).attr('data-car',
	    			$('.checkmark-fill', this).attr('data-car') === 'gray' ? 'white' : 'gray'
	    		);

	    		$('.parking-question-font', this).attr('data-car',
	    			$('.parking-question-font', this).attr('data-car') === 'colored' ? 'uncolored' : 'colored'
	    		);

	    		break;

	    	case 'avoid-traffic':
	    		if(avoidTraffic === 0){
					avoidTraffic = 1;
				}
				else{
					avoidTraffic = 0;
				};

	    		$('.circle-state', this).attr('data-traffic', 
	    			$('.circle-state', this).attr('data-traffic') === 'open' ? 'closed' : 'open'
	    		);

	    		$('#traffic-fill', this).attr('data-traffic', 
	    			$('#traffic-fill', this).attr('data-traffic') === 'unfilled' ? 'filled' : 'unfilled'
	    		);

	    		$('.checkmark-fill', this).attr('data-traffic',
	    			$('.checkmark-fill', this).attr('data-traffic') === 'gray' ? 'white' : 'gray'
	    		);

	    		$('.parking-question-font', this).attr('data-traffic',
	    			$('.parking-question-font', this).attr('data-traffic') === 'colored' ? 'uncolored' : 'colored'
	    		);

	    		break;

	    	case 'people':
	    		if(people === 0){
					people = 1;
				}
				else{
					people = 0;
				};

	    		$('.circle-state', this).attr('data-people', 
	    			$('.circle-state', this).attr('data-people') === 'open' ? 'closed' : 'open'
	    		);

	    		$('#people-fill', this).attr('data-people', 
	    			$('#people-fill', this).attr('data-people') === 'unfilled' ? 'filled' : 'unfilled'
	    		);

	    		$('.checkmark-fill', this).attr('data-people',
	    			$('.checkmark-fill', this).attr('data-people') === 'gray' ? 'white' : 'gray'
	    		);

	    		$('.parking-question-font', this).attr('data-people',
	    			$('.parking-question-font', this).attr('data-people') === 'colored' ? 'uncolored' : 'colored'
	    		);

	    		break;	
		}

		var parkingIconTally = carPark + avoidTraffic + people + otherPark;

		if (parkingIconTally > 0){
			$(".parking-next").fadeIn();
		} 
		else {
			$(".parking-next").fadeOut();
		}
	});
    
	var toggleOther = 0;

    $(".parking-question-other-font").click(function(){
    	if(toggleOther === 0){
			$(".parking-bubble-other").animate({height: "250px"});
			$(this).text("Please write here");
			$(this).animate({top: "5%"});
			$('.other-icon').fadeOut();
			$("[id='char-count']").fadeIn();
			$(".parking-other-text-area").fadeIn();
			$('.parking-submit').fadeIn();
	    	toggleOther = 1;
    	}
    	else {
	    	$(".parking-bubble-other").animate({height: "100px"});	
			$( ".parking-question-other-font").text("Other (Specify)");
			$(".parking-question-other-font").animate({top: "5%"});
			$("[id='char-count']").fadeOut();
			$(".parking-other-text-area").fadeOut();
			$('.parking-submit').fadeOut();
			$('.other-icon').show();
			$('.parking-bubble-other .circle-state').css('fill', '#FFFFFF');
			$('.parking-bubble-other .circle-state').css('stroke-width', 3);
			$('.parking-bubble-other .checkmark-fill').css('stroke', '#757575');
	    	$('.parking-bubble-other .parking-question-other-font').css('color', '#A0A0A0');
	    	otherPark = 0;
	    	toggleOther = 0;
    	};
	});

    

    $(".parking-submit").click(function(){
    	otherPark = 1;
    	$('.parking-bubble-other .circle-state').css('fill', '#AA75D3');
		$('.parking-bubble-other .circle-state').css('stroke-width', 0);
		$('.parking-bubble-other .checkmark-fill').css('stroke', 'white');
    	$('.parking-bubble-other .parking-question-other-font').css('color', '#AA75D3');
    	$(".parking-bubble-other").animate({height: "100px"});	
		$( ".parking-question-other-font").text("Other (Specify)");
		$(".parking-question-other-font").animate({top: "5%"});
		$("[id='char-count']").fadeOut();
		$(".parking-other-text-area").fadeOut();
		$(".parking-submit").fadeOut();
		$(".parking-next").fadeIn();
    });
});

