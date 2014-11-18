$(document).ready(function(){
	$('#other-button-landscape').click(function(){
		$('#user-text-input').toggle();
	});

	$('#other-info').keyup(function() {
	    var cs = 150 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});
});

