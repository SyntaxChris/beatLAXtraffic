$(document).ready(function(){
	var	$body = $('body');

	$body.on('click', '.bbl', function(){
		debugger;
		if($(this).hasClass('other'))
			$('.other-ctnr').show();
		else
			if($(this).hasClass('disabled')){
				return;
			}
			else{
				if($(this).hasClass('selected'))
					$(this).removeClass('selected')
				else
					$(this).addClass('selected')
				if($('.bbl').hasClass('selected'))
					$('.next-ctnr').fadeIn()
				else
					$('.next-ctnr').fadeOut();	
			}
			
	}).on('click', '.save, .cancel', function(){
		if($(this).hasClass('save'))
			if($('#strat-txt').val() !== "")
				$('.bbl.other').addClass('selected')
			else
				$('.bbl.other').removeClass('selected');
		if($(this).hasClass('cancel'))
			if($('#strat-txt').val() === "")
				$('.bbl.other').removeClass('selected');

		$('.other-ctnr').hide();

		if($('.bbl').hasClass('selected'))
			$('.next-ctnr').fadeIn()
		else
			$('.next-ctnr').fadeOut();
	}).on('keyup', '#strat-txt', function(){
		var cs = 140 - $(this).val().length;
	    $('.counter').text(cs + " characters left");
	})
});
