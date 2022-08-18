
let filterMobileCategory = document.getElementById("filter-mobile");
let btnfilterMobileCategory = document.getElementById("btn-filter-mobile-category");

let filterMobileSearch = document.getElementById("filter-mobile-search");
let btnfilterMobileSearch = document.getElementById("btn-filter-mobile-search");


const verifications = (vars,btn,v) => {  
    if(vars != null){
        btn.onclick = function() {menuMobile(v)};
    }
}
const verificationsFuntions = (fil) => {  
    if(fil != null){
        fil.style.display = 'none';
    }
}

verifications(filterMobileCategory,btnfilterMobileCategory,filterMobileCategory);
verifications(filterMobileSearch,btnfilterMobileSearch,filterMobileSearch);


(function(){
    
    verificationsFuntions(filterMobileCategory);
    verificationsFuntions(filterMobileSearch);

})();


const menuMobile = (e) => {  
  if (e.style.display === 'none') {
      e.style.display = 'block';
  } else {     
      e.style.display = 'none';
  }
}



let btnLoginHeader = document.getElementById('logindropdownclick');
let popoverdown = document.getElementById('drop-popover');

let btnMenuMobile = document.getElementById('mobile-menu-hamb');
let menuMobileDiv = document.getElementById('menu-mobile-div');

let btnclose = document.getElementById('close-mb');
let svgId = document.querySelectorAll(".svgArrowClickMenuMobile");

let obr = document.getElementsByClassName("obriga")[0];
  if(obr != null ){
      obr.innerHTML = "*";
  }


btnLoginHeader.onclick = function() {transitionClicks(popoverdown)};
btnMenuMobile.onclick = function() {transitionClicks(menuMobileDiv)};
btnclose.onclick = function() {transitionClicks(menuMobileDiv)};


(function(){
    popoverdown.style.visibility = 'hidden'; 
    menuMobileDiv.style.visibility = 'hidden';
    menuMobileDiv.style.position = 'absolute';
    dropMenuMobile();
})();

function dropMenuMobile(){
for ( var i = 0; i < svgId.length; i++ ){ 
  let idSvg = svgId[i].id;
  let res = idSvg.slice(16);
  let idLevel2 = res+"-level2";

  let ids = document.getElementById(idSvg);
  let element = document.getElementById(idLevel2);
  element.style.visibility = 'hidden';
  element.style.display = 'none';

  ids.onclick = function() {
    if (element.style.display === 'none') {
      element.style.display = 'block';
      element.style.visibility = 'visible';
      element.style.transition = 'ease-out 2s';
      element.style.marginBottom = '12px';
     
    }else{
      element.style.visibility = 'hidden';
      element.style.display = 'none';
      element.style.transition = 'all 2.2s ease';
      element.style.transform = 'ease-in-out';
      element.style.transitionProperty = 'opacity, visibility, transform';
  
    }
  };


};
}


function transitionClicks(el) {
  if (el.style.visibility === 'hidden') {
    el.style.visibility = 'visible';
    el.style.transition = 'all 1.7s ease';
    el.style.transform = 'cubic-bezier(0.18, 1.25, 0.4, 1)';
    el.style.transitionProperty = 'opacity, visibility, transform';
    el.style.opacity = '1';
    if(el === menuMobileDiv){
    el.style.zIndex = '100';
    }

    
  } else {     
    dropMenuMobile();
    el.style.visibility = 'hidden';
    el.style.transition = 'all 0.12s ease';
    el.style.transform = 'ease-in-out';
    el.style.transitionProperty = 'opacity, visibility, transform';
    //el.style.opacity = opacity;
  
   
  }

}



document.addEventListener("DOMContentLoaded", function() {
    let lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));
    let active = false;
  
    const lazyLoad = function() {
      if (active === false) {
        active = true;
  
        setTimeout(function() {
          lazyImages.forEach(function(lazyImage) {
            if ((lazyImage.getBoundingClientRect().top <= window.innerHeight && lazyImage.getBoundingClientRect().bottom >= 0) && getComputedStyle(lazyImage).display !== "none") {
              lazyImage.src = lazyImage.dataset.src;
              lazyImage.srcset = lazyImage.dataset.srcset;
              lazyImage.classList.remove("lazy");
  
              lazyImages = lazyImages.filter(function(image) {
                return image !== lazyImage;
              });
  
              if (lazyImages.length === 0) {
                document.removeEventListener("scroll", lazyLoad);
                window.removeEventListener("resize", lazyLoad);
                window.removeEventListener("orientationchange", lazyLoad);
              }
            }
          });
  
          active = false;
        }, 200);
      }
    };
  
    document.addEventListener("scroll", lazyLoad);
    window.addEventListener("resize", lazyLoad);
    window.addEventListener("orientationchange", lazyLoad);
  });


