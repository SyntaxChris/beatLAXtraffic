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
		var chanceLogic = Math.floor(Math.random()*2);



		// parking spinner
		if(spinButtonId === 'parking'){
			if (chanceLogic === 1){
		 		$(".wheel").addClass("full");
				setTimeout(
			 		function(){
			   			$(".lose.parking").css('fill', 'red');
			   			$(".full-font").css('fill', 'white');
			  		}, 6000
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
			  		}, 6700
			  	);
		 	}
		 	else {
		 		$(".wheel").addClass("not-full");

	            setTimeout(
			 		function(){
			   			$(".win.parking").css('fill', 'red');
			   			$(".yes-font").css('fill', 'white');
			  		}, 6000
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
			  		}, 6700
		  		);
		 	}
		}

		// pickup spinner
		else if (spinButtonId === 'pickup'){
			if (chanceLogic === 1){
		 		$(".wheel").addClass("not-there");


				setTimeout(
			 		function(){
			   			$(".lose").css('fill', 'red');
			  		}, 6000
			  	);


			 	setTimeout(
			 		function(){
			   			$(".spin-button").hide();
			   			$(".spinner-components").hide();
			   			$(".chance-time").hide();
			   			$(".fail").show();
			   			$(".failed-spin").fadeIn();
			  		}, 6700
			  	);
		 	}
		 	else {
		 		$(".wheel").addClass("there");

	            setTimeout(
			 		function(){
			   			$(".win").css('fill', 'red');
			   			$(".yes-font").css('fill', 'white');
			  		}, 6000
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
			  		}, 6700
		  		);
		 	}
		}
 	});



 	function resetSpinner(){
    	$(".failed-spin").hide();
 		// $(".wheel").removeClass("full");
 		// $(".wheel").removeClass("not-full");
 		// $(".wheel").removeClass("there");
 		$(".wheel").removeClass("not-there");
 		$(".lose").css("fill", "#AAAAAA");
 		$(".win").css("fill", "#ECF0F1");
 		// $(".win.parking").css("fill", "#AAAAAA");
 		// $(".lose.parking").css("fill", "#ECF0F1");
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