$(document).ready(function(){
  //set some vars
  var $successfulPickup = $('#successful-pickup'),
      $body = $('body');

  //listeners
  $body.on('click', '#successful-pickup .red-car', animateRedCar);

  function animateRedCar(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    $(this).toggleClass('animate', true);
  }

});