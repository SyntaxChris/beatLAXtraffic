$(document).ready(function(){
  //set some vars
  var $railSystem = $('#rail-system');

  //listeners
  $railSystem
    .on('click', '#x-btn-rail-system-next', goToStage2);

  function goToStage2(){
    $railSystem.toggleClass('part-1', false).toggleClass('part-2', true);
  }

});