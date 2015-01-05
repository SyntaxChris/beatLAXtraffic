$(document).ready(function(){
	$("#char-count-large").text("140 characters left");
	$('#other-info-large').keyup(function() {
    	var franko = 140 - $(this).val().length;
    	$("#char-count-large").text(franko + " characters left");
	});
	

	$("[id='char-count']").text("140 characters left");
	$("[id='char-count-small']").text("140 characters left");
	$('[id=char-count-strategy]').text("140 characters left");
	$("[id='char-count-last-questions']").text("140 characters left");

	
	$('[id=other-info-small]').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-small]').text(cs + " characters left");
	});
	$('.other-strategy').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-strategy]').text(cs + " characters left");
	});

	$('#other-info-last-questions').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $("[id='char-count-last-questions']").text(cs + " characters left");
	});
});