function zoom(e){
    var zoomer = e.currentTarget;
    e.offsetX ? offsetX = e.offsetX : offsetX = e.touches[0].pageX
    e.offsetY ? offsetY = e.offsetY : offsetX = e.touches[0].pageX
    x = offsetX/zoomer.offsetWidth*100
    y = offsetY/zoomer.offsetHeight*100
    zoomer.style.backgroundPosition = x + '% ' + y + '%';
  }
  
let imgProductZoomUrl = document.getElementById('imgZoomProduct0');
let imgProductZoomImg = document.getElementById('imgZoomProduct1');

let imgClass = document.getElementsByClassName("imgZoomCarrosel");

const changeThis = (id) => {
    imgProductZoomUrl.style.backgroundImage = "url("+id.id+")";
    imgProductZoomUrl.style.backgroundRepeat = "no-repeat";
    imgProductZoomUrl.style.position = "relative";

    imgProductZoomImg.src = id.id;  

}
 
