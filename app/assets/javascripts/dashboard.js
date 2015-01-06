$(document).ready(function(){
    var planeProgress = $('#plane-progress').data('plane-progress')-15;

    $('body').on('startDashboardAnimation', startDashboardAnimation);

    function startDashboardAnimation(){ 
        $("#plane-bar").animate({width: planeProgress+"%"}, 15000);
        $("#filler").animate({marginLeft: planeProgress+"%"}, 16000);
        
        $(function () {
            var prevWidth = $('#plane-bar').width();
            $('#plane-bar').attrchange({
                callback: function (e) {
                    var curWidth = $(this).width();
                    var progressPercentage = curWidth/$('#bar-back').width()*100;            
                    if (prevWidth !== curWidth) {
                        $("#logger").text(progressPercentage);
                        if (progressPercentage > 84) {     
                            // $("#timer-alert").attr("class", "timer-alert");
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
