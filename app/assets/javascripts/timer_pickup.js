$(document).ready(function(){
  //set some vars
  var $timerPickup = $('#timer-pickup'),
      $body = $('body'),
      timerCount = 0;

  //listeners
  $body
    .on('click', '#x-btn-timer-less', decrementTimer)
    .on('click', '#x-btn-timer-more', incrementTimer);

  function decrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount -= 5;

    if ( timerCount < 0 ) { timerCount = 0; }

    updateTimerCount();

  }
  function incrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount += 5;

    updateTimerCount();

  }

  function updateTimerCount(){
    $body.find('#timer-pickup .timer-number').text(timerCount);
  }

});