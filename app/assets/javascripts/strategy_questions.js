$(document).ready(function(){
	var	$body = $('body');

	$body.on('click', '.bbl', function(){
		if($(this).hasClass('other'))
			$('.other-ctnr').show();
		else
			if($(this).hasClass('selected'))
				$(this).removeClass('selected')
			else
				$(this).addClass('selected')
			if($('.bbl').hasClass('selected'))
				$('.next-ctnr').fadeIn()
			else
				$('.next-ctnr').fadeOut();
			
	}).on('click', '.save, .cancel', function(){
		if($(this).hasClass('save'))
			$('.bbl.other').addClass('selected')
		if($(this).hasClass('cancel'))
			$('.bbl.other').removeClass('selected');

		$('.other-ctnr').hide();

		if($('.bbl').hasClass('selected'))
			$('.next-ctnr').fadeIn()
		else
			$('.next-ctnr').fadeOut();
	});
});
