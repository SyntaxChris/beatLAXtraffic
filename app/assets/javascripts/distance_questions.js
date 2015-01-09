$(document).ready(function(){

	$("#row-1").hover(
  		function () {
    		$('#circle-1').addClass("activate-circle");
  		},
  		function () {
    		$('#circle-1').removeClass("activate-circle");
  		}
	);

	$("#row-1").click(function(){
		$("#house").animate({
			"bottom":"341px"
		});
	});

	$("#row-2").hover(
  		function () {
    		$('#circle-2').addClass("activate-circle");
  		},
  		function () {
    		$('#circle-2').removeClass("activate-circle");
  		}
	);
	$("#row-2").click(function(){
		$("#house").animate({
			"bottom":"281px"
		});
	});

	$("#row-3").hover(
  		function () {
    		$('#circle-3').addClass("activate-circle");
  		},
  		function () {
    		$('#circle-3').removeClass("activate-circle");
  		}
	);
	$("#row-3").click(function(){
		$("#house").animate({
			"bottom":"221px"
		});
	});

	$("#row-4").hover(
  		function () {
    		$('#circle-4').addClass("activate-circle");
  		},
  		function () {
    		$('#circle-4').removeClass("activate-circle");
  		}
	);
	$("#row-4").click(function(){
		$("#house").animate({
			"bottom":"161px"
		});
	});

	$("#row-5").hover(
  		function () {
    		$('#circle-5').addClass("activate-circle");
  		},
  		function () {
    		$('#circle-5').removeClass("activate-circle");
  		}
	);
	$("#row-5").click(function(){
		$("#house").animate({
			"bottom":"101px"
		});
	});



	$("#circle-1").click(function(){
		$("#house").animate({
			"bottom":"341px"
		});
	});

	$("#circle-2").click(function(){
		$("#house").animate({
			"bottom":"281px"
		});
	});

	$("#circle-3").click(function(){
		$("#house").animate({
			"bottom":"221px"
		});
	});

	$("#circle-4").click(function(){
		$("#house").animate({
			"bottom":"161px"
		});
	});

	$("#circle-5").click(function(){
		$("#house").animate({
			"bottom":"101px"
		});
	});
});