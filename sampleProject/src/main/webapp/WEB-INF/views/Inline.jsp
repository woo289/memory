<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<script type="text/javascript" src="/qqu/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/qqu/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<link href="/qqu/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
        $(function () {
            $('#datetimepicker12').datetimepicker({
                inline: true,
                sideBySide: true
            });
        });
    </script>
</head>
  
<body>
<div style="overflow:hidden;">
    <div class="form-group">
        <div class="row">
            <div class="col-md-8">
                <div id="datetimepicker12"></div>
            </div>
        </div>
    </div>
  
</div>
 
</body>
</html>