$(document).ready(function(){
  //set some vars
  var $timerPickup = $('#timer-pickup'),
      timerCount = 0;

  //listeners
  $timerPickup
    .on('click', '#x-btn-timer-less', decrementTimer)
    .on('click', '#x-btn-timer-more', incrementTimer);

  function decrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount -= 15;

    if ( timerCount < 0 ) { timerCount = 0; }

    updateTimerCount();

  }
  function incrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount += 15;

    updateTimerCount();

  }

  function updateTimerCount(){
    $timerPickup.find('.timer-number').text(timerCount);
  }

});