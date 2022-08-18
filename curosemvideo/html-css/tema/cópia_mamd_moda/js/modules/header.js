(function($){
    $(document).ready(function () {
        var wi = Number(jQuery( window ).width());
        if(wi >= 890){
          
           
            $(window).on("scroll", function(){

            var topScroll = Number(jQuery(window).scrollTop());
                if (topScroll >= 200) {
                    $("#catlvl_3_desktop").fadeOut();
                    $(".promotion-title").fadeOut();
                    $(".header__top").fadeOut();
                   
                    
                } else {
                    $("#catlvl_3_desktop").fadeIn();
                    $(".promotion-title").fadeIn();
                    $(".header__top").fadeIn();

                }
        });
        }else{
           
            $("#catlvl_3_desktop").css( "display", "none" );

        }
  
    });
  })(jQuery);
  
  