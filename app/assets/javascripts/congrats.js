$(document).ready(function(){
  //set some vars
  var $congrats = $('#congrats');

  //listeners
  $congrats
    .on('click', '#x-btn-share-story', function(e){
      toggleShareStoryOverlay(e,'open');
    })
    .on('click', '#x-btn-share', function(e){
      toggleShareOverlay(e,'open');
    });

  $('#x-btn-close-story-overlay').on('click', function(e){
    toggleShareStoryOverlay(e,'close');
  });

  $('#x-btn-close-share-overlay').on('click', function(e){
    toggleShareOverlay(e,'close');
  });
  

  function toggleShareStoryOverlay(e,action){
    e.preventDefault();
    e.stopImmediatePropagation();

    if (action == 'open') {
      $('#share-story-overlay').toggleClass('show', true);
    } else {
      $('#share-story-overlay').toggleClass('show', false);
    }

  }

  function toggleShareOverlay(e,action){
    e.preventDefault();
    e.stopImmediatePropagation();

    if (action == 'open') {
      $('#congrats-share-overlay').toggleClass('show', true);
    } else {
      $('#congrats-share-overlay').toggleClass('show', false);
    }
  }

});