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

