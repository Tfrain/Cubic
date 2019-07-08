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
<title>Variation Search</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="wei" />
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
		$("#next").click(function() {
			var variation = $("#variationName").val();
			var gene = $("#geneid").val();
			if (variation == ""||gene == "") {
				form.submit();
			} else {
				var variation = /^[a-z][a-z0-9_.]{5,20}$/.test($("#variationName").val());
				var gene = /^(?![0-9]+$)(?![A-Z]+$)[0-9A-Z]{12,17}$/.test($("#geneid").val());
				if(variation != "") {
					alert("Please select Variation Name Like chr5.s_2269!");
					return false;
				}
				if (gene != "") {
					alert("Please select Gene ID Like GRMZM2G356204!");
					return false;
				} 
			}
		});
	});
</script>
</head>

<body>
	<%@ include file="../ListHeader.jsp"%>
	<h3 style="position:relative;left:4.9%;">Variation Search</h3>
	<br>
	<div class="container" style="height:600px;">
		<div class="describe">
			<p>
				<font size="3">Single-variant-based GWAS and haplotype-based GWAS results of 23 agronomic traits for poplulation were available in this section. And detailed information of significant SNPs(p&lt;2.79x10-8) for you interested traits can be queried by limiting genomic coordinate or gene ID.</font>
			</p>
			<p>
				<font size="3">Search the significant SNPs (2.79x10-8) in
					GWAS results in a number of ways, including by trait, SNP
					identifier, study and gene.</font>
			</p>
		</div>
		<form action="showNewThree" method="post" onsubmit="return check();">
            <div class="col-md-6" style="width:100%">
			<div class="search">
<style>
table, table tr th, table tr td {
    padding: 8px;
}

::-webkit-scrollbar{
    display:none;
}
</style>
          <div class="form-group row">
          <label class="col-sm-2 col-form-label">Variation Name</label>
          <div class="col-sm-10">
                  <div class="col-sm-8 col-lg-8" style="padding-left:0px">
                      <input id="variationName" type="text" name="variation" title="eg:chr5.s_2269" placeholder="eg:chr5.s_2269" class="form-control">
              </div>
          </div>
          </div>
          
          <div class="form-group row">
              <label class="col-sm-2">Gene ID</label>
              <div class="col-sm-4">
                  <input id="geneid" type="text" name="gene" title="eg:GRMZM2G356204" placeholder="eg:GRMZM2G356204" class="form-control">
              </div>
          </div>
          <div class="form-group row">
              <label class="col-sm-2 col-form-label">Variation Type</label>
              <div class="col-sm-10">
                  <select id="fearturetype" class="form-control" name="feature" id="sel2">
                  <option value="downstream_gene_variant">downstream_gene_variant</option>
				  <option value="upstream_gene_variant">upstream_gene_variant</option>
                  <option value="synonymous_variant">synonymous_variant</option>
                  <option value="missense_variant">missense_variant</option>
                  <option value="3_prime_UTR_variant">3_prime_UTR_variant</option>
                  <option value="intron_variant">intron_variant</option>
                  <option value="splice_region_variant">splice_region_variant</option>
                  <option value="5_prime_UTR_variantt">5_prime_UTR_variantt</option>
                  <option value="stop_lost">stop_lost</option>
                  <option value="stop_gained">stop_gained</option>
                  <option value="stop_retained_variant">stop_retained_variant</option>
                  </select>
              </div>
          </div>
          <div class="form-group row">
              <label class="col-sm-2 col-form-label">Chr/Scaffold</label>
              <div class="col-sm-2">
                  <select id="chrScaffold" class="form-control" name="chr" id="sel3">
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
              <label class="col-sm-1 col-form-label">between</label>
              <div class="col-sm-2">
                  <input id='chrScaffoldStart' type="text" class="form-control" name="start">
              </div>
              <label class="col-sm-1 col-form-label">and</label>
              <div class="col-sm-2">
                  <input id='chrScaffoldEnd' type="text" class="form-control" name="end">
              </div>
          </div>
          
          <div class="form-group row">
              <label class="col-sm-2 col-form-label">Variation effect</label>
              <div class="col-sm-10">
                  <select id="variationEffect" class="form-control" name="effect" id="sel4">
				  <option value="MODIFIER">MODIFIER</option>
				  <option value="MODERTE">MODERTE</option>
				  <option value="LOW">LOW</option>
				  <option value="HIGH">HIGH</option>
                  </select>
              </div>
          </div>
          </div>
          </div>
              <div class="col">
             <button class="btn btn-success form-control" text-algin="left" id="next" float="right" style="height:60px">Search</button>
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
		return true;
		/*
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
			}*/
		}
		//加载自己的数据时将data.js文件里的值修改了就是
		//jQuery.fn.bootstrapTable.defaults.data = data;
	</script>
</body>
</html>