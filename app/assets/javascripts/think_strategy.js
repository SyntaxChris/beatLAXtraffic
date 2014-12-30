$(document).ready(function(){
  //set some vars
  var $thinkStrategy = $('#think-strategy');

  //listeners
  $thinkStrategy
    .on('click', '.thought-button', toggleSelected);

  function toggleSelected(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var $btn = $(this);

    if ( $btn.hasClass('selected') ) { return; }

    $thinkStrategy.find('.selected').toggleClass('selected', false);
    $btn.toggleClass('selected', true);
  }

});