let dateStart, dateEnd, millisecondsStart, millisecondsEnd, totalMilseconds, idClock;
let idDateStart = document.getElementsByClassName("dateStartProd");

const clockExpired = (idTitle,idTitleDay,idTitleHour,idTitleMin,idTitleSec,endTime) => {
    var now = new Date().getTime();
    let distance = endTime - now;
  
    if(distance < 0 || isNaN(endTime)){
      idTitle.style.display = "none";
      idTitleDay.style.display = "none";
      idTitleHour.style.display = "none";
      idTitleMin.style.display = "none";
      idTitleSec.style.display = "none";
    } 
    
  }

const clockTimeDays = (idDay,endTime) => {
    var x = setInterval(function() {
     
      var now = new Date().getTime();
      let distance = endTime - now;
    
      let days = Math.floor(distance / (1000 * 60 * 60 * 24));
      
      idDay.innerHTML = days + " d " ;
        
      if (distance < 0 ) {
        clearInterval(x);
        idDay.innerHTML = "";
      }
    }, 1000);
    }


const clockTimeHours = (idDay2,endTime2) => {
    var x = setInterval(function() {
     
      var now = new Date().getTime();
      let distance = endTime2 - now;
    
      let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      idDay2.innerHTML = hours + " h " ;

      if (distance < 0 ) {
        clearInterval(x);
        idDay2.innerHTML = "";
      }
    }, 1000);
    }


const clockTimeMinuts = (idDay3,endTime3) => {
    var x = setInterval(function() {
     
      var now = new Date().getTime();
      let distance = endTime3 - now;
    
      let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      idDay3.innerHTML = minutes + " m " ;
        
      if (distance < 0 ) {
        clearInterval(x);
        idDay3.innerHTML = "";
      }
    }, 1000);
    }


const clockTimeSecunds = (idDay4,endTime4) => {
    var x = setInterval(function() {
     
      var now = new Date().getTime();
      let distance = endTime4 - now;
      let seconds = Math.floor((distance % (1000 * 60)) / 1000);
        console.log(seconds)
      idDay4.innerHTML = seconds + " s " ;
        
      if (distance < 0 ) {
        clearInterval(x);
        idDay4.innerHTML = "";
      }
    }, 1000);
    }
    

const loopGetValuesByData = (tag) => {
	for ( let i = 0; i < tag.length; i++ ){ 
      
       let c = tag[i].getAttribute('data-id-clock');
       let e = tag[i].getAttribute('data-date-end');

       let  titleClock = document.getElementById("title"+c);

       let  dayClock = document.getElementById("day"+c);
       let  hourClock = document.getElementById("hour"+c);
       let  minutsClock = document.getElementById("minute"+c);
       let  secundsClock = document.getElementById("seconds"+c);
         
        dateEnd = new Date(e); 
        clockExpired(titleClock,dayClock,hourClock,minutsClock,secundsClock,dateEnd)
       
        if (isNaN(dateEnd)) {  
           
          } else {
            
            millisecondsEnd = dateEnd.getTime(); 

            clockTimeDays(dayClock,millisecondsEnd);
            clockTimeHours(hourClock,millisecondsEnd);
            clockTimeMinuts(minutsClock,millisecondsEnd);
            clockTimeSecunds(secundsClock,millisecondsEnd);

        }
          
    }
};

(function(){
  loopGetValuesByData(idDateStart);
})();
