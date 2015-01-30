$(document).ready(function(){
	var phone = 0,
		shop = 0,
		hangout = 0,
		eat = 0,
		body = $('body');

	// var checkMark =
	$body.on('click', '.tile svg', function(){
		var tile = $(this).parents().eq(0).attr('id');
		var checkMark = $(this).parents().eq(2).find('.tile-checkmark svg');
	
		switch(tile){
			case 'phone':
				if(phone === 0){
					checkMark.find('path').css('fill', '#EF8E4B');
					checkMark.find('circle').css('stroke-width', 0);
					checkMark.find('polyline').css('stroke', '#FFFFFF');
					phone = 1;
				}else{
					checkMark.find('path').css('fill', '#FFFFFF');
					checkMark.find('circle').css('stroke-width', 3);
					checkMark.find('polyline').css('stroke', '#757575');
					phone = 0;
				}
			break;

			case 'shop':
				if(shop === 0){
					checkMark.find('path').css('fill', '#F2A700');
					checkMark.find('circle').css('stroke-width', 0);
					checkMark.find('polyline').css('stroke', '#FFFFFF');
					shop = 1;
				}else{
					checkMark.find('path').css('fill', '#FFFFFF');
					checkMark.find('circle').css('stroke-width', 3);
					checkMark.find('polyline').css('stroke', '#757575');
					shop = 0;
				}
			break;

			case 'hang-out':
				if(hangout === 0){
					checkMark.find('path').css('fill', '#3AB1D6');
					checkMark.find('circle').css('stroke-width', 0);
					checkMark.find('polyline').css('stroke', '#FFFFFF');
					hangout = 1;
				}else{
					checkMark.find('path').css('fill', '#FFFFFF');
					checkMark.find('circle').css('stroke-width', 3);
					checkMark.find('polyline').css('stroke', '#757575');
					hangout = 0;
				}
			break;

			case 'eat':
				if(eat === 0){
					checkMark.find('path').css('fill', '#4983C9');
					checkMark.find('circle').css('stroke-width', 0);
					checkMark.find('polyline').css('stroke', '#FFFFFF');
					eat = 1;
				}else{
					checkMark.find('path').css('fill', '#FFFFFF');
					checkMark.find('circle').css('stroke-width', 3);
					checkMark.find('polyline').css('stroke', '#757575');
					eat = 0;
				}
			break;
		}

		if(phone + shop + hangout + eat > 0){
			$('.tile-next').fadeIn();
		}else{
			$('.tile-next').fadeOut();
		}
		
	});

});