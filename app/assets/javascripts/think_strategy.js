$(document).ready(function(){
  //set some vars
  var $thinkStrategy = $('#think-strategy'),
      $body = $('body');

  //listeners
  $body
    .on('click', '#think-strategy .thought-button', toggleSelected);

  function toggleSelected(e){
    e.preventDefault();
    e.stopImmediatePropagation();
    var $btn = $(this);
    $('.think-next-btn').fadeIn();

    $('#x-btn-next-though').show();

    $('.next-thought-btn').fadeIn();

    if ( $btn.hasClass('selected') ) { return; }

    $body.find('#think-strategy .selected').toggleClass('selected', false);
    $btn.toggleClass('selected', true);
  }

});