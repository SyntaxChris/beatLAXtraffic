$(document).ready(function(){
  //set some vars
  var $willingToWait = $('#willing-to-wait'),
      $body = $('body'),
      timerCount = 5;

  //listeners
  $body
    .on('click', '#x-btn-remove-wait-time', decrementTimer)
    .on('click', '#x-btn-add-wait-time', incrementTimer);

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
    $body.find('#willing-to-wait .timer-number').text(timerCount);
  }

});