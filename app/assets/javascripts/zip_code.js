$(document).ready(function(){
	var $body = $('body');
	
	$body
	.on('keypress', "#zip-input", function(e){
		var a = [];
	    var k = e.which;

	    for (i = 48; i < 58; i++){
	        a.push(i);
	    }

	    if ((a.indexOf(k)>=0)){
	    	var l = $(this).val().length;
	    	if(l === 4){
	    		$('.zip-next').fadeIn(200);
	    	}
	    }
	    else{
	    	e.preventDefault();
	    }

	})
	.on('keydown', "#zip-input", function(){
		var key = event.keyCode || event.charCode;

		if(key == 8){
			$('.zip-next').fadeOut(200);
		}
	});
});


