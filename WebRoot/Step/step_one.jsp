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
<title>GWAS Search</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="Css/bootstrap-table.min.css" />
<link type="text/css" rel="stylesheet" href="Css/main.css" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script src="Jscript/data.js" type="text/javascript"></script>
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
		$('input:radio[name="search"]').click(function() {
			var val = $('input:radio[name="search"]:checked').val();
			//alert(val);
			if (val == "first") {
				$("#sh1").removeAttr("readonly");
				$("#sh2").removeAttr("readonly");
				$("#sh3").attr("readonly", "readonly");
				$("#sh3").val("");
			} else {
				$("#sh3").removeAttr("readonly");
				$("#sh1").attr("readonly", "readonly");
				$("#sh2").attr("readonly", "readonly");
				$("#sh1").val("");
				$("#sh2").val("");
			}
		});


		$("#next").click(function() {
			var val = $('input:radio[name="search"]:checked').val();
			if (val == "first" || val == "second") {
				form.submit();
			} else {
				var myData = $('#table-methods-table').bootstrapTable('getAllSelections');
				if (myData.length == 0) {
				alert("Please select at least one Trait!");
				} else{
				alert("Please select “Search By Region” or “Search By Gene ID”");
				}
			}
		});
	});
</script>
</head>

<body>
	<%@ include file="../ListHeader.jsp"%>
	<h3 style="position:relative;left:4.9%;">GWAS Search</h3>
	<br>
	<div class="container" style="height:700px;">
		<div class="describe">
			<p>
				<font size="3">Single-variant-based GWAS and haplotype-based GWAS results of 23 agronomic traits for poplulation were available in this section. And detailed information of significant SNPs(p&lt;2.79x10-8) for you interested traits can be queried by limiting genomic coordinate or gene ID.</font>
			</p>
			<!-- 
   						<a href="https://1479696753-my.sharepoint.com/personal/weicc_hechuan_ooo/_layouts/15/onedrive.aspx?originalPath=aHR0cHM6Ly8xNDc5Njk2NzUzLW15LnNoYXJlcG9pbnQuY29tLzpmOi9nL3BlcnNvbmFsL3dlaWNjX2hlY2h1YW5fb29vL0VuTVI3MW1IRHc5UHROSlNTWTBsUHlVQm5XclUtNUJfaVdGNDgzUEI1ZTdzc3c%5FcnRpbWU9ZUsxcFNYalIxMGc&id=%2Fpersonal%2Fweicc%5Fhechuan%5Fooo%2FDocuments%2F%E5%85%B1%E4%BA%AB%2Fcubic%2FQTL" target="_blank" style="text-indent:2em; color: #fc8e00">[Summary of QTL regions for CUBIC]
   						</a>
   			 -->
   			<span> The GWAS QTL regions have been deposited in the figshare database
   				</span>
   				<br>
   				<span>（DOI:10.6084/m9.figshare.12220367; https://figshare.com/)
   				</span>
		</div>
		<form action="showThree" method="post" onsubmit="return check();">
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
					<!-- data-height="246" -->
					<thead>
						<tr>
							<th data-field="state" data-checkbox="true" ></th>
							<th data-field="id" data-align="center" data-sortable="true">Trait
								Name</th>
							<th data-field="name" data-align="center" data-sortable="true">Full
								Name</th>
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
					<input type="radio" name="search" value="first"> <font
						size="3">Search By Region</font><br>
					<div class="col-md-9 col-xs-9"
						style="padding-right:3px;padding-left:3px;">
						<div class="input-group ">
                    <span class="input-group-addon">Chromesome:</span>
						<select class="form-control eg" style="display:inline;"
							title="eg: Chr1" name="chr" id="sel2">
							<option value='' disabled selected style='display:none;' style="width:300px;">Choose One Chromesome</option>
							<option value="1">Chr1</option>
							<option value="2">Chr2</option>
							<option value="3">Chr3</option>
							<option value="4">Chr4</option>
							<option value="5">Chr5</option>
							<option value="6">Chr6</option>
							<option value="7">Chr7</option>
							<option value="8">Chr8</option>
							<option value="9">Chr9</option>
							<option value="10">Chr10</option>
						</select>
					</div>
					</div>
					<div class="col-md-9 col-xs-9">
						<div class="input-group ">
							<span class="input-group-addon">Start:</span> <input type="text"
								class="form-control eg" title="eg: 147" style="display:inline;width:300px;" name="start"
								readonly="readonly" id="sh1">
						</div>
					</div>


					<div class="col-md-9 col-xs-9">
						<div class="input-group ">
							<span class="input-group-addon">End:</span> <input type="text"
								class="form-control eg" title="eg: 6782830 " style="width:310px; display:inline;"name="end"
								readonly="readonly" id="sh2">
						</div>
					</div>
					<br>
					<%--<span style="color:gray;float:left;"><font size="3">(eg: Chr1 147 6782830 )</font></span><!--修改了与注释不符的错误-->--%>
				</div>
				<div class="row col-md-9 col-md-offset-1">
					<input type="radio" name="search" value="second"><font
						size="3"> Search By Gene ID</font><br>
					<!--定义了字体大小-->
                    <div class="col-md-7 col-xs-7">
					<div class="input-group ">
						<span class="input-group-addon">Gene:</span> <input type="text"
							class="form-control eg" style="width:220px;"
							title="eg: GRMZM2G040389" name="gene" readonly="readonly"
							id="sh3">
					</div>
					</div>
					<%--<span style="color:gray;float:left;"><font size="3">(eg: GRMZM2G040389 )</font></span><!--修改了与注释不符的错误-->--%>
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
		/*
		$ajax({
		        	type:"get",
		    			url:"showTrait",
			success:function(result){
		    				alert("success");
		    				var result = [{"id": 2,"name": "sb"}]; 
				jQuery.fn.bootstrapTable.defaults.data = result;
			},
			error:function(){
				alert("系统异常，请稍后重试");
				var result = [{"id": 1,"name": "bb"}]; 
				jQuery.fn.bootstrapTable.defaults.data = result;
			}
		});
		*/
		jQuery.fn.bootstrapTable.defaults.data = data;
	
		function check() {
			var myData = $('#table-methods-table').bootstrapTable('getAllSelections');
			//alert(JSON.stringify(myData));
			//alert(myData.length);
			var val = $('input:radio[name="search"]:checked').val();
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
			if (num == 0) {
				alert("Please select at least one Trait!");
				return false;
			} else if (val == undefined) {
				return false;
			} else {
				if (val == "first") {
				var start = /^\d+$/.test($("#sh1").val());
				var end = /^\d+$/.test($("#sh2").val());
				
					if ($(".form-control :selected").val() == ''){
						alert("Please select one Chromosome.");
						return false;
					}
					if((!start || !end) && $("#sh2").val() != '' && $("#sh1").val() != '') {
						if(!start && !end) {
							alert("Please input the correct start and end,like 147 and 6782830.");
							
						} else if(!start) {
							alert("Please input the correct start,like 147.");
						}
						else{alert("Please input the correct end,like 6782830.");}
						return false;
					
					}
					else if (start && end) {
                     	if(parseInt($("#sh1").val()) > parseInt($("#sh2").val())){
                         	  alert("Input start or end position error,please input again.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '1' && parseInt($("#sh2").val()) > 300479650) {
                     		alert("Please input a number of end position less than 300479650.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '2' && parseInt($("#sh2").val()) > 237033410) {
                     		alert("Please input a number of end position less than 237033410.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '3' && parseInt($("#sh2").val()) > 229669323) {
                     		alert("Please input a number of end position less than 229669323.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '4' && parseInt($("#sh2").val()) > 237410737) {
                     		alert("Please input a number of end position less than 237410737.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '5' && parseInt($("#sh2").val()) > 215109004) {
                     		alert("Please input a number of end position less than 215109004.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '6' && parseInt($("#sh2").val()) > 168172808) {
                     		alert("Please input a number of end position less than 168172808.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '7' && parseInt($("#sh2").val()) > 176393750) {
                     		alert("Please input a number of end position less than 176393750.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '8' && parseInt($("#sh2").val()) > 172234845) {
                     		alert("Please input a number of end position less than 172234845.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '9' && parseInt($("#sh2").val()) > 154216405) {
                     		alert("Please input a number of end position less than 154216405.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '10' && parseInt($("#sh2").val()) > 146087335) {
                     		alert("Please input a number of end position less than 146087335.");
                          	 return false;
                     	}
                     	var str = $("<div id='loading' class='loading'>Loading pages...</div>");
						$('#wait').append(str);
						$("#next").attr("disabled",true);
						return true;
					}
					else if($("#sh1").val() == '' && $("#sh2").val() != ''){
    					alert(("Please input start position!"));
    					return false;
    				} 
    				else if($("#sh2").val() == '' && $("#sh1").val() != ''){
    					alert(("Please input end position!"));
    					return false;
    				} 
					else {
						alert("Please input start and end position!");
						return false;
					}
				} else if (val == "second"){
				var gene = /^(?![0-9]+$)(?![A-Z]+$)[0-9A-Z]{12,17}$/.test($("#sh3").val());
					if($("#sh3").val() == '') {
						alert("Please input the Gene ID!");
						return false;
					}
					else if (!gene) {
						alert("Please input the correct Gene ID! like GRMZM2G040389.");
						return false;
					}
				}
			}
			var str = $("<div id='loading' class='loading'>Please Waiting .....</div>");
			$('#wait').append(str);
			$("#next").attr("disabled",true);
		}
		//加载自己的数据时将data.js文件里的值修改了就是
		//jQuery.fn.bootstrapTable.defaults.data = data;
	</script>
</body>
</html>
