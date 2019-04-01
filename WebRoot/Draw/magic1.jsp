<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MaizeGo DataMine Platform</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
	
	

  </head>
  
  <body>
  	<%@ include file="../ListHeader.jsp"%>
  	<div class="container">
  		<div class="describe">
        	<h3>Bin Map</h3>
            <br/>
            <h4>The Visualisation of mosaic haplotypes for progenies in synthetic population, reflecting a high-resolution reshuffle across 24 founders genomes.</h4>
        </div>
        <div class="inputs">
        	<form method = "post" action ="picture" onsubmit="return check();">
        		<span class="Phenotypicstrongblack">Population:</span><div style="display:inline-block;width:60px"></div>
            	<span class="Phenotypicstrongblack">Material:</span><div style="display:inline-block;width:75px"></div>
            	<span class="Phenotypicstrongblack">Chr:</span><br>
            	<select id="sel1" name="pop"  size="4" class="select" style = "margin-left:0px;width:130px;height:200px">
			    	<option value="L1">L1</option>
				    <option value="L2">L2</option>
				    <option value="L3">L3</option>
	   			    <option value="L4">L4</option>
	   			    <option value="Ref">Ref</option>						   
				</select>
				<select id="sel2" name="name" multiple="multiple" size="5" class="select" style="width:130px;height:200px;"></select>
				<select id="sel3" name="chr" multiple="multiple" size="5" class="select" style="width:130px;height:200px;">
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
				
				<div class="inputMessage" style="margin-top:50px;">
			    	<span class="Phenotypicstrongblack">Or input the Material:&nbsp;</span>
				    <input class="input1" name="name" type = "text"></input>
				    <span class = "Grand9" style="font-size:12px">
					(e.g:M1722, M1703, M1727  <多个以逗号加空格分割>)</span>
				</div>
				
				
				<div class="btns">
                	<button class="btn" >NEXT</button>
                </div>
            </form>
        </div>
  	</div>
  	<%@ include file="../ListFooter.jsp"%>
  </body>
  
  <script type="text/javascript">
  	var sel1 = $("#sel1");
    var sel2 = $("#sel2");
    var sel3 = $("#sel3");
    var na = $(".input1");
    sel1.click(function(){
    	sel2.html("");
    	$.ajax({
    		type:"post",
    		url:"findMaterial",
    		data:{pop:sel1.val()},
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
    		alert("please choice chr!");
    		return false;
    	}
    	if(($("#sel2").val() =='') && ($(".input1").val() == '')){
    	    alert("please choice material!");
    		return false;
    	}
    	if($(".input1").val() != ''){
    		var a = $(".input1").val();
    	    var reg1 = /^M[0-9]+$/;
			var reg2 = /^(M[0-9]+,\s){1,}M[0-9]+$/;
			if (reg2.test(a) || reg1.test(a)) {
				
			}else{
				alert("输入格式不正确,若多个以逗号加空格分割");
				return false;
			}
    	}
    	return true;
    }
  </script>
</html>
