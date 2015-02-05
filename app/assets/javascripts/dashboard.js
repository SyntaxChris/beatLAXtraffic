$(document).ready(function(){
    var $body = $('body');
  
    var movePlane = function(n){
        var currentProgress = parseInt($('#plane-progress').text());

        if( currentProgress < 85){
            $('#plane-progress').text(currentProgress);
            $("#plane-bar").animate({width: currentProgress+"%"}, 200);
            $("#filler").animate({marginLeft: currentProgress+"%"}, 200);
        }
        else if (currentProgress >= 85){
            $("#plane-bar").animate({width: "85%"}, 200);
            $("#filler").animate({marginLeft: "85%"}, 200);
            $("#plane-alert").attr("class", "clock-pulse");
            $('#landing-plane').addClass("land-ze-plane");
            $('svg circle#timer-fill').attr("class", "clock-pulse");

            window.setTimeout(function () {
                $("#landing-label").text('Plane landed');
                $("span#flight-status").text('Arrived');
            }, 5000);
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

    $body.on('click', '.plane-advance', function(){
        movePlane();
    });



});
