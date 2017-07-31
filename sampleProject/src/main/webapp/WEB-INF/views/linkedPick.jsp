<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>


<link href="/qqu/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/qqu/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link
	href="/qqu/resources/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="/qqu/resources/css/bootstrap-datetimepicker.css"
	rel="stylesheet">


<script type="text/javascript"
	src="/qqu/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/qqu/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/qqu/resources/js/moment.js"></script>
<script type="text/javascript" src="/qqu/resources/js/transition.js"></script>
<script type="text/javascript" src="/qqu/resources/js/collapse.js"></script>
<script type="text/javascript" src="/qqu/resources/js/knockout.3.4.2.js"></script>
<script type="text/javascript"
	src="/qqu/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/qqu/resources/vendor/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="/qqu/resources/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="/qqu/resources/js/bootstrap-datetimepicker.js"></script>
<!-- <script type="text/javascript"
	src="/qqu/resources/bootstrap-datetimepicker-master/Gruntfile.js"></script> -->




</head>
<body>
	<div class="container">
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date form_datetime' id='datetimepicker6'>
					<input type='text' class="form-control" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"> </span>
					</span>
				</div>
			</div>
		</div>
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date form_datetime2' id='datetimepicker7'>
					<input type='text' class="form-control" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span> <span class="add-on"><i
							class="icon-th"></i></span>
					</span>
				</div>

			</div>
		</div>
		<div class="form-group">
			 <input type="text" id="mirror_field" value="${datetimepicker6.text }" readonly />
   			 <input type="text" id="mirror_field2" value="${datetimepicker7.text }"  readonly />
		</div>

	</div>
	<script type="text/javascript">
	$(function() {

		$('#datetimepicker6').datetimepicker();
		$('#datetimepicker7').datetimepicker({
			useCurrent : false //Important! See issue #1075

		});

		$("#datetimepicker6").on("dp.change", function(e) {
			$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
		});
		$("#datetimepicker7").on("dp.change", function(e) {
			$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
		});
		
		

	});
</script>
	<script type="text/javascript">
	
		$(".form_datetime").datetimepicker({
			format : "dd MM yyyy",
			linkField : "mirror_field",
			linkFormat : "yyyy-mm-dd hh:ii"
		});
	
		$(".form_datetime2").datetimepicker({
			format : "dd MM yyyy",
			linkField : "mirror_field2",
			linkFormat : "yyyy-mm-dd hh:ii"
		});
	</script>
</body>
</html>