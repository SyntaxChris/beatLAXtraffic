$(document).ready(function(){
  //set some vars
  var $circlePickup = $('#circle-pickup'),
      $body = $('body'),
      circleCount = 3,
      animating = false;

  //listeners
  $body
    .on('click', '#x-btn-circle-less', decrementCircle)
    .on('click', '#x-btn-circle-more', incrementCircle);

  $body.on('spinCar', spinCar);

  function spinCar(){
    if (!animating) {
      animating = true;
      $('.red-circle').toggleClass('spin', true);
      setTimeout(function(){
        $('.red-circle').toggleClass('spin', false);
        animating = false;
      },3000);
    }
  }

  function decrementCircle(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    circleCount--;

    if ( circleCount < 0 ) { circleCount = 0; }

    updateCircleCount('back');

  }
  function incrementCircle(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    circleCount++;

    updateCircleCount('forward');

  }

  function updateCircleCount(direction){
    // $body.find('#circle-pickup .circle-number').text(circleCount);
    // above removed because it is stomping on angular display
    animateCar(direction);
  }

  function animateCar(direction){
    if (!animating) {
      animating = true;
      if (direction == 'back') {
        $('.red-circle').toggleClass('movable', true); 
        setTimeout(function(){ 
          $('.red-circle').toggleClass('animate-back', true);
          setTimeout(function(){ 
            $('.red-circle').toggleClass('movable', false);
            setTimeout(function(){ 
              $('.red-circle').toggleClass('animate-back', false);
              animating = false;
            },300);
          },1000);
        },300);
      } else {
        $('.red-circle').toggleClass('movable', true); 
        setTimeout(function(){ 
          $('.red-circle').toggleClass('animate', true);
          setTimeout(function(){ 
            $('.red-circle').toggleClass('movable', false);
            setTimeout(function(){ 
              $('.red-circle').toggleClass('animate', false);
              animating = false;
            },300);
          },1000);
        },300);
      }
    }
  }

});
