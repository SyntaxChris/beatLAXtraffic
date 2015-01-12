$(document).ready(function(){

	$('.timer-font').click(function(){
		var id = $(this).attr('id')
		
		$('.timer-font').animate({"opacity": "0.5"}, 130);
		$(this).animate({"opacity": "1"}, 130);

		if(id === 'tf-1'){
			$('.timer-tile').css("opacity", "1");
			$('#tile-1').css("opacity", "0.5");
			$(this).siblings().animate({"opacity": "1"}, 130);
		}
		else if(id === 'tf-2'){
            $('.timer-tile').css("opacity", "1");
			$('#tile-2').css("opacity", "0.5");
			$(this).siblings().animate({"opacity": "1"}, 130);
		}
		else if(id === 'tf-3'){
            $('.timer-tile').css("opacity", "1");
			$('#tile-3').css("opacity", "0.5");
		}
		else if(id === 'tf-4'){
            $('.timer-tile').css("opacity", "1");
			$('#tile-4').css("opacity", "0.5");
		}
		$('#timer-question-submit').fadeIn();
	});

	$('.timer-tile').click(function(){
		$('.timer-tile').css("opacity", "1");
		$(this).css("opacity", "0.5");	

		if($(this).attr('id') === 'tile-1'){
			$('.timer-font').animate({"opacity": "0.5"}, 130);
			$('[id="tf-1"]').animate({"opacity": "1"}, 130);
		}
		else if($(this).attr('id') === 'tile-2'){
			$('.timer-font').animate({"opacity": "0.5"}, 130);
			$('[id="tf-2"]').animate({"opacity": "1"}, 130);
		}
		else if($(this).attr('id') === 'tile-3'){
            $('.timer-font').animate({"opacity": "0.5"}, 130);
			$('[id="tf-3"]').animate({"opacity": "1"}, 130);
		}
		else if($(this).attr('id') === 'tile-4'){
            $('.timer-font').animate({"opacity": "0.5"}, 130);
			$('[id="tf-4"]').animate({"opacity": "1"}, 130);
		}
		$('#timer-question-submit').fadeIn();
	});
});