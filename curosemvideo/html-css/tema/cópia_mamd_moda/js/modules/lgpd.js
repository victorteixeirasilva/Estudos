  var cookieBanner = document.getElementById("cookieDisclaimerBanner");
  const lgpdCookieBanner = () => {    
      document.getElementById("cookieDisclaimerButton").addEventListener("click", function () {
          var d = new Date();
          var u = window.location.hostname;
          d.setTime(d.getTime() + (4*525600*60*1000));
          var expires = "expires=" + d.toGMTString();
          var cname= "bannerLgpd" ;
          var cvalue= "1" ;
          document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
          cookieBanner.parentNode.removeChild(cookieBanner);
      });
  }

  (function(){
    setTimeout(function(){
      cookieBanner.style.display = 'flex';
      cookieBanner.style.justifyContent = "center";
      cookieBanner.style.alignItems = "center";
      cookieBanner.style.visibility = 'visible';
      cookieBanner.style.transition = 'ease-out 2s';
      cookieBanner.style.opacity = "0.7s";
    }, 2000);
    setTimeout(function(){
      cookieBanner.style.opacity = "0.9";
    }, 2300);
    
    lgpdCookieBanner();
    var b = getCookie("bannerLgpd");
      if(b == 1){
          cookieBanner.parentNode.removeChild(cookieBanner);
      }
      
  })();

    function getCookie(cname) {
      var name = cname + "=";
      var decodedCookie = decodeURIComponent(document.cookie);
      var ca = decodedCookie.split(';');
      for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
          c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
          return c.substring(name.length, c.length);
        }
      }
      return "";
    }
    
