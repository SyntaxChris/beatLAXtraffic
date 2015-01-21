$(document).ready(function(){

  var $body = $('body'); 

  $body
    .on('click', '#phone-next-btn', function(){
      $('#stage-1').hide();
      $('#stage-1-header').hide();
      $('#stage-2').delay(500).fadeIn(1000);
      $('#stage-2-header').fadeIn();
    })
    .on('click', '#stage-2-btn', function(){
      $('#stage-2').hide();
      $('#stage-2-header').hide();
      $('#stage-3').delay(400).fadeIn();
      $("#speeding-car").animate({left: "110%"}, 5000);
      window.setTimeout(function () {
        $('#stage-3').fadeOut();
        $('#stage-4, #stage-4-header').show();
      }, 5500);
      
    })
});
