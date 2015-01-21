$(document).ready(function(){

  var $body = $('body'); 

    //continue the current mission
  function continueMission(){
    //do something to continue the mission
    console.log('continue mission!');
    $body.trigger('findNextNode');
  };

  $body
    .on('click', '#mission-intro #stage-4-btn', continueMission);

  $body
    .on('click', '#phone-next-btn', function(){
      $('#stage-1').hide();
      $('#stage-1-header').hide();
      $('#stage-2').show();
      $('#stage-2-header').show();
    })
    .on('click', '#stage-2-btn', function(){
      $('#intro-phone').hide();
      $('#stage-2').hide();
      $('#stage-2-header').hide();
      $('#stage-3').delay(400).fadeIn();
      $("#speeding-car").animate({left: "110%"}, 5000);
      window.setTimeout(function () {
        $('#stage-3').fadeOut();
        $('#stage-4, #stage-4-header, #intro-phone').show();
      }, 5500);
      
    });


});
