$(document).ready(function(){
	// $('.spin-button').click(function(){
	// 	chanceLogic = Math.floor(Math.random()*2);

	//  	if (chanceLogic === 1){
	//  		$(".wheel").addClass("full");
	// 	 	setTimeout(
	// 	 		function(){
	// 	   			$(".full").css("fill", "red");
	// 	   			$(".spin-button").hide();
	// 	   			$("#parking-lot").fadeIn();
	// 	   			$("#lines").fadeIn();
	// 	   			$("#cars").fadeIn();
	// 	   			$(".chance-time").hide();
	// 	   			$(".try-again").show();
	// 	  		}, 6000
	// 	  	);
	//  	}
	//  	else {
	//  		$(".wheel").addClass("not-full");
	//  		setTimeout(
	// 	 		function(){
	// 	 			$(".chance-time").hide();
	// 	 			$(".spin-button").hide();
	// 	 			$(".try-again").hide();
	// 	 			$(".congrats").show();
	// 	 			$(".spinner-components").hide();
	// 	 			$(".trophy").fadeIn();
	// 	   			$(".not-full").css("fill", "red");
	// 	   			$("#parking-lot").fadeIn();
	// 	   			$("#lines").fadeIn();
	// 	  		}, 6000
	//   		);
	//  	}
 // 	});

 	$('.spin-button').click(function(){
		chanceLogic = Math.floor(Math.random()*2);
		debugger;
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
		 			$(".chance-time").hide();
		 			$(".spin-button").hide();
		 			$(".fail").hide();
		 			$(".congrats").show();
		 			$(".spinner-components").hide();
		 			$(".trophey").fadeIn();
		   			$(".win").css("fill", "red");
		   			// $("#parking-lot").fadeIn();
		   			$("#lines").fadeIn();
		  		}, 6000
	  		);
	 	}
 	});

 	$(".yup-spinner").click(function(){
 		$(".try-again").hide();
 		$("#lines").hide();
 		$("#cars").hide();
 		$(".chance-time").show();
 		$(".spin-button").show();
 		$(".wheel").removeClass("full");
 		$(".lose").css("fill", "#ECF0F1");
 	});


});