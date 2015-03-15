$(document).ready(function(){
	var $body = $('body');

	$body.on('click', '.tile', function(){
		if($(this).hasClass('selected'))
			$(this).removeClass('selected')
		else
			$(this).addClass('selected');

		if($('.tile').hasClass('selected'))
			$('.btn-row').fadeIn()
		else
			$('.btn-row').fadeOut();
	});
});
