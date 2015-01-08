$(document).ready(function(){
    // clock animation
    var nextColor = 0;

    $("#toggle-questions").click(function(){
        $('svg circle#timer-fill').css("opacity", 0);

        switch(nextColor){
            case 0:
                $('svg circle#timer-fill').css("fill", '#2656BD');
            break;

            case 1:
                $('svg circle#timer-fill').css("fill", '#2779C1');
            break;

            case 2:
                $('svg circle#timer-fill').css("fill", '#2AB1D0');
            break;

            case 3:
                $('svg circle#timer-fill').css("fill", '#32BD26');
            break;

            case 4:
                $('svg circle#timer-fill').css("fill", '#A0D32A');
            break;

            case 5:
                $('svg circle#timer-fill').css("fill", '#FFFF33');
            break;

            case 6:
                $('svg circle#timer-fill').css("fill", '#FFD333');
            break;

            case 7:
                $('svg circle#timer-fill').css("fill", '#FFA733');
            break;

            case 8:
                $('svg circle#timer-fill').css("fill", '#FF8133');
            break;

            case 9:
                $('svg circle#timer-fill').css("fill", '#FF3333');
            break;

            case 10:
                $('svg circle#timer-fill').css("fill", '#EE4544');
            break;
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
        
        var o = $('#clock-face').data('opac') + 0.125;

        if(nextColor === 11){
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
    });
    // end clock animation

    var landTime = ["30", "1", "2"][Math.floor(Math.random() * 3)];
    $('.number.landing').text(landTime);
    
    var planeProgress;
    if(landTime === "2"){
        planeProgress = 0;
        $("#hr").text(landTime);
        $("#hr-unit").text("hrs");
    }
    else if(landTime === "1"){
        planeProgress = 15;
        $("#hr").text(landTime);
        $("#hr-unit").text("hr");
    }
    else{
        planeProgress = 37;
        $("#min").text(landTime);
        $("#min-unit").text("min");
    }


    $('body').on('startDashboardAnimation', startDashboardAnimation);

    function startDashboardAnimation(){ 
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
        
        $(function () {
            var prevWidth = $('#plane-bar').width();
            $('#plane-bar').attrchange({
                callback: function (e) {
                    var curWidth = $(this).width();
                    var progressPercentage = curWidth/$('#bar-back').width()*100;            
                    if (prevWidth !== curWidth) {
                        $("#logger").text(progressPercentage);
                        if (progressPercentage > 84) {     
                            $("#plane-alert").attr("class", "timer-alert");
                            $('#landing-plane').addClass("land-ze-plane");
                        }
                       prevWidth = curWidth;
                    };            
                }
            })
        });
    }
    
    startDashboardAnimation();
});
