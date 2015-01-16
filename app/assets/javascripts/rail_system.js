$(document).ready(function(){
  //set some vars
  var $railSystem = $('#rail-system'),
      $body = $('body');

  //listeners
  $body
    .on('click', '#x-btn-rail-system-next', goToStage2);

  function goToStage2(){
    $body.find('#rail-system').toggleClass('part-1', false).toggleClass('part-2', true);
  }

});