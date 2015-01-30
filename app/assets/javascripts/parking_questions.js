$(document).ready(function(){

	var convenient = 0,
		traffic = 0,
		people = 0,
		otherBbl = 0,
		otherTog = 0,
		otherHeight = $('.other-bbl').height(),
		$body = $('body');

	$body.on('click', '.parking-bbl', function(){
		
		var icon = $('.bbl-icon svg', this).attr('class');
		
		switch(icon){
			case "convenient":
				if(convenient === 0){
					$(".convenient").find("path, polygon, rect").css("fill", "#2FA3CA");
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "0");
					$(this).parent().find('.unchecked svg g path').css('fill', '#2FA3CA');
					$(this).parent().find('.unchecked svg polyline').css('stroke', 'white');
					$(".bbl-title", this).css("color", "#2FA3CA");
					convenient = 1;
				}else{
					$(".convenient").find("path, polygon, rect").css("fill", "#A0A0A0");
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "3");
					$(this).parent().find('.unchecked svg g path').css('fill', '#FFFFFF');
					$(this).parent().find('.unchecked svg polyline').css('stroke', '#757575');
					$(".bbl-title", this).css("color", "#A0A0A0");
					convenient = 0;
				}	
			break;

			case "traffic":
				if(traffic === 0){
					$('.traffic').find('path').css('fill', '#DD734E');
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "0");
					$(this).parent().find('.unchecked svg g path').css('fill', '#DD734E');
					$(this).parent().find('.unchecked svg polyline').css('stroke', 'white');
					$(".bbl-title", this).css("color", "#DD734E");
					traffic = 1;
				}else{
					$('.traffic').find('path').css('fill', '#A0A0A0');
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "3");
					$(this).parent().find('.unchecked svg g path').css('fill', '#FFFFFF');
					$(this).parent().find('.unchecked svg polyline').css('stroke', '#757575');
					$(".bbl-title", this).css("color", "#A0A0A0");
					traffic = 0;
				}   
			break;

			case "people":
				if(people === 0){
					$('.people').find('path').css('fill', '#97CE11');
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "0");
					$(this).parent().find('.unchecked svg g path').css('fill', '#97CE11');
					$(this).parent().find('.unchecked svg polyline').css('stroke', 'white');
					$(".bbl-title", this).css("color", "#97CE11");
					people = 1;
				}else{
					$('.people').find('path').css('fill', '#A0A0A0');
					$(this).parent().find('.unchecked svg g circle').css('stroke-width', "3");
					$(this).parent().find('.unchecked svg g path').css('fill', '#FFFFFF');
					$(this).parent().find('.unchecked svg polyline').css('stroke', '#757575');
					$(".bbl-title", this).css("color", "#A0A0A0");
					people = 0;
				}  
			break;

			case "other-bbl-icon":
				if(otherTog === 0){
					$(this).css({cursor: "auto"});
					$('')
					$('.bbl-icon', this).hide();
					$('textarea', this).fadeIn();
					$('.text-counter').fadeIn();
					$('.ok-btn').show();
					$(this).animate({height: "250px"});	
					otherTog = 1;
				}  
			break;
		}

		var total = convenient + traffic + people + otherBbl;

		if(total > 0){
			$('.park-btn-next').fadeIn();
		}else{
			$('.park-btn-next').fadeOut();
		}
	});

	$body.on('click', '.ok-btn', function(e){

		e.stopPropagation();
		var textArea = $(this).parents().eq(2).find('textarea');
		var textAreaId = textArea.attr('id');

		switch(textAreaId){
			case'park-bbl':
				if( textArea.val() !== ""){
					
					$('.other-bbl-icon').find('path').css('fill', '#AA75D3');
					$('.other-bbl .bbl-title').css("color", "#AA75D3");
		            $('.other-bbl').parent().find('.unchecked g circle').css('stroke-width', "0");
					$('.other-bbl').parent().find('.unchecked g path').css('fill', '#AA75D3');
					$('.other-bbl').parent().find('.unchecked polyline').css('stroke', 'white');
			
					otherBbl = 1;
				}else{
					$('.other-bbl-icon').find('path').css('fill', '#A0A0A0');
					$('.other-bbl .bbl-title').css("color", "#A0A0A0");
		            $('.other-bbl').parent().find('.unchecked g circle').css('stroke-width', "3");
					$('.other-bbl').parent().find('.unchecked g path').css('fill', 'white');
					$('.other-bbl').parent().find('.unchecked polyline').css('stroke', '#757575');
			
					otherBbl = 0;
				}
			break;

			case'park-bbl-small':
				if( textArea.val() !== ""){
					$('.other-bbl-icon').find('path').css('fill', '#AA75D3');
					$('.other-bbl .bbl-title').css("color", "#AA75D3");
		            $('.other-bbl').parent().find('.unchecked g circle').css('stroke-width', "0");
					$('.other-bbl').parent().find('.unchecked g path').css('fill', '#AA75D3');
					$('.other-bbl').parent().find('.unchecked polyline').css('stroke', 'white');
			
					otherBbl = 1;
				}else{
					$('.other-bbl-icon').find('path').css('fill', '#A0A0A0');
					$('.other-bbl .bbl-title').css("color", "#A0A0A0");
		            $('.other-bbl').parent().find('.unchecked g circle').css('stroke-width', "3");
					$('.other-bbl').parent().find('.unchecked g path').css('fill', 'white');
					$('.other-bbl').parent().find('.unchecked polyline').css('stroke', '#757575');
			
					otherBbl = 0;
				}
			break;

		};

		$('.other-bbl').css({cursor: "pointer"});
		$('.other-bbl .bbl-icon').fadeIn();
		$('.other-bbl textarea').hide();
		$('.text-counter').hide();
		$('.ok-btn').hide();
		$('.other-bbl').animate({height: "130px"});	

		var total = convenient + traffic + people + otherBbl;

		if(total > 0){
			$('.park-btn-next').fadeIn(200);
		}else{
			$('.park-btn-next').fadeOut(200);
		}

		otherTog = 0;
	});

});

