$( document ).ready(function() {
    
    function menuClick(id) {
      if(document.getElementsByClassName('click')[id].style.display == "block"){
        document.getElementsByClassName('click')[id].style.display = "none";
        $('.act')[id].classList.remove("active");
      }else{
        document.getElementsByClassName('click')[id].style.display = "block";
        $('.act')[id].classList.add("active");
      }
    }
})