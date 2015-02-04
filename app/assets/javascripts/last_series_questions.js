$(document).ready(function(){
	var otherBoxCount = 0;
  var $body = $('body');

  $body.on('click', '.question-wrapper-1', function(){
   // $("#question-set-1").hide();
   // $("#question-set-2").fadeIn();
  })
  .on('click',"#other-last", function(){
    if(otherBoxCount === 0){
      $("#last-questions-other-container").show();
      otherBoxCount = 1;
    }
    else if (otherBoxCount === 1){
      $("#last-questions-other-container").hide();
      otherBoxCount = 0;
    }
  })
  .on('click', '.question-wrapper-2', function(){
    // $("#question-set-2").hide();
    // $("#question-set-3").fadeIn();
  })
  .on('click', '.question-wrapper-3', function(){
    $('.question-wrapper-3').removeClass('q3-clicked');
    $(this).addClass('q3-clicked');
    $('.next').fadeIn();
  })
});
