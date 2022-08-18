let cartPlay = document.getElementById("cartApiTrayHover");
let cartPlayApi = document.getElementById("cartApiTray");
let svgExit = document.getElementById("cartApiHover2");
let svgExit1 = document.getElementById("cartApiHover3");

let ids = document.getElementById("cartApiHover");

(function(){
    cartPlay.style.display = 'none';
})();

svgExit.addEventListener("click", function () {
    styleDropDown(cartPlay);
});

svgExit1.addEventListener("click", function () {
    styleDropDown(cartPlay);
});

ids.addEventListener("click", function () {
    ApiCart (getUrlBrowser(),getDataSession(),cartPlayApi);
   
    styleDropDown(cartPlay);
  
});


const  styleDropDown= (el) => {
    if (el.style.display === 'none') {
        el.style.display = 'block';
        el.style.visibility = 'visible';
        el.style.transition = 'all 1.7s ease';
        el.style.transform = 'cubic-bezier(0.18, 1.25, 0.4, 1)';
        el.style.transitionProperty = 'opacity, visibility, transform';
        el.style.opacity = '1';
       
    
    } else {     
        el.style.display = 'none';
        el.style.visibility = 'hidden';
        el.style.transition = 'all 0.12s ease';
        el.style.transform = 'ease-in-out';
        el.style.transitionProperty = 'opacity, visibility, transform';
      
    }
 }


  const  getUrlBrowser= () => {
    let u =  window.location.href;
    let str = u; 
    let m = str.search(".com.br");
    let t = str.slice(0, m+7);
   
    return t;
 }

 const  getDataSession= () => {
    let d =  $("html").attr("data-session");
   
    return d;
}



const  deleteCartItensApi= (i) => {

    let p = i.getAttribute("data-id");
    let v = i.getAttribute("data-variants");

    $.ajax({
        method: "DELETE",
        url: getUrlBrowser()+"/web_api/carts/"+getDataSession()+"/"+p+"/"+v
      }).done(function( response, textStatus, jqXHR ) {
        console.log(response);

        $('#'+p).css({display: "none"});


      }).fail(function( jqXHR, status, errorThrown ){
        var response = $.parseJSON( jqXHR.responseText );
        console.log(response);       



      });


}


function noRepeat() {

    var finishItems = {};
    $("#cartApiHover").each(function () {
    if(finishItems[this.text]) {
         $(this).remove();
     } else {
         finishItems[this.text] = this.value;
     }});
  }


const  ApiCart= (urls,dataSessions,x) => {

var params = {};
params["attrs"] = "Cart.product_name,Cart.price,Cart.quantity,Cart.product_id,Cart.variant_id,Cart.product_image.thumbs";

$.ajax({
  method: "GET",
  url: urls+"/web_api/cart/"+dataSessions,
  data: params
}).done(function( response, textStatus, jqXHR ) {
    let indice = response.length
  
 
    for(let i=0; i<indice; i++){

        let nameProd = response[i].Cart.product_name;
        let priceProd = response[i].Cart.price;
        let quantityProd = response[i].Cart.quantity;
        let imghttpProd = response[i].Cart.product_image.thumbs[90].http;
        let idProd = response[i].Cart.product_id;
        let variantIdProd = response[i].Cart.variant_id	

        var arr = [];
            $(".cartsItensValues").each(function(){
                var value = $(this).val();
                    if (arr.indexOf(value) == -1)
                        arr.push(value);
                    else
                        $(this).addClass("duplicate");
            });

        
        $(x).append( '<div id="'+idProd+'" class="cartsItensValues">'+
                            '<div class="cartsItensValues--itens">'+
                          
                            '<img src="'+imghttpProd+ '"/>'+
                            '</div>'+
                            '<div class="cartsItensValues--itens">'+
                            '<div class="nameProApi">'+nameProd+'</div>'+
                            '<div class="quantityProApiFlex" >'+

                            '<div class="quantityProApi" >'+"Quantidade:"+quantityProd+ '</div>'+
                            '<svg data-id="'+idProd+'" data-variants="'+variantIdProd+'" onclick="deleteCartItensApi(this)" width="14" height="16" viewBox="0 0 14 16" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M11.1857 15.4687H2.34924C2.16322 15.4643 1.9799 15.4233 1.80973 15.348C1.63957 15.2727 1.4859 15.1647 1.35751 15.03C1.22913 14.8953 1.12853 14.7367 1.06148 14.5631C0.994423 14.3896 0.962225 14.2045 0.966722 14.0185V4.46173H1.93351V14.0185C1.9289 14.0775 1.93601 14.1369 1.95443 14.1933C1.97285 14.2496 2.00223 14.3017 2.04086 14.3466C2.07949 14.3915 2.12663 14.4284 2.17955 14.455C2.23247 14.4817 2.29014 14.4976 2.34924 14.5019H11.1857C11.2448 14.4976 11.3025 14.4817 11.3554 14.455C11.4083 14.4284 11.4555 14.3915 11.4941 14.3466C11.5327 14.3017 11.5621 14.2496 11.5805 14.1933C11.5989 14.1369 11.6061 14.0775 11.6014 14.0185V4.46173H12.5682V14.0185C12.5727 14.2045 12.5405 14.3896 12.4735 14.5631C12.4064 14.7367 12.3058 14.8953 12.1774 15.03C12.0491 15.1647 11.8954 15.2727 11.7252 15.348C11.5551 15.4233 11.3717 15.4643 11.1857 15.4687Z" fill="#333333"/><path d="M12.9454 3.38378H0.483396C0.355192 3.38378 0.232238 3.33286 0.141584 3.2422C0.0509292 3.15155 0 3.02859 0 2.90039C0 2.77218 0.0509292 2.64923 0.141584 2.55858C0.232238 2.46792 0.355192 2.41699 0.483396 2.41699H12.9454C13.0736 2.41699 13.1965 2.46792 13.2872 2.55858C13.3778 2.64923 13.4287 2.77218 13.4287 2.90039C13.4287 3.02859 13.3778 3.15155 13.2872 3.2422C13.1965 3.33286 13.0736 3.38378 12.9454 3.38378Z" fill="#333333"/><path d="M8.21777 5.31738H9.18457V12.5683H8.21777V5.31738Z" fill="#333333"/><path d="M4.35059 5.31738H5.31738V12.5683H4.35059V5.31738Z" fill="#333333"/><path d="M9.18455 1.86591H8.2661V0.966792H5.26904V1.86591H4.35059V0.966792C4.35028 0.718543 4.44547 0.479686 4.61645 0.299705C4.78744 0.119724 5.0211 0.0124123 5.26904 0H8.2661C8.51404 0.0124123 8.7477 0.119724 8.91868 0.299705C9.08966 0.479686 9.18486 0.718543 9.18455 0.966792V1.86591Z" fill="#333333"/></svg>'+
                            '</div>'+
                            '<div class="priceProApi" >'+"R$ "+priceProd+ '</div>'+

                            '</div>'+
                        '</div>' );
     
         
        }
    
        
}).fail(function( jqXHR, status, errorThrown ){
  var response = $.parseJSON( jqXHR.responseText );
  console.log(response);
});
  }



   