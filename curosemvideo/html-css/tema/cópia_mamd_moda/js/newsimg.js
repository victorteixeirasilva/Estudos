let imgGet = document.getElementsByClassName("imagemNoticia");
let injectImg = document.getElementById("listaUltimasNoticias");


(function(){
	console.log(injectImg)
})();

const x = (ds) => {
	injectImg.innerHTML = "";
    ds.style.display = "none";
    
    x[0].innerHTML = "Hello World!";

}
