let btnEn = document.getElementById('EN');
let btnEs = document.getElementById('ES');
let btnPt = document.getElementById('PT');

//t0
let traducaoInstitucional = document.getElementById('institucional-translation');
let enInstitucional = "Institutional";
let esInstitucional = "InstitucionalES";
let ptInstitucional = "Institucional";
//t1
let traducaoContato = document.getElementById('contato-translation');
let enContato = "Contact us";
let esContato = "Contáctenos";
let ptContato = "Contato";
//t2
let traducaoContato2 = document.getElementById('contato2-translation');


btnEn.addEventListener("click", function(){translation(enInstitucional,enContato,enContato)});
btnEs.addEventListener("click", function(){translation(esInstitucional,esContato,esContato)});
btnPt.addEventListener("click", function(){translation(ptInstitucional,ptContato,ptContato)});

(function(){
    traducaoInstitucional.innerHTML = localStorage.getItem("institucional");
    traducaoContato.innerHTML = localStorage.getItem("contato");
    traducaoContato2.innerHTML = localStorage.getItem("contato");

})();

function translation(t0,t1,t2) {
    console.log("-----------> TRADUCAO");
    if (typeof(Storage) !== "undefined") {

        localStorage.setItem("institucional", t0);
        traducaoInstitucional.innerHTML = localStorage.getItem("institucional");
        localStorage.setItem("contato", t1);
        traducaoContato.innerHTML = localStorage.getItem("contato");
        localStorage.setItem("contato2", t2);
        traducaoContato2.innerHTML = localStorage.getItem("contato2");
        

      } else {
        traducaoInstitucional.innerHTML = "Sorry, your browser does not support Web Storage...";
  }
}

  
   