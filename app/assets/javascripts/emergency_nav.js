$(document).ready(function(){
  //set some vars
  var $body = $('body');

  //listeners
  $body
    .on('click', '.emergency-next', findNextNode)
    .on('findNextNode', findNextNode);

  function findNextNode(e) {
    e.preventDefault();
    e.stopImmediatePropagation();

    var $btn = $(this),
        $currentPanel = $('.slide.current'),
        currentNode = $currentPanel.data('currentnode'),
        nextNode = $currentPanel.data('nextnode'),
        isDecision = typeof $currentPanel.data('isdecision') === 'undefined' ? false : true;

    if (isDecision) {

    }

    $body.find('.slide[data-currentnode="'+currentNode+'"]').toggleClass('current', false);
    $body.find('.slide[data-currentnode="'+nextNode+'"]').toggleClass('current', true);
  }

});