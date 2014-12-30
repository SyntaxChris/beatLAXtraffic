$(document).ready(function(){
	$('.parking-bubble').on('click', function(){

		var bubbleLogoId = $(".bubble-logo svg", this).attr("id");

		switch(bubbleLogoId){
			case 'car-park':
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
	});

	$('[id="parking-bubble-other"]').on('click', function(){
		$('.circle-state', this).attr('data-other', 
			$('.circle-state', this).attr('data-other') === 'open' ? 'closed' : 'open'
		);

		$('.checkmark-fill', this).attr('data-other',
	    	$('.checkmark-fill', this).attr('data-other') === 'gray' ? 'white' : 'gray'
	    );

	    $('.parking-question-other-font', this).attr('data-other',
	    	$('.parking-question-other-font', this).attr('data-other') === 'colored' ? 'uncolored' : 'colored'
	    );
	});	
    

    $( ".parking-question-other-font").on('click', function(){
	    $('[id="parking-bubble-other"]').animate({
			height: "250px"
		});
		$(this).text("Please write here");
		$(this).animate({
			top: "5%"
		});
		$("[id='char-count']").fadeIn();
		$(".parking-other-text-area").fadeIn();
		$(".parking-submit").fadeIn();
		$('.parking-next').fadeOut();
	});

    
    $(".parking-submit").on('click', function(){
    	$('[id="parking-bubble-other"]').clearQueue();
    	$('[id="parking-bubble-other"]').animate({
			height: "100px"
	    });	
		$( ".parking-question-other-font").text("Other (Specify)");
		$(".parking-question-other-font").animate({
			top: "5%"
		});
		$("[id='char-count']").fadeOut();
		$(".parking-other-text-area").fadeOut();
		$(".parking-submit").fadeOut();
		$('.parking-next').fadeIn();

		$('parking-bubble-other .circle-state').attr('data-other', 
			$('parking-bubble-other .circle-state').attr('data-other') === 'open' ? 'closed' : 'open'
		);

		$('parking-bubble-other .checkmark-fill').attr('data-other',
	    	$('parking-bubble-other .checkmark-fill').attr('data-other') === 'gray' ? 'white' : 'gray'
	    );

	    $('parking-bubble-other .parking-question-other-font').attr('data-other',
	    	$('parking-bubble-other .parking-question-other-font').attr('data-other') === 'colored' ? 'uncolored' : 'colored'
	    );
    });
});

