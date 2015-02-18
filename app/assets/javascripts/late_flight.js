$(document).ready(function(){
  //set some vars
  var $lateFlight = $('#late-flight'),
      $body = $('body');

  //listeners
  $body
    .on('click', '#late-flight .select-btn', toggleSelection);

  function toggleSelection(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var $btn = $(this);

    $('.select-btn').css('opacity', 0.5);
    $btn.css('opacity', 1);

    if ($btn.hasClass('selected')) {return;}

    $body.find('#late-flight .selected').toggleClass('selected', false);
    $btn.toggleClass('selected', true);

    $body.find('#x-btn-late-flight-next').fadeIn();

  }
});