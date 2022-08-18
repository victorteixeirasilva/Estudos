function noRepeat() {
    var finishItems = {};
    $("select > option").each(function () {
    if(finishItems[this.text]) {
         $(this).remove();
     } else {
         finishItems[this.text] = this.value;
     }});
  }
    

  function noRepeat2() {
    var finishItems = {};
    $("select > option").each(function () {
    if(finishItems[this.text]) {
         $(this).remove();
     } else {
         finishItems[this.text] = this.value;
     }});
  }
    
    $.ajax({
        method: "GET",
        url: "/web_api/products/"
    }).done(function( response, textStatus, jqXHR ) {
       
    let indice = response.Products.length
    let brand =  document.getElementById("mamdmarcas");
    //let model = document.getElementById("mamdmodelos");
        for(let i=0; i<indice; i++){
           
            let b = response.Products[i].Product.brand;
            //let c = response.Products[i].Product.model;
           
            // if(b != "" || c != ""){
                
            if(b != "" ){
            brand.innerHTML += '<option value='+response.Products[i].Product.brand+'>'+response.Products[i].Product.brand+'</option>';
            //model.innerHTML += '<option value='+response.Products[i].Product.model+'>'+response.Products[i].Product.model+'</option>';
            noRepeat();

            }

         }

    }).fail(function( jqXHR, status, errorThrown ){
        var response = $.parseJSON( jqXHR.responseText );
        console.log(response);
    });


    
    function myNewFunction(sel) {
        let v1 = sel.options[sel.selectedIndex].text;

        $.ajax({
            method: "GET",
            url: "/web_api/products/"
        }).done(function( response, textStatus, jqXHR ) {
           
        let indice = response.Products.length
        let model = document.getElementById("mamdmodelos");
        model.innerHTML = "";   

            for(let i=0; i<indice; i++){
               
                b1 = response.Products[i].Product.brand;
                c1 = response.Products[i].Product.model;
             

                    if(v1 === b1){
                        model.innerHTML += '<option value='+response.Products[i].Product.model+'>'+response.Products[i].Product.model+'</option>';
                        noRepeat2();


                    }
    
             }
    
        }).fail(function( jqXHR, status, errorThrown ){
            var response = $.parseJSON( jqXHR.responseText );
            console.log(response);
        });


      }

      