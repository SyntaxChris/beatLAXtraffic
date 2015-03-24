$(document).ready(function(){
  //set some vars
  // var $thinkStrategy = $('#think-strategy'),
  var $body = $('body');

  $body.on("click", ".thought-bbl button", function(){
    $(".thought-bbl button").css("opacity", 0.6);
    $(this).css("opacity", 1);
    $(".think-nxt-btn").fadeIn();
  });

});