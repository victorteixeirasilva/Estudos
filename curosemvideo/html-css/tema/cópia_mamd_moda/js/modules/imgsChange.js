const changeThisImg01 = (id) => {
    let classImgVal = document.getElementById(id.id);
    let originalImgId = classImgVal.dataset.classimg     
    let idImgOriginal = document.getElementById(originalImgId);
    idImgOriginal.src = id.id; 
    idImgOriginal.srcset = id.id; 
}
 
