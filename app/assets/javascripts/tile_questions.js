$(document).ready(function(){
	$("[id='other-info']").keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $("[id='char-count']").text(cs + " characters left");
	});
	$('[id=other-info-small]').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-small]').text(cs + " characters left");
	});
	$('.other-strategy').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('[id=char-count-strategy]').text(cs);
	});

	$('#other-info-last-questions').keyup(function() {
	    var cs = 140 - $(this).val().length;
	    $('#char-count-last-questions').text(cs + " characters left");
	});

	var inputToggle = 0;
	$("[id='other-landscape']").click(function(){
		if(inputToggle === 0){
			$("#user-text-input").fadeIn(200);
			inputToggle = 1;
		}
		else{
			$("#user-text-input").fadeOut(1000);
			inputToggle = 0;
		}
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

	$(".other-cancel").click(function(){
		otherCheck = 0;
	});

	$("[id='tally']").click(function(){
		
		var tileClass = $("div:nth-child(1)", this).attr("class");
		switch(tileClass){
			case 'unchecked-phone-tile':
			    if (phoneCheck === 0){
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "white");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 0);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FC9C52");
			    	phoneCheck = 1;	
			    }
			    else {
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "#757575");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 3);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FFFFFF");
			    	phoneCheck = 0;
			    }
				
			break;

			case 'unchecked-shop-tile':
				if (shopCheck === 0){
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "white");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 0);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#F7C001");
			    	shopCheck = 1;	
			    }
			    else {
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "#757575");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 3);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FFFFFF");	
			    	shopCheck = 0;
			    }
			break;

			case 'unchecked-hangout-tile':
				if (hangoutCheck === 0){
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "white");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 0);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#39BAD8");
			    	hangoutCheck = 1;	
			    }
			    else {
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "#757575");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 3);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FFFFFF");	
			    	hangoutCheck = 0;
			    }

			break;

			case 'unchecked-eat-tile':
			    if (eatCheck === 0){
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "white");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 0);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#558AD8");
			    	eatCheck = 1;	
			    }
			    else {
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "#757575");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 3);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FFFFFF");	
			    	eatCheck = 0;
			    }

			break;

			case 'unchecked-other-tile':
				if (otherCheck === 0){
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "white");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 0);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#AA75D3");
			    	otherCheck = 1;	
			    }
			    else {
			    	$("svg:nth-child(1) .checkmark-fill", this).css("stroke", "#757575");
			    	$("svg:nth-child(1) g .circle-state", this).css("stroke-width", 3);
			    	$("svg:nth-child(1) g .circle-state", this).css("fill", "#FFFFFF");	
			    	otherCheck = 0;
			    }

			break;
		}

		var tallyTiles = phoneCheck + shopCheck + hangoutCheck + eatCheck + otherCheck;

		if(tallyTiles > 0){
			$(".next").fadeIn(500);
		}
		else{
			$(".next").fadeOut(300);
		}
	});

});