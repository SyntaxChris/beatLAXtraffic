$(document).ready(function(){
	var $body = $('body');

	$body.on('click', ".clone-container", function(){
		alert("clone container!");
	});

	$body.on('click', ".icon-holder svg", function(){
		$(".selection-container").fadeIn();
	});

	$body.on('click', ".yea, .nah", function(){
		$(".selection-container").fadeOut();
	});



	// var tallyIcons = 0,
	// 		$body = $('body');

	// $body.on('click', ".icon", function() {
 // 		var iconChosen = $(this);
 // 		var iconBackground = $("svg .icon-background", this);
 // 		var description = iconChosen.text();
 // 		var removeBind = function(){
 // 			$("#yea").unbind( "click" );
	// 		$("#nah").unbind( "click" );
	// 		$("#yea-small").unbind( "click" );
	// 		$("#nah-small").unbind( "click" );
 // 		};

 //        if ($("#holder-1").children().attr("id") !== iconChosen.attr("id") &&
 //        	$("#holder-2").children().attr("id") !== iconChosen.attr("id") &&
 //        	$("#holder-3").children().attr("id") !== iconChosen.attr("id"))
 //        {

 //        	if(tallyIcons <= 2){
	//         	$("#icon-description").html(description);
	// 			$("#icon-description-small").html(description);
	// 			$("#icon-pop-up").fadeIn();
	// 			$("#icon-pop-up-small").fadeIn();
 //        	};
        
	// 		$body.on('click', "#yea", function(){
	// 			tallyIcons += 1;
	// 			if(tallyIcons > 2){
	// 				$(".submit-row").fadeIn();
	// 				$(".i-want").hide();
	// 				$("#discription-group").hide();
	// 			}

	// 			if ($("#holder-1").children().attr("class") !== "icon") {
	// 				iconChosen.clone().appendTo("#holder-1");
	// 				$( "#icon-pop-up").hide();
	// 				$("#holder-1").children().children(".remove-icon").fadeIn();
	// 			}
	// 			else if ($("#holder-2").children().attr("class") !== "icon") {
	// 	            iconChosen.clone().appendTo("#holder-2");
	// 	            $( "#icon-pop-up").hide();
	// 	            $("#holder-2").children().children(".remove-icon").fadeIn();
	// 			}
	// 			else if ($("#holder-3").children().attr("class") !== "icon") {
	// 	            iconChosen.clone().appendTo("#holder-3");
	// 	            $( "#icon-pop-up").hide();
	// 	            $("#holder-3").children().children(".remove-icon").fadeIn();
	// 			}

	// 			iconBackground.css("fill", "#CCCCCC");

	// 			// Remove listners.
	// 			removeBind();
	// 		});

	// 		$body.on('click', "#yea-small", function(){
	// 			tallyIcons += 1;
	// 			if(tallyIcons > 2){
	// 				$(".submit-row").fadeIn();
 //                    $(".i-want").hide();
	// 				$("#discription-group").hide();

	// 				if ($("#holder-1-small").children().attr("class") !== "icon") {
	// 					iconChosen.clone().appendTo("#holder-1-small");
	// 					$("#holder-1-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 				else if ($("#holder-2-small").children().attr("class") !== "icon") {
	// 	            	iconChosen.clone().appendTo("#holder-2-small");
	// 	            	$("#holder-2-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 				else if ($("#holder-3-small").children().attr("class") !== "icon") {
	// 	            	iconChosen.clone().appendTo("#holder-3-small");
	// 	            	$( ".submit-row-small" ).fadeIn();
	// 	            	$(".i-want").hide();
	// 	            	$("#holder-3-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 			}
	// 			else {
	// 				if ($("#holder-1-small").children().attr("class") !== "icon") {
	// 					iconChosen.clone().appendTo("#holder-1-small");
	// 					$( "#icon-pop-up-small").hide();
	// 					$("#holder-1-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 				else if ($("#holder-2-small").children().attr("class") !== "icon") {
	// 		            iconChosen.clone().appendTo("#holder-2-small");
	// 		            $( "#icon-pop-up-small").hide();
	// 		            $("#holder-2-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 				else if ($("#holder-3-small").children().attr("class") !== "icon") {
	// 		            iconChosen.clone().appendTo("#holder-3-small");
	// 		            $( "#icon-pop-up-small").hide();
	// 		            $( ".submit-row-small" ).fadeIn();
	// 		            $(".i-want").hide();
	// 		            $("#holder-3-small").children().children(".remove-icon").fadeIn();
	// 				}
	// 			}


	// 			iconBackground.css("fill", "#CCCCCC");

	// 			// Remove listners.
	// 			removeBind();
	// 		});

	// 		$body.on('click', "#nah", function(){
	// 			$( "#icon-pop-up").hide();
	// 			// Remove listeners.
	// 			removeBind();
	// 		});
	// 		$body.on('click', "#nah-small", function(){
	// 			$( "#icon-pop-up-small").hide();
	// 			// Remove listeners.
	// 			removeBind();
	// 		});
 //        };
	// });

	// $body.on('click', "#holder-1", function(){
	// 	if($(this).html() !== ""){
	// 		tallyIcons -= 1
	// 	}
	// 	if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();
	// 	$("#discription-group").fadeIn();
	// });
	// $body.on('click', "#holder-1-small", function(){
	// 	if(tallyIcons > 0){
	// 		tallyIcons -= 1
	// 	}
 //        if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();	
	// 	$("#discription-group").fadeIn();	
	// });

	// $body.on('click', "#holder-2", function(){
	// 	if(tallyIcons > 0){
	// 		tallyIcons -= 1
	// 	}
	// 	if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();
	// 	$("#discription-group").fadeIn();
	// });

	// $body.on('click', "#holder-2-small", function(){
	// 	if(tallyIcons > 0){
	// 		tallyIcons -= 1
	// 	}
	// 	if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();
	// 	$("#discription-group").fadeIn();
	// });

	// $body.on('click', "#holder-3", function(){
	// 	if(tallyIcons > 0){
	// 		tallyIcons -= 1
	// 	}
	// 	if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();
	// 	$("#discription-group").fadeIn();
	// });
	// $body.on('click', "#holder-3-small", function(){
	// 	if(tallyIcons > 0){
	// 		tallyIcons -= 1
	// 	}
	// 	if($(this).children().attr("id") === "dog"){
	// 		$("#dog svg .icon-background").css("fill", "#E56F6A" );
	// 	}
	// 	else if($(this).children().attr("id") === "couch"){
	// 		$("#couch svg .icon-background").css("fill", "#E0905A" );
	// 	}
	// 	else if($(this).children().attr("id") === "family"){
	// 		$("#family svg .icon-background").css("fill", "#EACC4E" );			
	// 	}
	// 	else if($(this).children().attr("id") === "computer"){
	// 		$("#computer svg .icon-background").css("fill", "#36BFBF" );			
	// 	}
	// 	else if($(this).children().attr("id") === "food"){
	// 		$("#food svg .icon-background").css("fill", "#C94343");
	// 	}
	// 	else if($(this).children().attr("id") === "wifi"){
	// 		$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
	// 	}
	// 	else if($(this).children().attr("id") === "parking"){
	// 		$("#parking svg .icon-background").css("fill", "#37B3DD" );			
	// 	}
	// 	else if($(this).children().attr("id") === "exit"){
	// 		$("#exit svg .icon-background").css("fill", "#4284A8" );			
	// 	}
	// 	else if($(this).children().attr("id") === "help-desk"){
	// 		$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
	// 	}

	// 	$(this).empty();
	// 	$( "#icon-pop-up-small").hide();
	// 	$(".submit-row").hide();
	// 	$(".i-want").fadeIn();
	// 	$("#discription-group").fadeIn();
	// });
});