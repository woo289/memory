<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<link href="/qqu/resources/vendor/bootstrap/css/bootstrap.css"	rel="stylesheet" type="text/css">
<link href="/qqu/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/qqu/resources/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">
<link href="/qqu/resources/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/qqu/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/qqu/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/qqu/resources/vendor/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/qqu/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/qqu/resources/js/moment.js"></script>
<script type="text/javascript" src="/qqu/resources/js/transition.js"></script>
<script type="text/javascript" src="/qqu/resources/js/collapse.js"></script>
<script type="text/javascript" src="/qqu/resources/js/knockout.3.4.2.js"></script>
<script type="text/javascript" src="/qqu/resources/js/bootstrap-datetimepicker.min.js"></script>

<!-- <script type="text/javascript">
ko.bindingHandlers.dateTimePicker = {
	    init: function (element, valueAccessor, allBindingsAccessor) {
	        //initialize datepicker with some optional options
	        var options = allBindingsAccessor().dateTimePickerOptions || {};
	        $(element).datetimepicker(options);

	        //when a user changes the date, update the view model
	        ko.utils.registerEventHandler(element, "dp.change", function (event) {
	            var value = valueAccessor();
	            if (ko.isObservable(value)) {
	                if (event.date != null && !(event.date instanceof Date)) {
	                    value(event.date.toDate());
	                } else {
	                    value(event.date);
	                }
	            }
	        });

	        ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
	            var picker = $(element).data("DateTimePicker");
	            if (picker) {
	                picker.destroy();
	            }
	        });
	    },
	    update: function (element, valueAccessor, allBindings, viewModel, bindingContext) {

	        var picker = $(element).data("DateTimePicker");
	        //when the view model is updated, update the widget
	        if (picker) {
	            var koDate = ko.utils.unwrapObservable(valueAccessor());

	            //in case return from server datetime i am get in this form for example /Date(93989393)/ then fomat this
	            koDate = (typeof (koDate) !== 'object') ? new Date(parseFloat(koDate.replace(/[^0-9]/g, ''))) : koDate;

	            picker.date(koDate);
	        }
	    }
	};
</script> -->
<script type="text/javascript">
    
    $(function () {
    	
    	$('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
        
    });
</script>

</head>
<body>

<div class="container">
    <div class='col-md-5'>
        <div class="form-group">
            <div class='input-group date form_datetime' id='datetimepicker6'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
               
            </div>
             
            
        </div>
       
    </div>
    <div class='col-md-5'>
        <div class="form-group">
            <div class='input-group date form_datetime2' id='datetimepicker7'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                
            </div>
            
        </div>
       
    </div>
    <input type="text" id="mirror_field" value="" readonly />
    <input type="text" id="mirror_field2" value=""  readonly />
</div>
 <script type="text/javascript">
$(".form_datetime").datetimepicker({
    format: "dd MM yyyy - hh:ii",
    linkField: "mirror_field",
    linkFormat: "yyyy-mm-dd hh:ii"
    
});

$(".form_datetime2").datetimepicker({
    format: "dd MM yyyy - hh:ii",
    linkField: "mirror_field2",
    linkFormat: "yyyy-mm-dd hh:ii"
    });

</script>    
</body>
</html>