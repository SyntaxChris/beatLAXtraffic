$(document).ready(function(){

  var $body = $('body');

  //set some vars
  var $interactiveMap = $('#interactive-map');

  //listeners
  $body
    .on('click', '#interactive-map .x-btn-select-path',selectPath)
    .on('click', '#x-btn-confirm-map-choice', selectNextNode);

  function selectPath(e){
    //prevent the default and propagation
    e.preventDefault();
    e.stopImmediatePropagation();

    //set the path
    var $btn = $(this),
        path = $btn.data('path'),
        $confirmPathBtn = $body.find('#interactive-map #x-btn-confirm-map-choice');

    $btn.toggleClass('animate', true);
    setTimeout(function(){
      $btn.toggleClass('animate', false);
    },2000);

    if ( !$confirmPathBtn.hasClass('show') ) {
      $confirmPathBtn.toggleClass('show', true);
    }

    //check if this one is selected already
    if ($btn.hasClass('selected')) { return; }

    //deselect selected classes
    $body
      .find('#interactive-map .x-btn-select-path.selected').toggleClass('selected', false).end()
      .find('#interactive-map .map-path.selected').toggleClass('selected', false).end()
      .find('#interactive-map .instructions .showing').toggleClass('showing', false);

    //add selected classes
    $body
      .find('#interactive-map .x-btn-select-path[data-path="'+path+'"]').toggleClass('selected', true).end()
      .find('#interactive-map .map-path.'+path).toggleClass('selected', true).end()
      .find('#interactive-map .instructions .path-'+path).toggleClass('showing', true);

    // add selected class to tram svg
    if (path === 'blue') {
      if($('.tram svg').attr('class') === 'blue-tram')
        $('.tram svg').attr('class', 'gray-tram')
      else{
        $('.tram svg').attr('class', 'blue-tram')
      }
    } 
    else{
      $('.tram svg').attr('class', 'gray-tram')
    }
  }

  function selectNextNode(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var selectedOption = $body.find('#interactive-map .x-btn-select-path.selected').data('path');

    var node = '';
    switch(selectedOption){
      case 'yellow':
        node = '21';
        break;
      case 'green':
        node = '6';
        break;
      case 'orange':
        node = '';
        break;
      case 'blue':
        node = '19';
        break;
    }

    $body.trigger('findSpecificNode',[node]);

  }


});
