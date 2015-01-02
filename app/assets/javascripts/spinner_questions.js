$(document).ready(function(){
	$('#spin-button').click(function(){
		chanceLogic = Math.floor(Math.random()*2);

	 	if (chanceLogic === 1){
	 		$("#wheel").addClass("full");
		 	setTimeout(
		 		function(){
		   			$("#full").css("fill", "red");
		   			$("#spin-button").hide();
		   			$("#parking-lot").fadeIn();
		   			$("#lines").fadeIn();
		   			$("#cars").fadeIn();
		   			$("#chance-time").hide();
		   			$("#try-again").show();
		  		}, 6000
		  	);
	 	}
	 	else {
	 		$("#wheel").addClass("not-full");
	 		setTimeout(
		 		function(){
		 			$("#chance-time").hide();
		 			$("#spin-button").hide();
		 			$("#try-again").hide();
		 			$("#parking-congrats").show();
		 			$("#spinner-components").hide();
		 			$("#parking-trophy").fadeIn();
		   			$("#not-full").css("fill", "red");
		   			$("#parking-lot").fadeIn();
		   			$("#lines").fadeIn();
		  		}, 6000
	  		);
	 	}
 	});

 	$("#yup-spinner").click(function(){
 		$("#try-again").hide();
 		$("#lines").hide();
 		$("#cars").hide();
 		$("#chance-time").show();
 		$("#spin-button").show();
 		$("#wheel").removeClass("full");
 		$("#full").css("fill", "#ECF0F1");
 	});
});