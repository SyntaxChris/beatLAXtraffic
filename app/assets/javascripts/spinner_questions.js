$(document).ready(function(){
	var $body = $('body');

		$body
			.on('click', '#spin-pickup-win', handleNextNode)
			.on('click', '#spin-pickup-lose', handleNextNode);


	function handleNextNode(e){
		e.preventDefault();
		e.stopImmediatePropagation();

		var result = $(this).data('result');

		var node = '4';
		if (result == 'yes') {
			node = '14';
		}

		$body.trigger('findSpecificNode',[node]);
		resetSpinner();
	}


 	$body.on('click', '.spin-button', function(){
 		var spinButtonId = $(this).attr("id");
 		var parkingLogic = $('#parking-chance').data('outcome');
 		var pickupLogic = $('#pickup-chance').data('outcome');

		// var parkingLogic = Math.floor(Math.random()*2);

		// parking spinner
		if(spinButtonId === 'parking'){
			if (parkingLogic === 1){
		 		$(".wheel").addClass("full");
				setTimeout(
			 		function(){
			   			$(".lose.parking").css('fill', 'red');
			   			$(".full-font").css('fill', 'white');
			  		}, 3000
			  	);
			 	setTimeout(
			 		function(){
			   			$(".spin-button").hide();
			   			$(".spinner-components").hide();
			   			$(".chance-time").hide();
			   			$(".fail").show();
			   			$(".failed-spin").fadeIn();
			   			$("#parking-lot").fadeIn();
			   			$("#lines").fadeIn();
			   			$("#cars").fadeIn();
			  		}, 3700
			  	);
		 	}
		 	else {
		 		$(".wheel").addClass("not-full");

	            setTimeout(
			 		function(){
			   			$(".win.parking").css('fill', '#00FF00');
			   			$(".yes-font").css('fill', 'white');
			  		}, 3000
			  	);

		 		
		 		setTimeout(
			 		function(){
			 			$(".chance-time").hide();
			 			$(".spin-button").hide();
			 			$(".fail").hide();
			 			$(".congrats").show();
			 			$(".spinner-components").hide();
			 			$(".trophey").fadeIn();
			   			$(".win").css("fill", "red");
			   			$("#parking-lot").fadeIn();
			   			$("#lines").fadeIn();
			  		}, 3700
		  		);
		 	}
		}

		// pickup spinner
		else if (spinButtonId === 'pickup'){
			if (pickupLogic === 1){
		 		$(".wheel").addClass("not-there");
				setTimeout(
			 		function(){
			   			$(".lose").css('fill', 'red');
			   			$(".lose-txt").css('fill', 'white');
			  		}, 3000
			  	);
			 	setTimeout(
			 		function(){
			   			$(".spin-button").hide();
			   			$(".spinner-components").hide();
			   			$(".chance-time").hide();
			   			$(".fail").show();
			   			$(".failed-spin").fadeIn();
			  		}, 3700
			  	);
		 	}
		 	else {
		 		$(".wheel").addClass("there");
	            setTimeout(
			 		function(){
			   			$(".win").css('fill', '#00FF00');
			  		}, 3000
			  	);
		 		setTimeout(
			 		function(){
			 			$(".chance-time").hide();
			 			$(".spin-button").hide();
			 			$(".fail").hide();
			 			$(".congrats").show();
			 			$(".spinner-components").hide();
			 			$(".trophey").fadeIn();
			   			$(".win").css("fill", "red");
			   			$("#lines").fadeIn();
			  		}, 3700
		  		);
		 	}
		}
 	});



 	function resetSpinner(){
    	$(".failed-spin").hide();
 		$(".wheel").removeClass("full");
 		$(".wheel").removeClass("not-full");
 		$(".wheel").removeClass("there");
 		$(".wheel").removeClass("not-there");
 		$(".lose").css("fill", "#AAAAAA");
 		$(".win").css("fill", "#ECF0F1");
 		$(".win.parking").css("fill", "#AAAAAA");
 		$(".lose.parking").css("fill", "#ECF0F1");
 		$(".yes-font").css("fill", "#AAAAAA");
 		$(".full-font").css("fill", "#D89235");
 		$(".chance-time").show();
		$(".spin-button").show();
		$(".spinner-components").show();
		$(".fail").hide();
		$(".congrats").hide();
		$(".trophey").hide();
 	}
 	

});