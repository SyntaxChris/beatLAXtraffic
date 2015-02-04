$(document).ready(function(){
	var $body = $('body'),
		icon;

	$body.on('click', ".clone-container", function(){
		// $(this).empty();
		// $(this).next().toggleClass('show', false);
	})
	.on('click', ".icon-container .icon-holder svg", function(){
		// icon = $(this);
		$(".selection-container").fadeIn();
	})
	.on('click', ".nah", function(){
		$(".selection-container").fadeOut();		
	})
	.on('click', ".yea", function(){
		var contentCounter = 0;
		var insert = 0;

		$(".selection-container").fadeOut();
		$('.clone-container').each(function(){
			
  			if ( $.trim($(this).html()).length ) {
    			$(this).next().toggleClass('show', true);
    			contentCounter += 1;
  			}
  			else if($.trim($(this).html()).length === 0 && insert === 0){
  				// $(this).next().toggleClass('show', true);
  				// icon.clone().appendTo(this);
  				insert += 1;
  			}

  			if (contentCounter === 3){
  				$('.next-btn').toggleClass('show', true);
  			}
		});
	});

});