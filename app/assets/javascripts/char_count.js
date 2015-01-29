$(document).ready(function(){
	var $body = $('body');
	$("#char-count-large").text("140 characters left");
	$("[id='char-count']").text("140 characters left");
	$("[id='char-count-small']").text("140 characters left");
	$('[id=char-count-strategy]').text("140 characters left");
	$("[id='char-count-last-questions']").text("140 characters left");

	$(".char-count").text("140 characters left");
	$(".text-counter").text("140 characters left");

	$body
	.on('keyup', "[id='tile-text']", function(){
		 var cs = 140 - $(this).val().length;
	    $('.char-count').text(cs + " characters left");
	})
	.on('keyup', "[id='other-info-small']", function(){
		 var cs = 140 - $(this).val().length;
	    $('.char-count').text(cs + " characters left");
	})
	.on('keyup', ".other-strategy", function(){
		var cs = 140 - $(this).val().length;
	    $('[id=char-count-strategy]').text(cs + " characters left");
	})
	.on('keyup', ".other-strategy", function(){
		var cs = 140 - $(this).val().length;
	    $("[id='char-count-last-questions']").text(cs + " characters left");
	})
	.on('keyup', "textarea.purple.small", function(){
		var cs = 140 - $(this).val().length;
	    $('.char-count').text(cs + " characters left");
	})
	.on('keyup', "textarea#park-bbl", function(){
		var cs = 140 - $(this).val().length;
	    $('.text-counter').text(cs + " characters left");
	})
});