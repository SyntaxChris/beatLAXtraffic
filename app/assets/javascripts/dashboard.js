$(document).ready(function(){

    var landTime = ["30", "1", "2"][Math.floor(Math.random() * 3)];
    var counterNum = $('#counter-num').data('counter-number');
    var planeProgress = 0;
    var nextColor = 0;
    var hour = $('#time').data('hours');
    var min = $('#time').data('minutes');

    debugger;
    

    $('#min').text(min);
    $("#min-unit").text("min");
    $('.number.landing').text(landTime);

    // set initial start values for plane progress bar 
    if(landTime === "2"){
        $('#plane-progress').data('plane-progress', planeProgress += 0);
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
    }
    else if(landTime === "1"){
        $('#plane-progress').data('plane-progress', planeProgress += 20);
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
    }
    else{
        $('#plane-progress').data('plane-progress', planeProgress += 35);
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
    }

    // target elements that increase counter time
    $(".sign, #x-btn-keep-looking, #x-btn-cirle-next, #x-btn-timer-more, .next#spin-parking-lose, .next#spin-pickup-lose, .next#timer-question, #x-btn-circle-next, #x-btn-timer-next, #x-btn-wait-next").click(function(){
        var idClicked = $(this).attr('id'); 

        if(idClick === 'timer-question'){
            $.each($(".timer-tile"), function( index, value ) {
                if($(value).attr('id') === 'tile-1' && $(value).css('opacity') === '0.5'){
                    counterNum += 90;
                }
                else if($(value).attr('id') === 'tile-2' && $(value).css('opacity') === '0.5'){
                    counterNum += 15;
                }
                else if($(value).attr('id') === 'tile-3' && $(value).css('opacity') === '0.5'){
                    counterNum += 60;
                }
                else if($(value).attr('id') === 'tile-4' && $(value).css('opacity') === '0.5'){
                    counterNum += 30;
                }
            });
        }
        else if(idClick === 'x-btn-circle-next'){
            var loopNum = 5 * parseInt($(".circle-number").text());
            counterNum += loopNum;
        }
        else if(idClick === 'x-btn-timer-next'){
            counterNum += parseInt($("div#min.timer-number").text());
        }
        else if(idClick === 'x-btn-wait-next'){
            counterNum += parseInt($("div#wait.timer-number").text());
        }
        else{
            counterNum += 5;
        }



        // set new value to counter data
        $('#counter-num').data('counter-number', $('#counter-num').data('counter-number') += counterNum );
    });




    $("#toggle-questions").click(function(){

        // plane progress logic
        if(planeProgress < 85){
            // temporarily increment
            $('#plane-progress').data('plane-progress', planeProgress += 5);

            $('#plane-progress').data('plane-progress', planeProgress);
            $("#plane-bar").animate({width: planeProgress+"%"}, 200);
            $("#filler").animate({marginLeft: planeProgress+"%"}, 200);
        }
        else{
            $("#plane-alert").attr("class", "clock-pulse");
            $('#landing-plane').addClass("land-ze-plane");
            $('svg circle#timer-fill').attr("class", "clock-pulse");
            // when plane lands
            window.setTimeout(function () {
                $("#landing-label").text('Plane landed');
                $("span#flight-status").text('Arrived');
            }, 5000);
        }



        // timer logic
        $('#time').data('minutes', min += 5);
        // $('#time').data('hours');
        
        if(min === 60){
            $('#time').data('hours', hour += 1);
            $('#hr').text(hour);
            if(hour > 1){$("#hr-unit").text("hrs")}
            else{$("#hr-unit").text("hr")}
            
            min = 0;
            $('#time').data('minutes', min);
            $('#min').empty();
            $('#min-unit').empty();
        }
        else{
            $('#time').data('minutes', min);
            $('#min').text(min);
            $('#min-unit').text('min');
        }
        // end timer logic
    
        
        // clock animation
        if($('#landing-label').text() !== "Plane landed"){
            $('svg circle#timer-fill').css("opacity", 0);

            switch(nextColor){
                case 0:
                    $('svg circle#timer-fill').css("fill", '#2779C1');
                break;

                case 1:
                    $('svg circle#timer-fill').css("fill", '#2AB1D0');
                break;

                case 2:
                    $('svg circle#timer-fill').css("fill", '#32BD26');
                break;

                case 3:
                    $('svg circle#timer-fill').css("fill", '#FFD333');
                break;

                case 4:
                    $('svg circle#timer-fill').css("fill", '#FFA733');
                break;

                case 5:
                    $('svg circle#timer-fill').css("fill", '#FF8133');
                break;

                case 6:
                    $('svg circle#timer-fill').css("fill", '#FF3333');
                break;
            }

            var o = $('#clock-face').data('opac') + 0.125;

            if(nextColor === 6){
                nextColor = 0;
            };

            if($('#clock-face').data('opac') > 0.8){
                $('#clock-face').data('opac', 0);
                $('svg circle#timer-fill').css("opacity", 0);
                nextColor += 1
            }
            else{
                $('svg circle#timer-fill').css("opacity", o);
                $('#clock-face').data('opac', o);
            } 
        }
        else{
            $('svg circle#timer-fill').css("opacity", 1);
        }


        var r = $('#clock-hand-cntr').data('rot') + 45;

        $('#clock-hand-cntr').css({
          '-webkit-transform': 'rotate('+r+'deg)',
             '-moz-transform': 'rotate('+r+'deg)',
              '-ms-transform': 'rotate('+r+'deg)',
               '-o-transform': 'rotate('+r+'deg)',
                  'transform': 'rotate('+r+'deg)'
        });

        $('#clock-hand-cntr').data('rot', r);
        
        
        // end clock animation
    });
});
