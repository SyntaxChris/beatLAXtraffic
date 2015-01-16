$(document).ready(function(){

	var $body = $('body');
	var phoneTog = 0;
	var shopTog = 0;
	var hangTog = 0;
	var eatTog = 0;
	var otherTog = 0;

	$body
	.on('click', '.tile-container', function(){
		var tileId = $(this).children().eq(1).attr('id');

		switch(tileId){
			case 'phone-landscape':
				if(phoneTog === 0){

					$('.check-mark-container svg .circle-state', this).css('stroke-width', '0');
					$('.check-mark-container svg .circle-state', this).css('fill', '#FC9C52');
					$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'white');

					phoneTog = 1;
				}
				else{

					$('.check-mark-container svg .circle-state', this).css('stroke-width', '3');
					$('.check-mark-container svg .circle-state', this).css('fill', 'white');
					$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'gray');
					phoneTog = 0;
				}
			break;

			case 'shop-landscape':
			if(shopTog === 0){
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '0');
				$('.check-mark-container svg .circle-state', this).css('fill', '#F7C001');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'white');

				shopTog = 1;
			}
			else{
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '3');
				$('.check-mark-container svg .circle-state', this).css('fill', 'white');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'gray');

				shopTog = 0;
			}
			break;

			case 'hang-out-landscape':
			if(hangTog === 0){
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '0');
				$('.check-mark-container svg .circle-state', this).css('fill', '#39BAD8');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'white');

				hangTog = 1;
			}
			else{
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '3');
				$('.check-mark-container svg .circle-state', this).css('fill', 'white');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'gray');

				hangTog = 0;
			}
			break;

			case 'eat-landscape':
			if(eatTog === 0){
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '0');
				$('.check-mark-container svg .circle-state', this).css('fill', '#558AD8');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'white');

				eatTog = 1;
			}
			else{
				$('.check-mark-container svg .circle-state', this).css('stroke-width', '3');
				$('.check-mark-container svg .circle-state', this).css('fill', 'white');
				$('.check-mark-container svg .checkmark-fill', this).css('stroke', 'gray');
				eatTog = 0;
			}
			break;

			case 'other-landscape':
				$('.other-txt-bbl').fadeIn();
			break;
		}

        var tallyTot = phoneTog + shopTog + hangTog + eatTog + otherTog;

		if(tallyTot > 0){
			$(".next.tile").fadeIn(500);
		}
		else{
			$(".next.tile").fadeOut(300);
		}
		
	})
	.on('click', '.cancel', function(){
		$('.other-txt-bbl').fadeOut();
		$('.tile-container.tile-5 .check-mark-container svg .circle-state').css('stroke-width', '3');
		$('.tile-container.tile-5 .check-mark-container svg .circle-state').css('fill', 'white');
		$('.tile-container.tile-5 .check-mark-container svg .checkmark-fill').css('stroke', 'gray');
		$('textarea#tile-text').val("");

		otherTog = 0;

		var tallyTot = phoneTog + shopTog + hangTog + eatTog + otherTog;

		if(tallyTot > 0){
			$(".next.tile").fadeIn(500);
		}
		else{
			$(".next.tile").fadeOut(300);
		}
	})
	.on('click', '.save', function(){
		$('.other-txt-bbl').fadeOut();
		$('.tile-container.tile-5 .check-mark-container svg .circle-state').css('stroke-width', '0');
		$('.tile-container.tile-5 .check-mark-container svg .circle-state').css('fill', '#AA75D3');
		$('.tile-container.tile-5 .check-mark-container svg .checkmark-fill').css('stroke', 'white');

		otherTog = 1;

		var tallyTot = phoneTog + shopTog + hangTog + eatTog + otherTog;

		if(tallyTot > 0){
			$(".next.tile").fadeIn(500);
		}
	})
});