let w = document.getElementById("agenciamamdpopup");
let p = document.getElementById("popupnewsletterexit");
let x = document.getElementById("popupnewsclosex");
let mobile = w.clientWidth;

x.addEventListener("click", function(){closeX(p)});

(function(){
    p.style.visibility = 'hidden';
    
    if(mobile < 980){
     setTimeout(function(){
         p.style.visibility = 'visible';
         p.style.transition = 'ease-out 2s';
         p.style.opacity = "0.7s";
     }, 4000);
    }

})();

w.onmouseleave = function() {mouseLeave(p)};

const closeX = (d) => { 
    d.style.visibility = 'hidden';
    d.style.display = 'none';
}

const mouseLeave = (el) => { 
    el.style.visibility = 'visible';
    el.style.transition = 'ease-out 2s';
    el.style.opacity = "0.7s";
}



