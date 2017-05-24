
$(document).ready(function() {

	"use strict";

//------------------------------------------------------------------------
//						PRELOADER SCRIPT
//------------------------------------------------------------------------
    $('#preloader').delay(400).fadeOut('slow'); // will fade out the white DIV that covers the website.
    $('#preloader .loading-data').fadeOut(); // will first fade out the loading animation


//------------------------------------------------------------------------
//						NORMALIZE CAROUSEL HEIGHTS
//------------------------------------------------------------------------

//------------------------------------------------------------------------
//						COUNTER SCRIPT
//------------------------------------------------------------------------


//------------------------------------------------------------------------
//						COUNTDOWN OPTIONS SCRIPT
//------------------------------------------------------------------------
    if($('div').is('.countdown')){
        $('.countdown').jCounter({
            date: "14 february 2016 12:00:00", // Deadline date
            timezone: "Europe/Bucharest",
            format: "dd:hh:mm:ss",
            twoDigits: 'on',
            fallback: function() {console.log("count finished!")}
        });
    }


//------------------------------------------------------------------------
//						NAVBAR SLIDE SCRIPT
//------------------------------------------------------------------------
	$(window).scroll(function () {
        if ($(window).scrollTop() > $("nav").height()) {
            $("nav.navbar-slide").addClass("show-menu");
        } else {
            $("nav.navbar-slide").removeClass("show-menu");
			$(".navbar-slide .navMenuCollapse").collapse({toggle: false});
			$(".navbar-slide .navMenuCollapse").collapse("hide");
			$(".navbar-slide .navbar-toggle").addClass("collapsed");
        }
    });


//------------------------------------------------------------------------
//						NAVBAR HIDE ON CLICK (COLLAPSED) SCRIPT
//------------------------------------------------------------------------
    $('.nav a').on('click', function(){
        if($('.navbar-toggle').css('display') !='none'){
            $(".navbar-toggle").click()
        }
    });

})




$(document).ready(function(){

	"use strict";



//------------------------------------------------------------------------
//						ANCHOR SMOOTHSCROLL SETTINGS
//------------------------------------------------------------------------
	$('a.goto, .navbar .nav a').smoothScroll({speed: 1200});




//------------------------------------------------------------------------
//						FULL HEIGHT SECTION SCRIPT
//------------------------------------------------------------------------
	$(".screen-height").css("min-height",$( window ).height());
	$( window ).resize(function() {
		$(".screen-height").css("min-height",$( window ).height());
	});




//------------------------------------------------------------------------
//                    MAGNIFIC POPUP(LIGHTBOX) SETTINGS
//------------------------------------------------------------------------


	$('.portfolio-list li').magnificPopup({
		delegate: 'a:not(.btn, .link-item)',
		type: 'image',
		gallery: {
			enabled: true
		}
	});




//------------------------------------------------------------------------
//						VIDEO BACKGROUND SETTINGS
//------------------------------------------------------------------------
if($('.video-bg')[0]) {
	$(function() {
		var BV = new $.BigVideo({container: $('.video-bg'), useFlashForFirefox:false});
		BV.init();
		if(navigator.userAgent.match(/iPhone|iPad|iPod|Android|BlackBerry|IEMobile/i)) {
				BV.show('images/video_gag.jpg');
		} else{
			if (!!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0) {
				BV.show('video/video_bg.ogv', {doLoop:true, ambient:true});
			} else{
				BV.show('video/video_bg.mp4', {doLoop:true, ambient:true, altSource:'video/video_bg.ogv'});
			}
			BV.getPlayer().on('loadedmetadata', function(){
				$('#big-video-wrap video').fadeIn('slow');
			});
		}
	});
}




//------------------------------------------------------------------------------------------
//                     INITIALIZATION WOW.JS
//------------------------------------------------------------------------------------------
    var wow = new WOW();
    wow.init();



})
