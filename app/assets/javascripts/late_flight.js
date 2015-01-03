$(document).ready(function(){
  //set some vars
  var $lateFlight = $('#late-flight');

  //listeners
  $lateFlight
    .on('click', '.select-btn', toggleSelection);

  function toggleSelection(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var $btn = $(this);

    if ($btn.hasClass('selected')) {return;}

    $lateFlight.find('.selected').toggleClass('selected', false);
    $btn.toggleClass('selected', true);

    $lateFlight.find('#x-btn-late-flight-next').fadeIn();

  }
});