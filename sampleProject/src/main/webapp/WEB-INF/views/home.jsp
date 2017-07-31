<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="UTF-8" %>
<%@ page session="false" %>
<div class="container">
	<div class="row">
	<!DOCTYPE html>
<html ><!-- lang="en" -->
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	var a=0;
	$("#bt1").click(function(){
		$("#bt1").css("background-color","#747474");
		$("#bt1").css("color","#ffffff");
		alert("들어간다");
	});
	
	$("#bt2").click(function(){
		$("#bt2").css("background-color","#050099");
	});
	$("#bt3").click(function(){
		$("#bt3").css("background-color","#2F9D27");
		a=3;
	});
	$("#bt4").click(function(){
		$("#bt4").css("background-color","#008299");
		a=4;
	});
	$("#bt5").click(function(){
		$("#bt5").css("background-color","#997000");
		a=5;
	});
	$("#bt6").click(function(){
		$("#bt6").css("background-color","#980000");
		a=6;
	});
	
	
	
	

});
</script>
</head>
<body>
	<form action="">
		<div class="form-group" data-toggle="buttons"> 
			<h2>Button Styles</h2>
			<div class="radio">
			<input type="button" id="bt1" class="btn btn-default" value="Default" ckecked>
			</div>
			<div class="radio">
			<input type="button" id="bt2" class="btn btn-primary" value="Primary"ckecked>
			</div>
			<div class="radio">
			<input type="button" id="bt3" class="btn btn-success" value="Success"ckecked>
			</div>
			<div class="radio">
			<input type="button" id="bt4" class="btn btn-info" value="Info">
			</div>
			<div class="radio">
			<input type="button" id="bt5" class="btn btn-warning" value="Warning">
			</div>
			<div class="radio">
			<input type="button" id="bt6" class="btn btn-danger" value="Danger">
			</div>
		</div>
	</form>
	<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
