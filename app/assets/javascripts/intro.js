$(document).ready(function(){
  //set some variables
  var $missionIntroC = $('#mission-intro'), movingCarousel = false;

  //listeners
  $missionIntroC
    .on('click', '.nav-right', moveCarousel)
    .on('click', '.nav-left', moveCarousel)
    .on('click', '.x-btn-accept-mission', acceptMission)
    .on('click', '.x-btn-continue-mission', continueMission);

  //accept the current mission
  function acceptMission(){
    //toggle the stage 2 class on
    $missionIntroC.toggleClass('stage-2', true);
    //change button class to make it a continue mission button
    $(this).toggleClass('x-btn-accept-mission', false).toggleClass('x-btn-continue-mission', true);
  }

  //continue the current mission
  function continueMission(){
    //do something to continue the mission
    console.log('continue mission!');
  }

  //function to animate the carousel
  function moveCarousel(e){
    //these are anchor tags to ensure cross browser support (just in case - iPad mainly)
    //prevent their default actions and propagation
    e.preventDefault();
    e.stopImmediatePropagation();

    //prevent clicking before carousel is done rotating
    if (movingCarousel) { return; }

    //get elements and direction
    var $btn = $(this),
        direction = $btn.data('direction'),
        $centerElement = $missionIntroC.find('#mission-carousel .center'),
        $farLeftElement = $missionIntroC.find('#mission-carousel .far-left-side'),
        $leftElement = $missionIntroC.find('#mission-carousel .left-side'),
        $rightElement = $missionIntroC.find('#mission-carousel .right-side');

    //the carousel is now tagged as moving
    movingCarousel = true;

    //switch for direction
    switch (direction) {
      //going to the left
      case 'left':
        //set center to left, left to far left, right to center and move far right to far left side
        $centerElement.toggleClass('moving left-side', true);
        $leftElement.toggleClass('moving far-left-side', true);
        $rightElement.toggleClass('moving center', true);
        $farLeftElement.toggleClass('far-right-side', true).toggleClass('far-left-side', false);
        setTimeout(function(){
          //wait for animation-sake and remove constricting classes
          $centerElement.toggleClass('center', false);
          $leftElement.toggleClass('left-side', false);
          $rightElement.toggleClass('right-side', false);
          $farLeftElement.toggleClass('moving right-side', true).toggleClass('far-right-side', false);
          setTimeout(function(){
            //wait for animation and then remove the animating class
            $leftElement.toggleClass('moving', false);
            $centerElement.toggleClass('moving', false);
            $rightElement.toggleClass('moving', false);
            $farLeftElement.toggleClass('moving', false);
            //carousel is done moving
            movingCarousel = false;
          },300);
        },300);
        break;
      case 'right':
        //set center to right, right to far right, left to center and get far left side ready to slide in
        $centerElement.toggleClass('moving right-side', true);
        $rightElement.toggleClass('moving far-right-side', true);
        $leftElement.toggleClass('moving center', true);
        $farLeftElement.toggleClass('moving left-side', true);
        setTimeout(function(){
          //wait for animation-sake and remove constricting classes
          $centerElement.toggleClass('center', false);
          $leftElement.toggleClass('left-side', false);
          $rightElement.toggleClass('right-side', false);
          $farLeftElement.toggleClass('far-left-side', false);
          setTimeout(function(){
            //wait for animation and then remove animating class
            $leftElement.toggleClass('moving', false);
            $centerElement.toggleClass('moving', false);
            $rightElement.toggleClass('moving', false);
            $farLeftElement.toggleClass('moving', false);
            setTimeout(function(){
              //move far right to far left to prepare for next transition
              $rightElement.toggleClass('far-right-side', false).toggleClass('far-left-side', true);
              //carousel is done moving
              movingCarousel = false;
            },300);
          },300);
        },300);
        break;
    }
  }
});