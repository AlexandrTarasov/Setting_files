<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.body{width: 100%;
    height: 100%; position: absolute;
    top: 0;
    left: 0;
    overflow: auto; }

	.main{text-align: center; width: 725px;  overflow: auto; margin: 100px auto; display: table;}
	.left{width:350px; height:35px;    display: inline-block;margin:auto; padding:5px; font-size: 30px; border: 1px solid blue; text-align: right; overflow: hidden;
				border-right-color:#eaeaea; color:#c0c0c0; }

	.right{width:350px; height:35px; margin:auto;  padding:5px; font-size: 30px; border: 1px solid green; text-align: left;  display: inline-block;
				border-left-color:#eaeaea; float: right;}	
</style>

</head>
<body class="body">
	<div class="main" aria-live="polite" aria-atomic="true"><div class="left" id="l">&#9998;</div><input class="right" id="r" value="" ></div>
</body>
<script>

let right_str = '';
var left_div  = '';
var right_input = ["I want learn English to advanced level"];
let buffer = '';
let char = '';
let typo_amout=0;


right_str = document.getElementById("r").value  = right_input[0]

$( ".right" ).keypress(function() {
	
	event.preventDefault(); //prevent defult 
  char = event.key;	

  
  
	if(right_str.length>0){
  	if(char == right_str.charAt(0)){
		  
		  buffer = right_str.charAt(0);
		  right_str = right_str.slice(1);
		  left_div= left_div+buffer; 
		  document.getElementById("r").value = right_str;
		  document.getElementById("l").innerHTML = left_div;
		}
		else{ alert("Typo"); typo_amout++;}
	}
	else{alert("Усё напечатал. Опечаток "+typo_amout);}
		
	console.log(char+" and "+buffer);	
	


});


</script>

</html>
