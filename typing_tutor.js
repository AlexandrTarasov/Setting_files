<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<style type="text/css">
	.main{text-align: center; width: 100%; border: 1px solid red; margin-top:200px;}
	.left{width:25%;  margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid blue; text-align: right;  display: inline-block;
				border-right-color:#eaeaea; color:#c0c0c0;}
	.right{width:25%;  margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid green; text-align: left; display: inline-block;
				border-left-color:#eaeaea;}	
</style>

</head>
<body style="margin:auto 0; text-align: center;">
	<div class="main">
		<div class="left" id="l">3</div><div class="right" id="r" onclick="onkeypress()"></div>
	</div>

<script>
var left_div  = [];
var right_div = ["B", "s", " ", "l"];
let buffer = '';

document.getElementById("r").innerHTML = right_div.join('');


function Type() {

		if(right_div.length>0){
    	buffer = right_div.shift();
    	left_div.push(buffer); 
    	document.getElementById("r").innerHTML = right_div;
    	document.getElementById("l").innerHTML = left_div.join('');
  	}
  	else{alert("Усё напечатал")}

}

</script>

</body>

</html>



