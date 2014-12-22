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

	$('#parking-bubble-other').on('click', function(){
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
});

