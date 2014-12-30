$(document).ready(function(){
	var otherBoxCount = 0;
 	
  	$("#other-last").click(function(){
  		if(otherBoxCount === 0){
  			$("#last-questions-other-container").show();
  		}else if (otherBoxCount === 1){
			$("#last-questions-other-container").hide();
  		}
  	}); 
  	$("#last-other-cancel").click(function(){
  		$("#last-questions-other-container").hide();
  	});
  	$("#last-other-save").click(function(){
  		$("#last-questions-other-container").hide();
  	});

  	$(".question-wrapper-1").click(function(){
  		$("#question-set-1").fadeOut();
  		$("#question-set-2").fadeIn();
  	});
  	$("#last-other-save").click(function(){
  		$("#question-set-1").fadeOut();
  		$("#question-set-2").fadeIn();
  	});

  	$(".question-wrapper-2").click(function(){
  		$("#question-set-2").fadeOut();
  		$("#question-set-3").fadeIn();
  	});

    $(".q-3-text").click(function(){
      $(".next").fadeIn();
    });
});