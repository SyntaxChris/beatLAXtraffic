$(document).ready(function(){
	$(".icon").click(function() {
 		var iconChosen = $(this)
 		var description = iconChosen.text();
 		var removeBind = function(){
 			$( "#yea").unbind( "click" );
			$( "#nah").unbind( "click" );
			$( "#yea-small").unbind( "click" );
			$( "#nah-small").unbind( "click" );
 		};

		$("#icon-description").html(description);
		$("#icon-description-small").html(description);

		$("#icon-pop-up").fadeIn();
		$("#icon-pop-up-small").fadeIn();

		$("#yea").click(function(){
			if ($("#holder-1").children().attr("class") !== "icon") {
				iconChosen.clone().appendTo("#holder-1");
				$( "#icon-pop-up").fadeOut();
				$("#holder-1").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-2").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-2");
	            $( "#icon-pop-up").fadeOut();
	            $("#holder-2").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-3").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-3");
	            $( "#icon-pop-up").fadeOut();
	            $( ".submit-row" ).fadeIn();
	            $("#holder-3").children().children(".remove-icon").fadeIn();
			}
			// Remove listners.
			removeBind();
		});

		$("#yea-small").click(function(){
			if ($("#holder-1-small").children().attr("class") !== "icon") {
				iconChosen.clone().appendTo("#holder-1-small");
				$( "#icon-pop-up-small").fadeOut();
				$("#holder-1-small").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-2-small").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-2-small");
	            $( "#icon-pop-up-small").fadeOut();
	            $("#holder-2-small").children().children(".remove-icon").fadeIn();
			}
			else if ($("#holder-3-small").children().attr("class") !== "icon") {
	            iconChosen.clone().appendTo("#holder-3-small");
	            $( "#icon-pop-up-small").fadeOut();
	            $( ".submit-row-small" ).fadeIn();
	            $("#holder-3-small").children().children(".remove-icon").fadeIn();
			}
			// Remove listners.
			removeBind();
		});

		$("#nah").click(function(){
			$( "#icon-pop-up").fadeOut();
			// Remove listeners.
			removeBind();
		});
		$("#nah-small").click(function(){
			$( "#icon-pop-up-small").fadeOut();
			// Remove listeners.
			removeBind();
		});
	});

	$("#holder-1").click(function(){
		$(this).empty();
	});

	$("#holder-2").click(function(){
		$(this).empty();
	});

	$("#holder-3").click(function(){
		$(this).empty();
	});
	$("#holder-1-small").click(function(){
		$(this).empty();
	});

	$("#holder-2-small").click(function(){
		$(this).empty();
	});

	$("#holder-3-small").click(function(){
		$(this).empty();
	});
});