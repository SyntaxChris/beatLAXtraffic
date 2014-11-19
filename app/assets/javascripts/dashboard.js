$(document).ready(function(){
    var planeProgress = $('#plane-progress').data('plane-progress')-5;
       
    $("#plane-bar-landscape").animate({width: planeProgress+"%"}, 15000);
    $("#plane-bar-filler-landscape").animate({marginLeft: planeProgress+"%"}, 15000);
    $("#plane-bar").animate({width: planeProgress+"%"}, 15000);
    $("#plane-bar-filler").animate({marginLeft: planeProgress+"%"}, 15000);
    $("#alert-plane").attr("class", "alert-plane")
    
    $(function () {
        var prevWidth = $('#plane-bar-landscape').width();
        $('#plane-bar-landscape').attrchange({
            callback: function (e) {
                var curWidth = $(this).width();
                var progressPercentage = curWidth/$('#bar-back-landscape').width()*100;            
                if (prevWidth !== curWidth) {
                    if (progressPercentage > 80) {     
                        $("#clock-alert").attr("class", "clock-alert");
                    }
                    if (progressPercentage > 94){
                        $('#landing-plane').addClass("land-ze-plane");
                    }
                   prevWidth = curWidth;
                };            
            }
        })
    });
});
