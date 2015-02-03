$(document).ready(function(){
	var $body = $('body');

	$body.on('click', ".clone-container", function(){
		// alert("clone container!");
	});

	$body.on('click', ".icon-container .icon-holder svg", function(){
		$(".selection-container").fadeIn();
	});

	$body.on('click', ".yea, .nah", function(){
		var contentCounter = 0;

		$(".selection-container").fadeOut();
		$('.clone-container').each(function(){
  			if ( $.trim($(this).html()).length ) {
    			$(this).next().toggleClass('show', true);
    			contentCounter += 1;
  			}
  			debugger;
  			if (contentCounter === 3){
  				$('.next-btn').toggleClass('show', true);
  			}
		});
	});
});