<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.main{text-align: center; width: 100%; border: 1px solid red; margin-top:200px;}
	.left{width:25%;  margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid blue; text-align: right;  display: inline-block;
				border-right-color:#eaeaea; color:#c0c0c0;}
	.right{width:25%;  margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid green; text-align: left; display: inline-block;
				border-left-color:#eaeaea;}	
</style>

</head>
<body style="margin:auto 0; text-align: center;" class="display">
	<div class="main" aria-live="polite" aria-atomic="true">
		<div class="left" id="l"> </div><div class="right" id="r" contenteditable=true onkeypress="Type()"></div>
		
		<p class="text-display"></p>
	</div>
</body>
<script>


var left_div  = [];
var right_div = ["B", "s", " ", "l"];
let buffer = '';
let char = '';


$( ".right" ).keypress(function() {
  		char = event.key;	
});


document.getElementById("r").innerHTML = right_div.join('');

	function Type() {

			
			//char = document.getElementById("r").innerHTML = String.fromCharCode(event.keyCode);
			//char = document.querySelector('.text-display').innerHTML = keyCodes[e.keyCode];

			if(right_div.length>0){
	    	buffer = right_div.shift();
	    	left_div.push(buffer); 
	    	document.getElementById("r").innerHTML = right_div;
	    	document.getElementById("l").innerHTML = left_div.join('');
	  	}
	  	else{alert("Усё напечатал");}

	  	console.log(char+" and "+buffer)

	};





</script>

</html>
