$(document).ready(function(){
  // initialize progress element content
  var $body = $('body');

  window.advanceCar = function(){
    var progressNum = $('#car-progress-num').text();
    $("#progression-bar").animate({'width': progressNum + "%"}, 500);
    $("#car-container").animate({'margin-left': progressNum + "%"}, 500);
  };

  $body.on('click', '.car-progress', function(){
    var progressNum = $('#car-progress-num').text();
    $("#progression-bar").animate({'width': progressNum + "%"}, 500);
    $("#car-container").animate({'margin-left': progressNum + "%"}, 500);
  });

});
