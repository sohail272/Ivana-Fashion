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

/*
$("#zoom_05").elevateZoom({
  zoomType				: "inner",
  cursor: "crosshair"
});*/

function productQuantity(){
		var valTotal = document.getElementById("total1").innerHTML;
		var splitTotal= valTotal.split('$')[1];
		var stablePrise = 100;
		var val = document.getElementById("prodQuantId").value;
		
		var valTotalVal = val * stablePrise;
		document.getElementById("total1").innerHTML = "$" + valTotalVal;
		document.getElementById("totalAll").innerHTML = "$" +(valTotalVal + 200);
	}
	 function deleRow(delId){
		$('.rows')[delId].style.display = "none";
	 }