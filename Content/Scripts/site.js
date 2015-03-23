$(document).ready(function () {
    $.placeholder.shim();

    $('#banner').flexslider({
        animation: "slide"
    });

    //used for thumbs
    $('#prop-slider li img').each(function () {
        src = $(this).attr('src');
        $(this).parent().attr('data-thumb', src);
    });

    $('#prop-carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 100,
        itemMargin: 10,
        asNavFor: '#prop-slider',
    });
    $('#prop-slider').flexslider({
        animation: "slide",
        controlNav: false,
        directionNav: true,
        animationLoop: false,
        slideshow: true,
        slideshowSpeed: 2500,
        sync: "#prop-carousel"
    });

    $('h3.mobile').click(function () {

    });

    $('h3.menu').click(function () {
        if ($(this).next('#topnav').is(':hidden')) {
            $(this).addClass('active');
            $(this).next('#topnav').addClass('active');
        }
        else {
            $(this).removeClass('active');
            $(this).next('#topnav').removeClass('active');
        }
    });

    $('#callouts a').hover(function () { //mouse in
        $(this).stop().animate({ bottom: '0px' }, 200);
    }, function () { //mouse out
        $(this).stop().animate({ bottom: '-10px' }, 200);
    });


});