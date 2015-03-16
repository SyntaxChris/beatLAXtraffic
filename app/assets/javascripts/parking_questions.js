$(document).ready(function(){
	var $body = $('body');

	$body.on('click', '.tile-bbl', function(){
		if($(this).hasClass('other'))
			$('.other-ctnr').show();
		else
			if($(this).hasClass('selected'))
				$(this).removeClass('selected')
			else
				$(this).addClass('selected')
			if($('.tile-bbl').hasClass('selected'))
				$('.btn-row').fadeIn()
			else
				$('.btn-row').fadeOut();
			
	}).on('click', '.save, .cancel', function(){
		if($(this).hasClass('save'))
			if($('#park-txt').val() !== "")
				$('.tile-bbl.other').addClass('selected')
			else
				$('.tile-bbl.other').removeClass('selected');
		if($(this).hasClass('cancel'))
			if($('#park-txt').val() === "")
				$('.tile-bbl.other').removeClass('selected');

		$('.other-ctnr').hide();

		if($('.tile-bbl').hasClass('selected'))
			$('.btn-row').fadeIn()
		else
			$('.btn-row').fadeOut();
	}).on('keyup', '#park-txt', function(){
		var cs = 140 - $(this).val().length;
	    $('.counter').text(cs + " characters left");
	})
});

