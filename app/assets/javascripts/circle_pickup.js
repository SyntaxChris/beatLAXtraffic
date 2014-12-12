$(document).ready(function(){
  //set some vars
  var $circlePickup = $('#circle-pickup'),
      circleCount = 3;

  //listeners
  $circlePickup
    .on('click', '#x-btn-circle-less', decrementCircle)
    .on('click', '#x-btn-circle-more', incrementCircle);

  function decrementCircle(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    circleCount--;

    if ( circleCount < 0 ) { circleCount = 0; }

    updateCircleCount();

  }
  function incrementCircle(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    circleCount++;

    updateCircleCount();

  }

  function updateCircleCount(){
    $circlePickup.find('.circle-number').text(circleCount);
  }

});