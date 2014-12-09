$(document).ready(function(){
  //set some vars
  var $interactiveMap = $('#interactive-map');

  //listeners
  $interactiveMap.on('click', '.x-btn-select-path',selectPath);

  function selectPath(e){
    //prevent the default and propagation
    e.preventDefault();
    e.stopImmediatePropagation();

    //set the path
    var $btn = $(this),
        path = $btn.data('path');

    //check if this one is selected already
    if ($btn.hasClass('selected')) { return; }

    //deselect selected classes
    $interactiveMap
      .find('.x-btn-select-path.selected').toggleClass('selected', false).end()
      .find('.map-path.selected').toggleClass('selected', false);

    //add selected classes
    $interactiveMap
      .find('.x-btn-select-path[data-path="'+path+'"]').toggleClass('selected', true).end()
      .find('.map-path.'+path).toggleClass('selected', true);
  }


});