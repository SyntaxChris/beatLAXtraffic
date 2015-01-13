$(document).ready(function(){
    // set variables
    var landTime = ["30", "1", "2"][Math.floor(Math.random() * 3)];
    var hour = $('#time').data('hours');
    var min = $('#time').data('minutes');
    var movePlane = function(incrementNum){
        var currentProgress = $('#plane-progress').data('plane-progress');
        var totalProgress = incrementNum + currentProgress;
    
        if( totalProgress < 85){
            $('#plane-progress').data('plane-progress', totalProgress);
            $("#plane-bar").animate({width: totalProgress+"%"}, 200);
            $("#filler").animate({marginLeft: totalProgress+"%"}, 200);
        }
        else if (totalProgress >= 85){
            $("#plane-bar").animate({width: "85%"}, 200);
            $("#filler").animate({marginLeft: "85%"}, 200);
            $("#plane-alert").attr("class", "clock-pulse");
            $('#landing-plane').addClass("land-ze-plane");
            $('svg circle#timer-fill').attr("class", "clock-pulse");

            window.setTimeout(function () {
                $("#landing-label").text('Plane landed');
                $("span#flight-status").text('Arrived');
            }, 5000);

            $('#plane-progress').data('plane-progress', 85);
        } 
    }
    var moveClock = function(){
        var clockState = $('#clock-hand-cntr').data('rot');
        var r = $('#clock-hand-cntr').data('rot') + 45;

        if($('#landing-label').text() !== "Plane landed"){
            $('svg circle#timer-fill').css("opacity", 0);

            switch(clockState){
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

            if(clockState === 6){
                clockState = 0;
            };

            if($('#clock-face').data('opac') > 0.8){
                $('#clock-face').data('opac', 0);
                $('svg circle#timer-fill').css("opacity", 0);
                clockState += 1
            }
            else{
                $('svg circle#timer-fill').css("opacity", o);
                $('#clock-face').data('opac', o);
            } 
        }
        else{
            $('svg circle#timer-fill').css("opacity", 1);
        }

        $('#clock-hand-cntr').css({
          '-webkit-transform': 'rotate('+r+'deg)',
             '-moz-transform': 'rotate('+r+'deg)',
              '-ms-transform': 'rotate('+r+'deg)',
               '-o-transform': 'rotate('+r+'deg)',
                  'transform': 'rotate('+r+'deg)'
        });

        $('#clock-hand-cntr').data('rot', r);
    }
    var counterDisplay = function(num){
        var currentMin = $('#counter-num').data('counter-number') + num;
        var currentHour = Math.floor(currentMin/60);

        // minute logic
        $('span#min').text(Math.round(currentMin/60 % 1 * 60));
        
        // hour logic
        if(currentHour < 1){
           $('#hr').empty();
           $('#hr-unit').empty();
        }
        else{
            $('#hr').text(currentHour);

            if(currentHour === 1){
                $('#hr-unit').text("hr");
            }
            else{
                $('#hr-unit').text("hrs");
            }
        }

        $('#counter-num').data('counter-number', currentMin)
    }
    var setPlane = function(scenario){
        if(scenario === "2"){
            $('#plane-progress').data('plane-progress', 0);
            $("#plane-bar").animate({width: "0%"}, 2000);
            $("#filler").animate({marginLeft: "0%"}, 2000);
        }
        else if(scenario === "1"){
            $('#plane-progress').data('plane-progress', 20);
            $("#plane-bar").animate({width: "20%"}, 2000);
            $("#filler").animate({marginLeft: "20%"}, 2000);
        }
        else{
            $('#plane-progress').data('plane-progress', 35);
            $("#plane-bar").animate({width: "35%"}, 2000);
            $("#filler").animate({marginLeft: "35%"}, 2000);
        }
    };

    // set initial values
    $('span#min').text(0);
    $("span#min-unit").text("min");
    $('.number.landing').text(landTime);
    setPlane(landTime);

    
 
    

    // target elements that increase counter time
    $(".sign, #x-btn-keep-looking, #x-btn-cirle-next, #x-btn-timer-more, #spin-parking-lose, .next#spin-pickup-lose, .next#timer-question, #x-btn-circle-next, #x-btn-timer-next, #x-btn-wait-next").click(function(){
        var idClicked = $(this).attr('id'); 

        if(idClicked === 'timer-question'){
            $.each($(".timer-tile"), function( index, value ) {
                if($(value).attr('id') === 'tile-1' && $(value).css('opacity') === '0.5'){
                    movePlane(30);
                    moveClock();
                    counterDisplay(90);
                }
                else if($(value).attr('id') === 'tile-2' && $(value).css('opacity') === '0.5'){
                    movePlane(5);
                    moveClock();
                    counterDisplay(15);
                }
                else if($(value).attr('id') === 'tile-3' && $(value).css('opacity') === '0.5'){
                    movePlane(20);
                    moveClock();
                    counterDisplay(60);
                }
                else if($(value).attr('id') === 'tile-4' && $(value).css('opacity') === '0.5'){
                    movePlane(10);
                    moveClock();
                    counterDisplay(30);
                }
            });
        }
        else if(idClicked === 'x-btn-circle-next'){
            var loopMin = 5 * parseInt($(".circle-number").text());
            movePlane(loopMin);
            moveClock();
            counterDisplay(loopMin);
        }
        else if(idClicked === 'x-btn-timer-next'){
            var timerNum = parseInt($("divspan#min.timer-number").text());
            movePlane(timerNum);
            moveClock();
            counterDisplay(timerNum);
        }
        else if(idClicked === 'x-btn-wait-next'){
            var waitNum = parseInt($("#wait.timer-number").text());
            movePlane(waitNum);
            moveClock();
            counterDisplay(waitNum);
        }
        else{
            movePlane(5);
            moveClock();
            counterDisplay(5);
        }
    });


});
