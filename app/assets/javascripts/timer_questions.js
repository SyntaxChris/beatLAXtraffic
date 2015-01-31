$(document).ready(function(){
	var $body = $('body');

	$body.on('click', '.txt', function(){
		var tile = $(this).attr('id');
		debugger;

		switch(tile){
			case 'text-0':
				$('#tile-1').animate({"opacity": 0.5}, 130);
				$('#tile-2').animate({"opacity": 1}, 130);
				$('#tile-3').animate({"opacity": 1}, 130);
				$('#tile-4').animate({"opacity": 1}, 130);
                $('.text-test').animate({"opacity": 0.5}, 130);
				$(this).find('.text-test').animate({"opacity": 1}, 130);
			break;

			case 'text-1':
			    $('#tile-2').animate({"opacity": 0.5}, 130);
			    $('#tile-3').animate({"opacity": 1}, 130);
			    $('#tile-4').animate({"opacity": 1}, 130);
			    $('#tile-1').animate({"opacity": 1}, 130);
                $('.text-test').animate({"opacity": 0.5}, 130);
				$(this).find('.text-test').animate({"opacity": 1}, 130);
			break;

			case 'text-2':
				$('#tile-3').animate({"opacity": 0.5}, 130);
				$('#tile-4').animate({"opacity": 1}, 130);
				$('#tile-1').animate({"opacity": 1}, 130);
				$('#tile-2').animate({"opacity": 1}, 130);
                $('.text-test').animate({"opacity": 0.5}, 130);
				$(this).find('.text-test').animate({"opacity": 1}, 130);
			break;

			case 'text-3':
				$('#tile-4').animate({"opacity": 0.5}, 130);
				$('#tile-1').animate({"opacity": 1}, 130);
				$('#tile-2').animate({"opacity": 1}, 130);
				$('#tile-3').animate({"opacity": 1}, 130);
                $('.text-test').animate({"opacity": 0.5}, 130);
				$(this).find('.text-test').animate({"opacity": 1}, 130);
			break;
		}

		$('#timer-question').fadeIn();
	});
});