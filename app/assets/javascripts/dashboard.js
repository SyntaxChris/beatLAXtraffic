$(document).ready(function(){
    var landTime = ["30", "1", "2"][Math.floor(Math.random() * 3)];
    var nextColor = 0;
    var planeProgress;
    var timeStepper;
    var hour;
    var min;

    $('.number.landing').text(landTime);

    // set global elements/variables with initial start values
    if(landTime === "2"){
        planeProgress = 0;
        timeStepper = 7;
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
        $('#time').data('hours', 2);
        $("#hr").text(landTime);
        $("#hr-unit").text("hrs");
    }
    else if(landTime === "1"){
        planeProgress = 20;
        timeStepper = 5;
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
        $('#plane-progress').data('plane-progress', 25);
        $('#time').data('hours', 1);
        $("#hr").text(landTime);
        $("#hr-unit").text("hr");
    }
    else{
        planeProgress = 35;
        timeStepper = 3;
        $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
        $('#plane-progress').data('plane-progress', 35);
        $('#time').data('hours', 0);
        $('#time').data('minutes', 30);
        $("#min").text(landTime);
        $("#min-unit").text("min");
    }

    hour = $('#time').data('hours');
    min = $('#time').data('minutes');

    // $('body').on('startDashboardAnimation', startDashboardAnimation);

    // function startDashboardAnimation(){ 
        // $("#plane-bar").animate({width: planeProgress+"%"}, 2000);
        // $("#filler").animate({marginLeft: planeProgress+"%"}, 2000);
        
    //     $(function () {
    //         var prevWidth = $('#plane-bar').width();
    //         $('#plane-bar').attrchange({
    //             callback: function (e) {
    //                 var curWidth = $(this).width();
    //                 var progressPercentage = curWidth/$('#bar-back').width()*100;            
    //                 if (prevWidth !== curWidth) {
    //                     $("#logger").text(progressPercentage);
    //                     if (progressPercentage > 84) {     
    //                         $("#plane-alert").attr("class", "timer-alert");
    //                         $('#landing-plane').addClass("land-ze-plane");
    //                     }
    //                    prevWidth = curWidth;
    //                 };            
    //             }
    //         })
    //     });
    // }
    
    // startDashboardAnimation();


    $("#toggle-questions").click(function(){

        // retrieve data from element set by Angular
        var currentPlaneProgress = $('#plane-progress').data('plane-progress');

        // plane progress logic
        if(currentPlaneProgress < 85){
            // temporarily increment
            currentPlaneProgress += 5;

            $('#plane-progress').data('plane-progress', currentPlaneProgress);
            $("#plane-bar").animate({width: currentPlaneProgress+"%"}, 200);
            $("#filler").animate({marginLeft: currentPlaneProgress+"%"}, 200);
        }
        else{
            $("#plane-alert").attr("class", "timer-alert");
            $('#landing-plane').addClass("land-ze-plane");
            $('svg circle#timer-fill').attr("class", "clock-pulse")
            window.setTimeout(function () {
                $("#landing-label").text('Plane landed');
            }, 5000);
        }



        // timer logic

        if(hour > 0){
            if(min > 0){
                min -= timeStepper;
                if(min <= 0){
                   min = 60 + min;
                   hour -= 1; 
                }
                if(hour === 0){
                    $('#hr').empty();
                    $('#hr-unit').empty();
                }
                else{
                    $('#hr').text(hour);
                    $('#hr-unit').text('hr');
                }
                $('#min').text(min);
                $('#min-unit').text('min'); 
            }
            else if(min <= 0){
                hour -= 1;
                min += 60;
                min -= timeStepper;
                if(hour < 1){
                    $('#hr').empty();
                    $('#hr-unit').empty();
                }
                $('#min').text(min);
                $('#min-unit').text('min');
            }  
        }
        else{
            $('#hr').empty();
            $('#hr-unit').empty();
            if(min > 0){
                min -= timeStepper;
                min > 0 ? min : min = 0;
                $('#min').text(min); 
            }
            else {
                $('#min').text(0);
                $('#plane-label').text("Plane landed");
            }
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
