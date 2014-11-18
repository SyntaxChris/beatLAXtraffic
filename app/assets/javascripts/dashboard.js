$(document).ready(function(){
    var elems = document.getElementsByClassName('hash');
    var increase = Math.PI * 2 / elems.length;
    var x = 0, y = 0, angle = 0;
    var planeProgress = $('#plane-progress').data('plane-progress')-5;
    debugger;
    for (var i = 0; i < elems.length; i++) {
        var elem = elems[i];
        // modify to change the radius and position of a circle
        x = 55 * Math.cos(angle) + 55;
        y = 55 * Math.sin(angle) + 55;
        elem.style.position = 'absolute';
        elem.style.left = x + 'px';
        elem.style.top = y + 'px';
        //need to work this part out
        var rot = 90 + (i * (360 / elems.length));
        elem.style['-moz-transform'] = "rotate("+rot+"deg)";
        elem.style.MozTransform = "rotate("+rot+"deg)";
        elem.style['-webkit-transform'] = "rotate("+rot+"deg)";
        elem.style['-o-transform'] = "rotate("+rot+"deg)";
        elem.style['-ms-transform'] = "rotate("+rot+"deg)";
        angle += increase;
        console.log(angle);
    }
    $(".hash").show();
    $("#plane-bar").animate({width: planeProgress+"%"}, 1000);
    $("#plane-bar-filler").animate({marginLeft: planeProgress+"%"}, 1000);
});

