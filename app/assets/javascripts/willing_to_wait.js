$(document).ready(function(){
  //set some vars
  var $willingToWait = $('#willing-to-wait'),
      timerCount = 10;

  //listeners
  $willingToWait
    .on('click', '#x-btn-remove-wait-time', decrementTimer)
    .on('click', '#x-btn-add-wait-time', incrementTimer);

  function decrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount -= 10;

    if ( timerCount < 0 ) { timerCount = 0; }

    updateTimerCount();

  }
  function incrementTimer(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    timerCount += 10;

    updateTimerCount();

  }

  function updateTimerCount(){
    $willingToWait.find('.timer-number').text(timerCount);
  }

});