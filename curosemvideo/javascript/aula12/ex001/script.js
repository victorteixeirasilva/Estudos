function carregar() {
    let msg = window.document.getElementById("msg");
    let img = window.document.getElementById("imagem");
    let data =  new Date();
    let hora = data.getHours();

    msg.innerHTML = `Agora são ${hora} horas.`
    if (hora >= 0 && hora < 12) {
        img.src = 'Manha-Site.png'
        window.document.body.style.backgroundColor = '#f4d9b6'
        // bom dia
    } else if (hora >= 12 && hora < 18){
        img.src = 'Tarde-Site.png'
        window.document.body.style.backgroundColor = '#f38124'
        // boa tarde
    } else {
        window.document.body.style.backgroundColor = '#222224'
        img.src = 'Noite-Site.png'
        // boa noite
    }
}