$(document).ready(function(){
  var $missionIntroC = $('#mission-intro');

  $missionIntroC
    .on('click', '.nav-right', moveCarousel)
    .on('click', '.nav-left', moveCarousel);

  function moveCarousel(e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var $btn = $(this),
        direction = $btn.data('direction'),
        $centerElement = $missionIntroC.find('.center'),
        $farLeftElement = $missionIntroC.find('.far-left-side'),
        $leftElement = $missionIntroC.find('.left-side'),
        $rightElement = $missionIntroC.find('.right-side');

    switch (direction) {
      case 'left':
        $centerElement.toggleClass('moving left-side', true);
        $leftElement.toggleClass('moving far-left-side', true);
        $rightElement.toggleClass('moving center', true);
        $farLeftElement.toggleClass('far-right-side', true).toggleClass('far-left-side', false);
        setTimeout(function(){
          $centerElement.toggleClass('center', false);
          $leftElement.toggleClass('left-side', false);
          $rightElement.toggleClass('right-side', false);
          $farLeftElement.toggleClass('moving right-side', true).toggleClass('far-right-side', false);
          setTimeout(function(){
            $leftElement.toggleClass('moving', false);
            $centerElement.toggleClass('moving', false);
            $rightElement.toggleClass('moving', false);
            $farLeftElement.toggleClass('moving', false);
          },300);
        },300);
        break;
      case 'right':
        $centerElement.toggleClass('moving right-side', true);
        $rightElement.toggleClass('moving far-right-side', true);
        $leftElement.toggleClass('moving center', true);
        $farLeftElement.toggleClass('moving left-side', true);
        setTimeout(function(){
          $centerElement.toggleClass('center', false);
          $leftElement.toggleClass('left-side', false);
          $rightElement.toggleClass('right-side', false);
          $farLeftElement.toggleClass('far-left-side', false);
          setTimeout(function(){
            $leftElement.toggleClass('moving', false);
            $centerElement.toggleClass('moving', false);
            $rightElement.toggleClass('moving', false);
            $farLeftElement.toggleClass('moving', false);
            setTimeout(function(){
              $rightElement.toggleClass('far-right-side', false).toggleClass('far-left-side', true);
            },300);
          },300);
        },300);
        break;
    }
  }
});