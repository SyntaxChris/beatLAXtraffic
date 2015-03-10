$(document).ready(function(){
  var $body = $('body');

  $body
    .on('click',".question-1-btn-other", function(){
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
    .on('click',".question-3-btn", function(){
      $(".question-3-btn").removeClass("selected");
      $(this).addClass("selected");

      if($(".finish-lawa").css('display') === "none")
        $(".finish-lawa").fadeIn();
    })
});
