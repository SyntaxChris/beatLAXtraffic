$(document).ready(function(){
  //set some vars
  // var $thinkStrategy = $('#think-strategy'),
  var $body = $('body');

  $body.on("click", ".btn-cntnr", function(){
    $(".btn-cntnr").css("opacity", 0.8);
    $(this).css("opacity", 1);
    $(".think-nxt-btn").fadeIn();
  });

});