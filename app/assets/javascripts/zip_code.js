$(document).ready(function(){
	var $body = $('body');

	$(".zip-next").attr('disabled','disabled');

	$body.on('animateFerrari', animateFerrari);
	
	// $body
	// 	.on('keypress', "#zip-input", function(e){
	// 		if(e.which >= 48 && e.which <= 57){
	// 			// var l = $(this).val().length;

	// 			// if(l >= 4){
	// 			// 	$('.zip-next').fadeIn();
	// 			// }
	// 			// else{
	// 			// 	$('.zip-next').fadeOut();
	// 			// }
	// 		}
	// 		else{
	// 			e.preventDefault();
	// 		}
	// 	})
	// 	.on('keydown', "#zip-input", function(){
	// 		// var key = event.keyCode;

	// 		// if(key == 8){
	// 		// 	$('.zip-next').fadeOut(200);
	// 		// }
	// 	});

	$body.on('click', '.zip-next', function(){
		if($(window).width() > 640){
			$('.ferrari-container svg').animate({marginLeft: "200%"}, 1000);	
		}
		else{
			$('.ferrari-container svg').animate({marginTop: "200%"}, 1000);
		}
	});

	function animateFerrari(){
		$('.ferrari-container svg').animate({marginLeft: "200%"}, 2000);
		console.log("Ferrari animating!")	
	};
	
});


