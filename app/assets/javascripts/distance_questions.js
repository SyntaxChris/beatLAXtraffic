$(document).ready(function(){

  $body = $('body');

	$body
    .on('mouseover', ".row", function(){
      var thisId = $(this).data('rowid');
  		$('#circle-'+thisId).addClass("activate-circle");
    })
  	.on('mouseleave', ".row", function(){
      var thisId = $(this).data('rowid');
  		$('#circle-'+thisId).removeClass("activate-circle");
  	})

    .on('click', "#row-1", function(){
  		$("#house").animate({
  			"bottom":"341px"
  		});
  	})

    .on('click',"#row-2", function(){
  		$("#house").animate({
  			"bottom":"281px"
  		});
  	})

    .on('click', "#row-3", function(){
  		$("#house").animate({
  			"bottom":"221px"
  		});
  	})

    .on('click', "#row-4", function(){
  		$("#house").animate({
  			"bottom":"161px"
  		});
  	})

    .on('click', "#row-5", function(){
  		$("#house").animate({
  			"bottom":"101px"
  		});
  	})


    .on('click', "#circle-1", function(){
  		$("#house").animate({
  			"bottom":"341px"
  		});
  	})

    .on('click', "#circle-2", function(){
  		$("#house").animate({
  			"bottom":"281px"
  		});
  	})

    .on('click', "#circle-3", function(){
  		$("#house").animate({
  			"bottom":"221px"
  		});
  	})

    .on('click', "#circle-4", function(){
  		$("#house").animate({
  			"bottom":"161px"
  		});
  	})

    .on('click', "#circle-5", function(){
  		$("#house").animate({
  			"bottom":"101px"
  		});
  	});
});
