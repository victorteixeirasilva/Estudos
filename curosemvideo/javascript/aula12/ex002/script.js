function verificar() {
    let data = new Date();
    let ano = data.getFullYear();
    let fano = window.document.getElementById('txtano');
    let res = window.document.getElementById('res');
    if (fano.value.length == 0 || Number(fano.value > ano)){
        window.alert('[ERRO] Verifique os dados e tente novamente!');
    } else {
        let fsex = window.document.getElementsByName('radsex');
        let idade = ano - Number(fano.value);
        let genero = '';
        let img = window.document.createElement('img');
        img.setAttribute('id', 'foto');
        if(fsex[0].checked) {
            genero = 'Homem';
        } else if (fsex[1].checked) {
            genero = 'Mulher';
        }
        res.innerHTML = ` Detectamos ${genero} de ${idade} anos.`
    }
}