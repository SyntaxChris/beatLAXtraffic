$(document).ready(function(){
	var tallyIcons = 0,
			$body = $('body');

	$body.on('click', ".icon", function() {
 		var iconChosen = $(this);
 		var iconBackground = $("svg .icon-background", this);
 		var description = iconChosen.text();
 		var removeBind = function(){
 			$("#yea").unbind( "click" );
			$("#nah").unbind( "click" );
			$("#yea-small").unbind( "click" );
			$("#nah-small").unbind( "click" );
 		};

        if ($("#holder-1").children().attr("id") !== iconChosen.attr("id") &&
        	$("#holder-2").children().attr("id") !== iconChosen.attr("id") &&
        	$("#holder-3").children().attr("id") !== iconChosen.attr("id"))
        {

        	if(tallyIcons <= 2){
	        	$("#icon-description").html(description);
				$("#icon-description-small").html(description);
				$("#icon-pop-up").fadeIn();
				$("#icon-pop-up-small").fadeIn();
        	};
        
			$("#yea").click(function(){
				tallyIcons += 1;
				if(tallyIcons > 2){
					$(".submit-row").fadeIn();
					$(".i-want").hide();
					$("#discription-group").hide();
				}

				if ($("#holder-1").children().attr("class") !== "icon") {
					iconChosen.clone().appendTo("#holder-1");
					$( "#icon-pop-up").hide();
					$("#holder-1").children().children(".remove-icon").fadeIn();
				}
				else if ($("#holder-2").children().attr("class") !== "icon") {
		            iconChosen.clone().appendTo("#holder-2");
		            $( "#icon-pop-up").hide();
		            $("#holder-2").children().children(".remove-icon").fadeIn();
				}
				else if ($("#holder-3").children().attr("class") !== "icon") {
		            iconChosen.clone().appendTo("#holder-3");
		            $( "#icon-pop-up").hide();
		            $("#holder-3").children().children(".remove-icon").fadeIn();
				}

				iconBackground.css("fill", "#CCCCCC");

				// Remove listners.
				removeBind();
			});

			$("#yea-small").click(function(){
				tallyIcons += 1;
				if(tallyIcons > 2){
					$(".submit-row").fadeIn();
                    $(".i-want").hide();
					$("#discription-group").hide();

					if ($("#holder-1-small").children().attr("class") !== "icon") {
						iconChosen.clone().appendTo("#holder-1-small");
						$("#holder-1-small").children().children(".remove-icon").fadeIn();
					}
					else if ($("#holder-2-small").children().attr("class") !== "icon") {
		            	iconChosen.clone().appendTo("#holder-2-small");
		            	$("#holder-2-small").children().children(".remove-icon").fadeIn();
					}
					else if ($("#holder-3-small").children().attr("class") !== "icon") {
		            	iconChosen.clone().appendTo("#holder-3-small");
		            	$( ".submit-row-small" ).fadeIn();
		            	$(".i-want").hide();
		            	$("#holder-3-small").children().children(".remove-icon").fadeIn();
					}
				}
				else {
					if ($("#holder-1-small").children().attr("class") !== "icon") {
						iconChosen.clone().appendTo("#holder-1-small");
						$( "#icon-pop-up-small").hide();
						$("#holder-1-small").children().children(".remove-icon").fadeIn();
					}
					else if ($("#holder-2-small").children().attr("class") !== "icon") {
			            iconChosen.clone().appendTo("#holder-2-small");
			            $( "#icon-pop-up-small").hide();
			            $("#holder-2-small").children().children(".remove-icon").fadeIn();
					}
					else if ($("#holder-3-small").children().attr("class") !== "icon") {
			            iconChosen.clone().appendTo("#holder-3-small");
			            $( "#icon-pop-up-small").hide();
			            $( ".submit-row-small" ).fadeIn();
			            $(".i-want").hide();
			            $("#holder-3-small").children().children(".remove-icon").fadeIn();
					}
				}


				iconBackground.css("fill", "#CCCCCC");

				// Remove listners.
				removeBind();
			});

			$("#nah").click(function(){
				$( "#icon-pop-up").hide();
				// Remove listeners.
				removeBind();
			});
			$("#nah-small").click(function(){
				$( "#icon-pop-up-small").hide();
				// Remove listeners.
				removeBind();
			});
        };
	});

	$("#holder-1").click(function(){
		if($(this).html() !== ""){
			tallyIcons -= 1
		}
		if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();
		$("#discription-group").fadeIn();
	});
	$("#holder-1-small").click(function(){
		if(tallyIcons > 0){
			tallyIcons -= 1
		}
        if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();	
		$("#discription-group").fadeIn();	
	});

	$("#holder-2").click(function(){
		if(tallyIcons > 0){
			tallyIcons -= 1
		}
		if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();
		$("#discription-group").fadeIn();
	});

	$("#holder-2-small").click(function(){
		if(tallyIcons > 0){
			tallyIcons -= 1
		}
		if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();
		$("#discription-group").fadeIn();
	});

	$("#holder-3").click(function(){
		if(tallyIcons > 0){
			tallyIcons -= 1
		}
		if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();
		$("#discription-group").fadeIn();
	});
	$("#holder-3-small").click(function(){
		if(tallyIcons > 0){
			tallyIcons -= 1
		}
		if($(this).children().attr("id") === "dog"){
			$("#dog svg .icon-background").css("fill", "#E56F6A" );
		}
		else if($(this).children().attr("id") === "couch"){
			$("#couch svg .icon-background").css("fill", "#E0905A" );
		}
		else if($(this).children().attr("id") === "family"){
			$("#family svg .icon-background").css("fill", "#EACC4E" );			
		}
		else if($(this).children().attr("id") === "computer"){
			$("#computer svg .icon-background").css("fill", "#36BFBF" );			
		}
		else if($(this).children().attr("id") === "food"){
			$("#food svg .icon-background").css("fill", "#C94343");
		}
		else if($(this).children().attr("id") === "wifi"){
			$("#wifi svg .icon-background").css("fill", "#DD64C3" );			
		}
		else if($(this).children().attr("id") === "parking"){
			$("#parking svg .icon-background").css("fill", "#37B3DD" );			
		}
		else if($(this).children().attr("id") === "exit"){
			$("#exit svg .icon-background").css("fill", "#4284A8" );			
		}
		else if($(this).children().attr("id") === "help-desk"){
			$("#help-desk svg .icon-background").css("fill", "#A370C4" );			
		}

		$(this).empty();
		$( "#icon-pop-up-small").hide();
		$(".submit-row").hide();
		$(".i-want").fadeIn();
		$("#discription-group").fadeIn();
	});
});