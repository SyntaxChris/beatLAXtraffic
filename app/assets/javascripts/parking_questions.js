$(document).ready(function(){

	var carPark = 0;
	var avoidTraffic = 0;
	var people = 0;
	var otherPark = 0;
	var $body = $('body');
	
	$body.on('click', '.parking-bubble', function(){


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
			$(".next#why-park").fadeIn();
		} 
		else {
			$(".next#why-park").fadeOut();
		}
	});
    
	var toggleOther = 0;


	var icon = $('.other-icon')[0];

    $body.on('click', ".parking-bubble-other", function(){
			$(this).animate({height: "250px"});
			$('.other-description').text("Please write here");
			$("[id='char-count']").fadeIn();
			$(".parking-other-text-area").fadeIn();
			$('.parking-ok-btn').fadeIn();
			$('.other-icon').hide();
			$(".next#why-park").hide();
	    	toggleOther = 1;
	    	otherPark = 0;
	});

    
    $body.on('click', ".parking-ok-btn", function(e){
    	e.stopPropagation();
    	

    	if($('#other-info').val() !== ""){
    		$('.parking-bubble-other .parking-question-other-font').css('color', '#AA75D3');
			$('.parking-bubble-other .circle-state').css('fill', '#AA75D3');
			$('.parking-bubble-other .circle-state').css('stroke-width', 0);
			$('.parking-bubble-other .checkmark-fill').css('stroke', 'white');	
			$(".next#why-park").fadeIn();
			otherPark = 1;
    	}else{
    		$('.parking-bubble-other .parking-question-other-font').css('color', '#A0A0A0');
			$('.parking-bubble-other .circle-state').css('fill', '#FFFFFF');
			$('.parking-bubble-other .circle-state').css('stroke-width', 3);
			$('.parking-bubble-other .checkmark-fill').css('stroke', '#757575');
			otherPark = 0;	
    	}

    	$( ".parking-question-other-font").text("Other (Specify)");
    	$(".parking-bubble-other").animate({height: "100px"});
		$("[id='char-count']").fadeOut();
		$(".parking-other-text-area").fadeOut();
		$(".parking-ok-btn").fadeOut();
		
  	})
});

