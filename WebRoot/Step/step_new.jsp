<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Gene Expression Search</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Wei" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="Css/bootstrap-table.min.css" />
<link type="text/css" rel="stylesheet" href="Css/main.css" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script src="Jscript/datad.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
.loading{
	width:230px;
	height:56px;
	position: absolute;
	top:40%;
	left:80%;
	line-height:56px;
	color:#fff;
	padding-left:60px;
	font-size:15px;
	background: #000 url(images/loader.gif) no-repeat 20px 50%;
	opacity: 0.7;
	z-index:9999;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#next").click(function() {
			var myData = $('#table-methods-table').bootstrapTable('getAllSelections');
 			var inputtext=$("#inputtext").val();
			if (inputtext != "" && myData.length != 0) {
				form.submit();
			} else {
				if (myData.length == 0) {
				alert("Please select at least one Trait!");
				return false;
				} else{
				alert("Please input gene IDs!");
				return false;
				}
			}
		});
	});
</script>
	<script type="text/javascript"> 
        var blast_example = 
'AC148152.3_FG008\n'+
'AC148167.6_FG001\n'+
'AC149475.2_FG003\n'+
'AC149475.2_FG005\n'+
'AC149810.2_FG008\n'+
'AC155377.1_FG001\n'+
'AC155434.2_FG004\n'+
'AC155496.2_FG009\n'+
'AC155622.2_FG001\n'+
'AC155624.2_FG011\n';
        function showExample(){
        	$('#inputtext').val(blast_example);
        }

        function resetExample(){
            $('#inputtext').val("");
        }
	
 </script>
</head>

<body>
	<%@ include file="../ListHeader.jsp"%>
	<h3 style="position:relative;left:4.9%;">Gene Expression Search</h3>
	<br>
	<div class="container" style="height:650px;">
		<div class="describe">
			<p>
				<font size="3">The expression values by RPKM normalization can be searched and displayed.</font>
			</p>
		</div>
		<form action="showNew" method="post" onsubmit="return check();">
            <div class="row">
            <div class="col-md-6">
            <div id="wait">
					</div>
			<div class="search">
<style>
table, table tr th, table tr td {
    padding: 8px;
}

::-webkit-scrollbar{
    display:none;
}
</style>
				<table id="table-methods-table" data-toggle="table" data="data"
					data-height="500" >
					<thead>
						<tr>
							<th data-field="state" data-checkbox="true" ></th>
							<th data-field="id" data-align="center" data-sortable="true">
								Sample</th>
						</tr>
					</thead>
				</table>
			</div>
			</div>
			<br> <br> <input type="hidden" id="sead" name="trait" />
			<div class="col-md-6">
			<div class="search">
<style>
.col-md-9, .col-xs-9, col-md-9{
    padding:10px 10px
}

</style>
				<div class="row col-md-9 col-md-offset-1">
					<div class="background" style="height:300px;padding:5px;clear:both"><!-- lv 7-11-10：01 change class=""->class="background" 180px->280px-->
                        <span style="padding-left:8px;display:inline-block;height:30px;line-height:30px;"><h4>Input gene IDs:</h4></span><!-- lv 7-11-10：49 change -->
                        <div class="btn example" onclick="showExample()" style="padding:2px 2px;font-size:15;width:80px;">example</div>
                        <div class="btn example" onclick="resetExample()" style="padding:2px 2px;font-size:15;width:80px;">reset</div>
                        <textarea style="resize:none;height:220px;" class="form-control" rows="8" name="inputtext" id="inputtext" type="text" onblur='javascript:$("#auto")'></textarea><!-- lv 7-11-10：49 change rows8->12-->
                 </div>
				</div>
				
			</div>
			</div>
			<div class="btns" >
				<button class="btn" text-algin="left" id="next" float="right">Submit</button>
			</div>
			</div>
		</form>
	</div>
	<%@ include file="../ListFooter.jsp"%>
	<script type="text/javascript">
		$(function() {
			$(".eg").tooltip();
		});
		jQuery.fn.bootstrapTable.defaults.data = data;
	
		function check() {
			//alert(JSON.stringify(myData));
			var myData = $('#table-methods-table').bootstrapTable('getAllSelections');
 			//var inputtext=$("#inputtext").val();
			
			//if (myData.length == 0) {
			//	alert("Please select at least one Trait!");
			//	return false;
			//} else if (inputtext == "") {
			//	alert("Please input gene IDs!");
			//	return false;
			//} 
			var num = myData.length;
			var tas = new Array();
			for (var i = 0; i < num; i++) {
				tas[i] = myData[i].id;
			//alert(tas[i]);
			}
			//alert(tas);
			//var name = myData[0].name;
			//$('#sead').val(name);
			$('#sead').val(tas);
			var str = $("<div id='loading' class='loading'>Please Waiting .....</div>");
			$('#wait').append(str);
			$("#next").attr("disabled",true);
		}
	</script>
</body>
</html>
