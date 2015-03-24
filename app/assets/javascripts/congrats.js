$(document).ready(function(){
  // window.twttr=(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],t=window.twttr||{};if(d.getElementById(id))return;js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);t._e=[];t.ready=function(f){t._e.push(f);};return t;}(document,"script","twitter-wjs"));
  //set some vars
  var $congrats = $('#congrats'),
      $body = $('body');

  //listeners
  $body
    .on('click', '#x-btn-share-story', function(e){
      toggleShareStoryOverlay(e,'open');
    })
    .on('click', '#x-btn-share', function(e){
      toggleShareOverlay(e,'open');
    });

  $body.on('click', '#x-btn-close-story-overlay, .submit-btn', function(e){
    toggleShareStoryOverlay(e,'close');
  });

  $body.on('click', '#x-btn-close-share-overlay', function(e){
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
