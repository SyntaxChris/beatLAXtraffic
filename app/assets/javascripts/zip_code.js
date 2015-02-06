$(document).ready(function(){
	var $body = $('body');
	
	$body
		.on('keypress', "#zip-input", function(e){
			if(e.which >= 48 && e.which <= 57){
				var l = $(this).val().length;

				if(l >= 4){
					$('.zip-next').fadeIn();
				}
				else{
					$('.zip-next').fadeOut();
				}
			}
			else{
				e.preventDefault();
			}
		})
		.on('keydown', "#zip-input", function(){
			var key = event.keyCode;

			if(key == 8){
				$('.zip-next').fadeOut(200);
			}
		});
});


