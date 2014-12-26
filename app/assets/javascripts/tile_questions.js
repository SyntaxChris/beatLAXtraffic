$(document).ready(function(){
	$('[id=other-info]').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('#char-count').text(cs + " characters left");
	});
	$('[id=other-info-small]').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-small]').text(cs + " characters left");
	});
	$('[id=other-strategy]').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-strategy]').text(cs);
	});

	$('#other-info-last-questions').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('#char-count-last-questions').text(cs + " characters left");
	});

	$('.other-submit').click(function() {
	    $('[id=user-text-input]').hide();
	    $('[id=other-small-textbox]').hide();
	    $('.next').show();
	    if (otherCheck === 0){
			$(".unchecked-other-tile svg path").attr("fill", "#AA75D3");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "white");
    		otherCheck = 1;
    	}
    	else {
			$(".unchecked-other-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "#757575");
    		otherCheck = 0;
    	}
	});
	$('[id=small-other]').click(function(){
		$('[id=other-small-textbox]').show();
	});
	$('[id=other-cancel]').click(function(){
		$('[id=other-small-textbox]').hide();
	});


	$.fn.toggleAttr = function(attr,val){
    	return this.each(function(){
	        var $this = $(this);
	        if ($this.is("[" + attr + "]")) {
	            $this.removeAttr(attr);
	        }
	        else {
	            $this.attr(attr,val);            
	        }
    	});
	}

	var phoneCheck = 0;
	var shopCheck = 0;
	var hangoutCheck = 0;
	var eatCheck = 0;
	var otherCheck = 0;

	$('[id=phone-landscape]').click(function() {
    	$(".unchecked-phone-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (phoneCheck === 0){
			$(".unchecked-phone-tile svg path").attr("fill", "#FC9C52");
    		$(".unchecked-phone-tile svg polyline").attr("stroke", "white");
    		phoneCheck = 1;
    	}
    	else {
			$(".unchecked-phone-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-phone-tile svg polyline").attr("stroke", "#757575");
    		phoneCheck = 0;
    	}
	});

	$('[id=shop-landscape]').click(function() {
    	$(".unchecked-shop-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (shopCheck === 0){
			$(".unchecked-shop-tile svg path").attr("fill", "#F7C001");
    		$(".unchecked-shop-tile svg polyline").attr("stroke", "white");
    		shopCheck = 1;
    	}
    	else {
			$(".unchecked-shop-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-shop-tile svg polyline").attr("stroke", "#757575");
    		shopCheck = 0;
    	}
	});

	$('[id=hang-out-landscape]').click(function() {
    	$(".unchecked-hangout-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (hangoutCheck === 0){
			$(".unchecked-hangout-tile svg path").attr("fill", "#39BAD8");
    		$(".unchecked-hangout-tile svg polyline").attr("stroke", "white");
    		hangoutCheck = 1;
    	}
    	else {
			$(".unchecked-hangout-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-hangout-tile svg polyline").attr("stroke", "#757575");
    		hangoutCheck = 0;
    	}
	});

	$('[id=eat-landscape]').click(function() {
    	$(".unchecked-eat-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (eatCheck === 0){
			$(".unchecked-eat-tile svg path").attr("fill", "#558AD8");
    		$(".unchecked-eat-tile svg polyline").attr("stroke", "white");
    		eatCheck = 1;
    	}
    	else {
			$(".unchecked-eat-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-eat-tile svg polyline").attr("stroke", "#757575");
    		eatCheck = 0;
    	}
	});

	$('[id=other-landscape]').click(function() {
		$('[id=user-text-input]').toggle();
		$('.next').toggle();
    	$(".unchecked-other-tile svg g circle").toggleAttr("stroke-dasharray","2.963,4.9383");
    	if (otherCheck === 0){
			$(".unchecked-other-tile svg path").attr("fill", "#AA75D3");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "white");
    		otherCheck = 1;
    	}
    	else {
			$(".unchecked-other-tile svg path").attr("fill", "#FFFFFF");
    		$(".unchecked-other-tile svg polyline").attr("stroke", "#757575");
    		otherCheck = 0;
    	}
	});
});