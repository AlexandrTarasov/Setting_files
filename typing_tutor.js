<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<style type="text/css">
	.body{width: 100%;
    height: 100%; position: absolute;
    top: 0;
    left: 0;
    overflow: auto; 
    margin: 0px; line-height: 1;}

	.main{text-align: center; width: 725px;  overflow: auto; margin: 60px auto; display: table; }
	.left{width:350px; height:35px;    display: inline-block;margin:auto; padding:5px;border: 1px solid blue; text-align: right; overflow: hidden;
				border-right-color:#eaeaea; color:#c0c0c0; box-sizing: content-box; font-size: 28px;     font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"; line-height: 1.3;}

	.right{width:350px; height:35px; margin:auto;  padding:5px;  border: 1px solid green; text-align: left;  display: inline-block;
				border-left-color:#eaeaea; float: right; box-sizing: content-box; font-size: 30px;     font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";}
	#counterDiv{ font-size: 20px; }	
</style>

</head>
<body class="body">
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4"> <a class="navbar-brand" href="#">Tarasov Learn English</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button> <div class="collapse navbar-collapse" id="navbarCollapse"> <ul class="navbar-nav mr-auto"> <li class="nav-item active"> <a class="nav-link" href="#">Main <span class="sr-only">(current)</span></a> </li> <li class="nav-item">
            <a class="nav-link" href="#">Your texts</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Statistics</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Grammer</a>
          </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
  </nav>


	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="alert alert-success" style="width: 160px;" role="alert">Нажмакано: <span id="counterDiv"></span></div>
				<div class="alert alert-success" style="width: 160px;" role="alert">Time: <span id="timeDiv"></span></div>
			</div>
			<div class="col-9">Progress:
				<div class="progress" style="height: 20px;">
  				<div class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
				
				</div>
				<form>
					<div class="form-control"><label for="exampleFormControlFile1">Download your own file with text</label>
								<input type=file class="form-control-file"> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="main" aria-live="polite"  aria-atomic="true"><div class="left" id="l">&#9998;</div><input class="right" id="r" value="" ></div>
	<div class="container">
		<div class="card">
  		<div class="card-header">Luggage: Verbs</div>
  			<div class="card-body">
   				<a href="#">Irregular verbs TOP № 1</a> | <a href="#">Irregular verbs TOP № 2</a> |
   				<a href="#">Regular verbs</a> | <a href="#">The most common verbs</a> | <a href="#">The most common nouns</a>
  			</div>
		</div>
			<br/>
		<div class="card">
  		<div class="card-header">Luggage: Nouns</div>
  			<div class="card-body">
   				<a href="#">Top 1500 Nouns (part 1)</a> / <a href="#">Top 1500 Nouns (part 2)</a> | 
   				 <a href="#">fifty fruit</a> / <a href="#">The most common nouns</a>
  			</div>
		</div>
	</div>
	</div>
</body>
<script>

let sec = '';
let minutes = ''; 
let right_str = '';
let left_div  = '';
let buffer = '';
let char = '';
let typo_amout = 0;
let counter = 0;
let length_of_string = 0;
let newprogress = 0;
let procentage_in_bar = 0;
let time_of_typing = []; 
let pause = false;
let pause_time = [];
pause_time['sum'] = 0;
let right_input = ["be was were been быть beat beat beaten бить become became become становиться begin began begun начинать bleed bled bled кровоточить blow blew blown дуть break broke broken ломать bring brought brought приносить build built built строить burn burnt burnt гореть burst burst burst разразиться buy bought bought покупать catch caught caught ловить хватать успет choose chose chosen выбирать come came come приходить cost cost cost стоить creep crept crept ползать cut cut cut резат do did done делат draw drew drawn рисовать тащить dream dreamt dreamt мечтать дремать drink drank drunk пить drive drove driven водить eat ate eaten есть fall fell fallen падать feed fed fed кормить feel felt felt чувствовать fight fought fought бороться find found found находить fit fit fit подходить по размеру fly flew flown летать forget forgot forgotten забывать forgive forgave forgiven прощать freeze froze frozen замерзать get got got получать give gave given давать go went gone идти grow grew grown расти hang hung hung вешать have had had иметь hear heard heard слышать hide hid hidden прятать hit hit hit попадать в цель hold held held держать hurt hurt hurt ушибить keep kept kept содержать kneel knelt knelt стоять на коленях know knew known знать lay laid laid класть lead led led вести lean leant leant наклоняться learn learnt learnt учить leave left left оставлять lend lent lent занимать let let let позволять lie lay lain лежать light lit lit освещать lose lost lost терять make made made производить mean meant meant значить"];



right_str = document.getElementById("r").value  = right_input[0]
length_of_string = right_str.length;

$( ".right" ).keypress(function(event) {

	newprogress = 100/length_of_string * counter;
	procentage_in_bar = (newprogress).toFixed(1);

	$('.progress-bar').attr('aria-valuenow', newprogress).css('width',newprogress+'%');
	$('.progress-bar').text(procentage_in_bar+'%');
	
	event.preventDefault(); //prevent default action (doens't set characters) 
	char = event.key;	

  if(char == 'Enter'){
  	pause_time['start'] = Date.now();
  	pause = confirm("Pause. Contine typing press \"OK\"");
  	if(pause == true){pause_time['stop'] = Date.now(); 
  		pause_time['sum'] += pause_time['stop']-pause_time['start'];
  		alert(pause_time['sum']);
  	}
  }
  else{
	
		if(right_str.length>0){
			if(char == right_str.charAt(0)){
			  
			buffer = right_str.charAt(0);
			right_str = right_str.slice(1);
			left_div = left_div+buffer;
			  
			 if(left_div.length>25){left_div = left_div.slice(1);} 
			 document.getElementById("r").value = right_str;
			 document.getElementById("l").innerHTML = left_div;

			 counter++;
			 document.getElementById('counterDiv').innerHTML = counter;
			 
			if(counter == 1){ time_of_typing['start'] = Date.now()+pause_time['sum'];}
			if(right_str.length == 1){time_of_typing[1] = Date.now();}
			
			time_of_typing[1] = Date.now();
			sec = ((time_of_typing[1]-(time_of_typing['start']+pause_time['sum']))/1000);

			minutes = (sec/60);

			if (minutes < 1){
				minutes = 0; sec = (sec % 60).toFixed(1);
			} else{
				minutes = parseInt(minutes); sec = (sec % 60).toFixed(1);
			}

			document.getElementById('timeDiv').innerHTML = minutes+' min '+sec+' sek.';

			if(right_str==0){ alert("Усё напечатал. Опечаток "+typo_amout); }

			}
			else{ 
				alert("Typo"); 
				typo_amout++;
				var audio = new Audio('pig_grants.mp3');
				audio.play();
			}
		}
		else{	

			alert("Усё напечатал. Опечаток "+typo_amout);
		}
	}
	//precentage bar hendler
	newprogress = 100/length_of_string * counter;
	procentage_in_bar = (newprogress).toFixed(1);
	$('.progress-bar').attr('aria-valuenow', newprogress).css('width',newprogress+'%');
	$('.progress-bar').text(procentage_in_bar+'%');
	//precentage bar hendler end
	console.log(minutes+" min "+sec+" sec");	
	
});


</script>

</html>
