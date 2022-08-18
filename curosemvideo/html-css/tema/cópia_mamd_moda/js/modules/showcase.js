(function() {
    var $showcase = document.querySelectorAll('.showcase .swiper-container')
    var swiper = new Swiper($showcase, {
        preloadImages: false,
        lazy: {
            loadPrevNext: true,
        },
        fadeEffect: {
            crossFade: true
        },
      
        slidesPerView: 5,     
       
        pagination: {
            el: '.showcase__bullets',
            type: 'bullets',
            dynamicBullets: true,
            clickable: true,
        },
        navigation: {
            nextEl: '.showcase__button--next',
            prevEl: '.showcase__button--prev',
        },

        breakpoints: {
            470: {
                slidesPerView: 1,
                slidesPerGroup: 1,
              },
            768: {
              slidesPerView: 3,
            
            },

            992: {
              slidesPerView: 4,
             
              

            },

            1280: {
                slidesPerView: 5,
                
                

            },
        },
    });


})();




