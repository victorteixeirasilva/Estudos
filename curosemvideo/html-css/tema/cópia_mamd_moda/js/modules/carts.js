arrType = [];
arrValue = [];
arrImgs = [];
arrIdsPro = [];

arrType1 = [];
arrValue1 = [];
arrImgs1 = [];
arrIdsPro1 = [];

let tagHome00 = document.getElementsByClassName("tagsHomeVariants00");
let tagHome01 = document.getElementsByClassName("tagsHomeVariants01");

let tagPro00 = document.getElementsByClassName("tagsVariants00");
let tagPro01 = document.getElementsByClassName("tagsVariants01");

let p1 = "divJsVariants01Key00";
let p2 = "divJsVariants02Key00";
let p3 = "divJsVariants03Key01";
let p4 = "divJsVariants04Key01";

let h1 = "divHomeJsVariants01Key00";
let h2 = "divHomeJsVariants02Key00";
let h3 = "divHomeJsVariants03Key01";
let h4 = "divHomeJsVariants04Key01";

const divJsInn = (d) => {
	let j = document.getElementById(d);
	return j
}

const divJsStyle = (ds) => {
	ds.innerHTML = "";
	ds.style.display = "none";
}

const divJsStyleBlock = (dbs) => {
	dbs.style.display = "block";
}

const innerthtmlLoopStyle = (tp1,tp2,img1,img2,dv0,dv1,dv2,dv3,v1,v2) => {
	if (tp1 != ""){
		dv0.innerHTML += '<span class="product__variants">'+tp1+'</span>';
			if (img1 != "" ) {
				for ( var x = 0; x < img1.length; x++ ){ 
					dv1.innerHTML += '<span class="product__variants__colors" alt='+v1[x]+' style="background-image: url('+img1[x]+')" ></span>';
				}

			}else{
				for ( var z = 0; z < v1.length; z++ ){ 
					dv1.innerHTML += '<span class="product__variants__itens--value">'+v1[z]+'</span>';
				}
			}
	}
	
	if (tp2 != ""){
		dv2.innerHTML += '<span class="product__variants">'+tp2+'</span>';
			if (img2 != "") {
				for ( var y = 0; y < img2.length; y++ ){ 
					dv3.innerHTML += '<span class="product__variants__colors" alt='+v2[y]+' style="background-image: url('+img2[y]+')" ></span>';
				}
			}else{
				for ( var s = 0; s < v2.length; s++ ){ 
					dv3.innerHTML += '<span class="product__variants__itens--value">'+v2[s]+'</span>';
				}
			}
	}
}

const loopGetValuesByClass = (tag) => {
	for ( let i = 0; i < tag.length; i++ ){ 
		
		let g4 = tag[i].getAttribute('data-prod-id');
		let idPro,idProItens;

			idPro = g4+"Product"; 
			idProSearch = g4+"ProductSearch"; 
			idProCat = g4+"CategoryProduct"; 
			idProItens = g4+"ProductItens"; 
			idProMamd00 = g4+"MAMDVARIANTSID=2020-00";
			idProMamd01 = g4+"MAMDVARIANTSID=2020-01";

		let j = g4;
		let s = document.getElementById(idProSearch);
		let p = document.getElementById(idProCat);
		let m = document.getElementById(idPro);
		let n = document.getElementById(idProItens);
		let getValuesVariants00 = document.getElementsByName(idProMamd00);
		let getValuesVariants01 = document.getElementsByName(idProMamd01);

		
		let dataId = "data-prod-id";
		let dataType = "data-type-vars";
		let dataValue = "data-value-vars";
		let dataImg = "data-imgs-vars";

		if(m != null ){
			m.onmouseenter = function() {mouseOver(m,j)};
			m.onmouseleave = function() {mouseOut(m,j)};
		
		}
		if(n != null ){
			n.onmouseenter = function() {mouseOver(n,j)};
			n.onmouseleave = function() {mouseOut(n,j)};

	
			
		}
		if(p != null ){
			p.onmouseenter = function() {mouseOver(p,j)};
			p.onmouseleave = function() {mouseOut(p,j)};
		
			
		}
		if(s != null ){
			s.onmouseenter = function() {mouseOver(s,j)};
			s.onmouseleave = function() {mouseOut(s,j)};
		
			
		}
		 

		
	const mouseOver = (el,f) => {
			//  el.style.background = "#fff";

			 arrIdsPro = getValuesByClassName(getValuesVariants00,arrIdsPro,dataId);
			 arrIdsPro1 = getValuesByClassName(getValuesVariants01,arrIdsPro1,dataId);

			 arrType = getValuesByClassName(getValuesVariants00,arrType,dataType);
			 arrType1 = getValuesByClassName(getValuesVariants01,arrType1,dataType);

			 arrValue = getValuesByClassName(getValuesVariants00,arrValue,dataValue);
			 arrValue1 = getValuesByClassName(getValuesVariants01,arrValue1,dataValue);

			 arrImgs = getValuesByClassName(getValuesVariants00,arrImgs,dataImg);
			 arrImgs1 = getValuesByClassName(getValuesVariants01,arrImgs1,dataImg);

			 idVar0 = veficationEqualsVariants(arrIdsPro);
			 typeVar0 = veficationEqualsVariants(arrType);
			 valuVar0 = veficationEqualsVariants(arrValue);
			 imgsVar0 = veficationEqualsVariants(arrImgs);
		
			 idVar1 = veficationEqualsVariants(arrIdsPro1);
			 typeVar1 = veficationEqualsVariants(arrType1);
			 valuVar1 = veficationEqualsVariants(arrValue1);
			 imgsVar1 = veficationEqualsVariants(arrImgs1);

	
			let div00 = divJsInn(p1+f);
			let div01 = divJsInn(p2+f);
			let div02 = divJsInn(p3+f);
			let div03 = divJsInn(p4+f);
	

			let divH00 = divJsInn(h1+f);
			let divH01 = divJsInn(h2+f);
			let divH02 = divJsInn(h3+f);
			let divH03 = divJsInn(h4+f);

		
			if(div00 != null || div01 != null || div02 != null || div03 != null){
			div00.style.display = "block";
			div01.style.display = "block";

			div02.style.display = "block";
			div03.style.display = "block";
			innerthtmlLoopStyle(typeVar0,typeVar1,imgsVar0,imgsVar1,div00,div01,div02,div03,valuVar0,valuVar1);

			}
			if(divH00 != null || divH01 != null || divH02 != null || divH03 != null){

			divH00.style.display = "block";
			divH01.style.display = "block";

			divH02.style.display = "block";
			divH03.style.display = "block";
			innerthtmlLoopStyle(typeVar0,typeVar1,imgsVar0,imgsVar1,divH00,divH01,divH02,divH03,valuVar0,valuVar1);

			}

		}

	const mouseOut = (el,f) => {
			// el.style.background = "#000";
		
			let div00 = divJsInn(p1+f);
			let div01 = divJsInn(p2+f);
			let div02 = divJsInn(p3+f);
			let div03 = divJsInn(p4+f);

			let divH00 = divJsInn(h1+f);
			let divH01 = divJsInn(h2+f);
			let divH02 = divJsInn(h3+f);
			let divH03 = divJsInn(h4+f);

			arrIdsPro = [];
			arrIdsPro1 = [];

			arrType = [];
			arrType1 = [];

			arrValue = [];
			arrValue1 = [];
			arrImgs = [];
			arrImgs1 = [];

			typeVar0 = "";
			valuVar0 = ""; 
			imgsVar0 = ""; 
	
			typeVar1 = "";
			valuVar1 = "";
			imgsVar1 = "";

			if(div00 != null || div01 != null || div02 != null || div03 != null){
			divJsStyle(div00);
			divJsStyle(div01);
			divJsStyle(div02);
			divJsStyle(div03);
			}
			if(divH00 != null || divH01 != null || divH02 != null || divH03 != null){
			divJsStyle(divH00);
			divJsStyle(divH01);
			divJsStyle(divH02);
			divJsStyle(divH03);
			}
		

		}
			
	}
}

const getValuesByClassName = (className,arrPush,att) => {
	for ( let x = 0; x < className.length; x++ ){ 
			arrPush.push(className[x].getAttribute(att));
	}
	return arrPush;
}

const veficationEqualsVariants = (arrs) => {
	let unique = [...new Set(arrs)];
	return unique;
};

(function(){
	loopGetValuesByClass(tagPro00);
	loopGetValuesByClass(tagPro01);
	loopGetValuesByClass(tagHome00);
	loopGetValuesByClass(tagHome01);

})();




(function(){

    var $bannerContainer = document.querySelector('.banner__center.swiper-container'),
        bannerControls;

    if ($bannerContainer === null) return;

    bannerControls = {
        arrows: $bannerContainer.getAttribute('data-arrows') ? true : false,
        typePagination: $bannerContainer.getAttribute('data-type-pagination'),
        infinite: $bannerContainer.getAttribute('data-infinite') ? true : false,
        effect: $bannerContainer.getAttribute('data-effect'),
        mouseWheel: $bannerContainer.getAttribute('data-mouse') ? true : false,
        autoplay: $bannerContainer.getAttribute('data-autoplay') ? true : false,
        interval: $bannerContainer.getAttribute('data-interval'),
    }

    var swiper = new Swiper($bannerContainer, {
        slidesPerView: 1,
        grabCursor: true,

        preloadImages: true,

        lazy: {
            loadPrevNext: true,
            loadOnTransitionStart: true,
        },

        effect: bannerControls.effect,
        loop: bannerControls.infinite,
        mousewheel: bannerControls.mouseWheel,

        autoplay: {
            delay: bannerControls.interval,
            disableOnInteraction: true,
        },

        pagination: {
            el: '.swiper-pagination',
            clickable: true,
            type: bannerControls.typePagination,
        },

        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
})()















