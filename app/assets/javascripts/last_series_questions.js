$(document).ready(function(){
	var otherBoxCount = 0;
  var qClicks = 0;
  var $body = $('body');
 	
  	$body.on('click',"#other-last", function(){
  		if(otherBoxCount === 0){
  			$("#last-questions-other-container").show();
  		}
      else if (otherBoxCount === 1){
			  $("#last-questions-other-container").hide();
  		}
  	}); 

  	$body.on('click', "#last-other-cancel", function(){
  		$("#last-questions-other-container").hide();
  	});

  	$body.on('click', "#last-other-save", function(){
  		$("#last-questions-other-container").hide();
  	});

  	$body.on('click', ".question-wrapper-1", function(){
  		$("#question-set-1").hide();
  		$("#question-set-2").fadeIn();
  	});

  	$body.on('click', "#last-other-save", function(){
  		$("#question-set-1").hide();
  		$("#question-set-2").fadeIn();
  	});

  	$body.on('click', ".question-wrapper-2", function(){
  		$("#question-set-2").hide();
  		$("#question-set-3").fadeIn();
  	});

    $body.on('click', '.question-wrapper-3', function(){
      $('.question-wrapper-3').removeClass('q3-clicked');
      $(this).addClass('q3-clicked');
      $('.next').fadeIn();
    });

});