$(document).ready(function(){
	var $body = $('body');
	
	$body.on('animateFerrari', animateFerrari);
	
	$body
		.on('keypress', "#zip-input", function(e){
			if(e.which >= 48 && e.which <= 57){
				return;
			}
			else{
				e.preventDefault();
			}
		})

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


