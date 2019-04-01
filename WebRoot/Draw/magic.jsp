<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Bin Map</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	

  </head>
  
  <body>
  	<%@ include file="../ListHeader.jsp"%>
  	<div class="container" style="height:650px;">
  		<div class="describe">
               <h3>Bin Map</h3>
               <br/>
               <h4>The Visualisation of mosaic haplotypes for progenies in synthetic population, reflecting a high-resolution reshuffle across 24 founders genomes.</h4>
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
				    			<input class="inputss form-control eg" title="eg:start:1 end 300000000 or start:2000 end 3000000" name="names" placeholder="Please input the start position" type = "text"></input>
				    		</div>
				    		<div class="input-group input-lg">
				    			<span class="input-group-addon">End:</span>
				    			<input class="inpute form-control eg" title="eg:start:1 end 300000000 or start:2000 end 3000000" name="namee" placeholder="Please input the end position" type = "text"></input>
							</div>
							<%--<span class = "Grand9" style="display:block;font-size:14px;color:grey;margin-left:120px;">(e.g:start:1 end 300000000</span>--%>
							<%--<span class = "Grand9" style="display:block;font-size:14px;color:grey;margin-left:120px;">or start:2000 end 3000000)</span>--%>
							<div class="btns" style="margin-top:3%">
	                			<button class="btn" style="position:relative;margin:auto;">Submit</button>
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
    	if($("#sel3").val() ==''){
    		if($(".input1").val() == ''){
    			alert("please choice chr!");
    		    return false;
    		}
    	}
    	if(($("#sel2").val() =='') && ($(".input1").val() == '')){
    	    alert("please choice material!");
    		return false;
    	}
    	if($(".input1").val() != ''){
    		var a = $(".input1").val();
    	    var reg1 = /^M[0-9]+$/;
			/* var reg2 = /^(M[0-9]+,\s){1,}M[0-9]+$/; */
			if (reg1.test(a)) {
				
			}else{
				alert("Input material error, please input again.");
				return false;
			}
    	}
    	if($(".inputss").val() == '' && $(".inpute").val() != ''){
    		alert(("please input start position!"));
    		return false;
    	}
    	if($(".inpute").val() == '' && $(".inputss").val() != ''){
    		alert(("please input end position!"));
    		return false;
    	}
    	
    	if($(".inputss").val() != '' && $(".inpute").val() != ''){
    		var reg2 = /^\d{1,9}$/;
    		if(reg2.test($(".inputss").val())&&reg2.test($(".inpute").val())){
    			if(parseInt($(".inputss").val())<1||parseInt($(".inputss").val())>301354135||parseInt($(".inpute").val())<1||parseInt($(".inpute").val())>301354135){
    			alert("Input start or end position error,please input again.");
    			return false;
    			}
    		}else{
    			alert("Input start or end position error,please input again.");
    			return false;
    		}
    	}
    	return true;
    }
  </script>
</html>
