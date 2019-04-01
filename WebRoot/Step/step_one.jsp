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
				alert("please choose one chance");
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
			<p>
				<font size="3">Search the significant SNPs (2.79x10-8) in
					GWAS results in a number of ways, including by trait, SNP
					identifier, study and gene.</font>
			</p>
			<!--定义了字体大小-->
		</div>
		<form action="showThree" method="post" onsubmit="return check();">
            <div class="row">
            <div class="col-md-6">
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
					data-height="500">
					<!-- data-height="246" -->
					<thead>
						<tr>
							<th data-field="state" data-checkbox="true"></th>
							<th data-field="id" data-align="center" data-sortable="true">trait
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
							title="eg: Chr1" name="chr">
							<option value='' disabled selected style='display:none;'>Choose One Chromesome</option>
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
								class="form-control eg" title="eg: 147" style="display:inline;" name="start"
								readonly="readonly" id="sh1">
						</div>
					</div>


					<div class="col-md-9 col-xs-9">
						<div class="input-group ">
							<span class="input-group-addon">End:</span> <input type="text"
								class="form-control eg" title="eg: 6782830 " style="display:inline;" name="end"
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
			<div class="btns2">
				<button class="btn" text-algin="right" id="next" float="right">Submit</button>
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
	//bootstrapTable的相关内容
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
				alert("You must choose at least one trait！");
				return false;
			} else if (val == undefined) {
				return false;
			} else {
				if (val == "first") {
					if (/^\d+$/.test($("#sh1").val()) && /^\d+$/.test($("#sh2").val())) {
                     if(parseInt($("#sh1").val()) > parseInt($("#sh2").val())){
                           alert("end position must bigger than start position");
                           return false;
                     }
						return true;
					} else {
						alert("please enter number");
						return false;
					}
				} else {
					return true;
				}
			}
		}
		//加载自己的数据时将data.js文件里的值修改了就是
		//jQuery.fn.bootstrapTable.defaults.data = data;
	</script>
</body>
</html>
