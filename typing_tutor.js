<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<style type="text/css">
	.main{text-align: center; width: 100%; border: 1px solid red; margin-top:200px;}
	.left{width:25%; margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid blue; text-align: right;  display: inline-block;
				border-right-color:#eaeaea; color:#c0c0c0;}
	.right{width:25%; margin:5px 0 5px 0; padding:5px; font-size: 30px; border: 1px solid green; text-align: left; display: inline-block;
				border-left-color:#eaeaea;}	
</style>

</head>
<body style="margin:auto 0; text-align: center;">
	<div class="main">
		<div class="left" id="l">3</div><div class="right" id="r" onclick="Type()"></div>
	</div>

<script>
var left_div  = [];
var right_div = ["B", "s", " ", "l"];

document.getElementById("r").innerHTML = right_div;


function Type() {
    left_div = right_div.shift();
    document.getElementById("r").innerHTML = right_div;
}

</script>

</body>
