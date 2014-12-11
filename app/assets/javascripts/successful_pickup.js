$(document).ready(function(){
  //set some vars
  var $successfulPickup = $('#successful-pickup');

  //listeners
  $successfulPickup.on('click', '.red-car', animateRedCar);

  function animateRedCar(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    $(this).toggleClass('animate', true);
  }

});