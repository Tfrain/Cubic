<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Haplotype Bin Map</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
.loading{
	width:230px;
	height:56px;
	position: absolute;
	top:38%;
	left:45%;
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
	

  </head>
  
  <body>
  	<%@ include file="../ListHeader.jsp"%>
  	<div class="container" style="height:650px;">
  		<div class="describe">
               <h3>Haplotype Bin Map</h3>
               <br/>
               <h4>A IBD map was constructed of contributions from the twenty-four founders onto the 1,404 progeny lines using a hidden Markov model (HMM) with several modifications on the study of Mott et al., (2000). In the modified HMM model, the hidden states are the progenitor IBD states, and the observed states are the SNP genotypic calls, which can be used undoubtedly to other multi-parental populations.</h4>
   			<!-- <a href="https://1479696753-my.sharepoint.com/personal/weicc_hechuan_ooo/_layouts/15/onedrive.aspx?originalPath=aHR0cHM6Ly8xNDc5Njk2NzUzLW15LnNoYXJlcG9pbnQuY29tLzpmOi9nL3BlcnNvbmFsL3dlaWNjX2hlY2h1YW5fb29vL0VuTVI3MW1IRHc5UHROSlNTWTBsUHlVQm5XclUtNUJfaVdGNDgzUEI1ZTdzc3c%5FcnRpbWU9ZUsxcFNYalIxMGc&id=%2Fpersonal%2Fweicc%5Fhechuan%5Fooo%2FDocuments%2F%E5%85%B1%E4%BA%AB%2Fcubic%2Fgermplasm" target="_blank" style="text-indent:2em; color: #fc8e00">[see germplasm list and grouping information for population]
   		</a>
   		 -->
   				<span> The grouping information for population have been deposited in the figshare database 
   				</span>
   				
   				<br>
   				<span>（DOI:10.6084/m9.figshare.12220127; https://figshare.com/）
   				</span>
        </div>
        <div class="inputs" style="width:100%;height:100%;position:relative;">
        	<form method = "post" action ="picture" style="width:1130px;height:500px;margin:0;position:relative;"onsubmit="return check();">
	        	<div class="left-panel" style="width:45%;height:400px">
	        		<div class="input-group-addon" style="width:32.5%;height:35px;display:inline-block;margin:0;border-bottom-left-radius:0px;border-top-right-radius:4px;"><h4 class="Phenotypicstrongblack">Population</h4></div>
	            	<div class="input-group-addon" style="width:32.5%;height:35px;display:inline-block;margin:0;border-bottom-left-radius:0px;border-top-right-radius:4px;"><h4 class="Phenotypicstrongblack">Material</h4></div>
	            	<div class="input-group-addon" style="width:32.5%;height:35px;display:inline-block;margin:0;border-bottom-left-radius:0px;border-top-right-radius:4px;"><h4 class="Phenotypicstrongblack">Chromosome</h4></div>
	            	<select id="sel1" name="pop" multiple="multiple" size="4" class="select" style = "display:inline-block;width:32.5%;height:350px;margin-top:0px">
				    	<option value="L1">L1</option>
					    <option value="L2">L2</option>
					    <option value="L3">L3</option>
		   			    <option value="L4">L4</option>
		   			    <option value="Ref">Ref</option>						   
					</select>

					<select id="sel2" name="name" multiple="multiple" size="5" class="select" style="display:inline-block;width:32.5%;height:350px;"></select>
					<select id="sel3" name="chr" multiple="multiple" size="5" class="select" style="display:inline-block;width:32.5%;height:350px;">
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
				<div id="wait">
				</div>
				<div class="line"></div>
				<div class="right-panel" style="width:45%;height:400px;float:right">
						<div class="inputMessage" style="display:inline-block;width:100%;height:150px;padding:0 5% 5%">
				    		<h4 class="Phenotypicstrongblack">Or input the Material:&nbsp;</h4>
				    		<div class="input-group lg">
				    			<span class="input-group-addon">Material:</span>
				    			<input class="input1 form-control eg" title="eg:M1722 or M1703 or M1727" name="name1" placeholder="Please input the Material" type = "text" ></input>
				    		</div>
							<%--<span class = "Grand9" style="font-size:14px;color:grey;margin-left:120px">(e.g:M1722 or M1703 or M1727)</span>--%>
						</div>
						<hr class="style-two" />
						<div class="inputMessage" style="display:inline-block;width:100%;height:250px;padding:0 5%">
				    		<h4 class="Phenotypicstrongblack" style="display:block">Input the start and end position:&nbsp;</h4>
				    		<div class="input-group input-lg">
				    			<span class="input-group-addon">Start:</span>
				    			<input class="inputss form-control eg" title="eg:start:164 end 301424690 or start:1553 end 3396851" name="names" placeholder="Please input the start position" type = "text"></input>
				    		</div>
				    		<div class="input-group input-lg">
				    			<span class="input-group-addon">End:</span>
				    			<input class="inpute form-control eg" title="eg:start:164 end 301424690 or start:1553 end 3396851" name="namee" placeholder="Please input the end position" type = "text"></input>
							</div>
							<%--<span class = "Grand9" style="display:block;font-size:14px;color:grey;margin-left:120px;">(e.g:start:1 end 300000000</span>--%>
							<%--<span class = "Grand9" style="display:block;font-size:14px;color:grey;margin-left:120px;">or start:2000 end 3000000)</span>--%>
							<div class="btns" style="margin-top:3%">
	                			<button class="btn" id="next" style="position:relative;margin:auto;">Submit</button>
	                		</div>
						</div>
				</div>	
            </form>
        </div>
  	</div>
  	
  	<%@ include file="../ListFooter.jsp"%>
  </body>
  
  <script type="text/javascript">
    $(function(){$(".eg").tooltip();});
  	var sel1 = $("#sel1");
    var sel2 = $("#sel2");
    var sel3 = $("#sel3");
    var na = $(".input1");
    var nas = $(".inputss");
    var nae = $(".inpute");
    sel1.click(function(){
    	var arr1=sel1.val();
    	sel2.html("");
    	for(var j=0;j<arr1.length;j++){
	    	$.ajax({
	    		type:"post",
	    		url:"findMaterial",
	    		data:{pop:arr1[j]},
	    		success:function(result){
	    			console.log(result);
	                var array = result.split(",");
	                console.log(array);
	                for (var i = 0; i < array.length; i++){
	                	console.log(array[i]);
	                 	sel2.append('<option value="' + array[i] + '">' + array[i] + '</option>');
	                }
	    		},
	    		error:function(error){
	              console.log("findMaterial    "+error);
	            }
	    	});
    	}
    });
    
    na.change(function(){
        $("#sel2 option").each(function(i,n){
          this.selected = false;
        });
    }); 
     
    sel2.click(function(){
       na.val("");
       if($("#sel2 :selected").length == 1){
       	   sel3.attr("multiple","multiple");
       }
       if($("#sel3 :selected").length > 1){
       	   sel2.removeAttr("multiple");
       }else{
       		if($("#sel3 :selected").length == 1){
       			sel2.attr("multiple","multiple");
       		}
       }
    });
    
    sel3.click(function(){
        var n = $("#sel2 :selected").length; 
        if(n >1){
    	    sel3.removeAttr("multiple");
        }/* else{
          		sel3.attr("multiple","multiple"); 
        	} */
    });
    
    function check(){
    	if(($("#sel2").val() =='') && ($(".input1").val() == '')){
    	    alert("Please select the Material!");
    		return false;
    	}
    	
    	if($("#sel3").val() ==''){
    		if($(".input1").val() == ''){
    			alert("Please select at least one Chromosome!");
    		    return false;
    		}
    	}
    	if($(".input1").val() != ''){
    		var a = $(".input1").val();
    	    var reg1 = /^M[0-9]+$/;
			/* var reg2 = /^(M[0-9]+,\s){1,}M[0-9]+$/; */
			if (reg1.test(a)) {
				
			}else{
				alert("Input the Material error, please input again.");
				return false;
			}
    	}
    	if($(".inputss").val() == '' && $(".inpute").val() != ''){
    		alert(("Please input start position!"));
    		return false;
    	}
    	
    	if($(".inpute").val() == '' && $(".inputss").val() != ''){
    		alert(("Please input end position!"));
    		return false;
    	}
    	
    	if($(".inputss").val() != '' && $(".inpute").val() != ''){
    		var reg2 = /^\d{1,9}$/;
    		if(reg2.test($(".inputss").val())&&reg2.test($(".inpute").val())){
    			if(parseInt($(".inputss").val())<1||parseInt($(".inputss").val())>301354135||parseInt($(".inpute").val())<1||parseInt($(".inpute").val())>301354135||parseInt($(".inputss").val())>parseInt($(".inpute").val())){
    			alert("Input start or end position error,please input again.");
    			return false;
    			}
    			
    		}else{
    			alert("Input start or end position error,please input again.");
    			return false;
    		}
    	}
    	var str = $("<div id='loading' class='loading'>Please Waiting .....</div>");
		$('#wait').append(str);
		$("#next").attr("disabled",true);
    	return true;
    }
  </script>
</html>
