$(document).ready(function(){
  var $body = $('body');

  $body
    .on('click',".question-wrapper-1-other", function(){
      if($(".free-form-popup").css('display') === "none")
        $(".free-form-popup").show();
      else
        $(".free-form-popup").hide();
    })
    .on('click', '.other-btn', function(){
      if($(this).text() === "Cancel"){
        $('textarea#other-info-last-questions').val('');
        $("[id='char-count-last-questions']").text("140 characters left");
      }
      $(".free-form-popup").hide();
    })
    .on('click', '.question-wrapper-3', function(){
      $('.question-wrapper-3').removeClass('q3-clicked');
      $(this).addClass('q3-clicked');
      $('.next').fadeIn();
    })
});
