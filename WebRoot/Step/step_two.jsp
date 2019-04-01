<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>GWAS search</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    	    
    	    $('input:radio[name="search"]').click(function(){
				var val=$('input:radio[name="search"]:checked').val();
				//alert(val);
				if(val == "first"){
					$("#sh1").removeAttr("readonly");
					$("#sh2").removeAttr("readonly");
					$("#sh3").attr("readonly","readonly");
					$("#sh3").val("");
				}else{
					$("#sh3").removeAttr("readonly");
					$("#sh1").attr("readonly","readonly");
					$("#sh2").attr("readonly","readonly");
					$("#sh1").val("");
					$("#sh2").val("");
				}
    	    });
    	    
    	    
    		$("#next").click(function(){
    		    var val=$('input:radio[name="search"]:checked').val();
    		    if(val=="first" || val=="second"){
    				form.submit();
    			}
    			else{
    				alert("please choice one chance");
    			}
    		});
    	});
    	
    	
    </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content">
            <div class="describe">
                <h3>GWAS Search</h3>
                <br/>
                <p>Search the significant SNPs (p≤5 x10-8) in GWAS results in a number of ways, including by trait, SNP identifier, study and gene. </p>
            </div>
            <div class="steps">
                <image src="images/steps2.png">
            </div>
            <form name="form" action="showThree" method ="post">
            <div class="search">
                <p class="bold">Select one or more loci. Specify gene identifiers (e.g. GRMZM2G040380) or regions (e.g. Chr1 147 6782830).</p>
                <div class="row">
                    <input type="radio" name="search" value="first"> Search By Region
                </div>
                <div class="row">  
                    <!-- <input type="text" placeholder="Chr" class="input"> -->
                    <select  class="input" name="chr" >
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
                    <input type="text" placeholder="Start" class="input" name="start" readonly="readonly" id="sh1">
                    <span style="color:gray">------</span>
                    <input type="text" placeholder="End" class="input" name="end" readonly="readonly" id="sh2">
                    <span style="color:gray;">(eg: Chr1 147 67828030 )</span>
                </div>
                <br>
                <div class="row">
                    <input type="radio" name="search" value="second"> Search By Gene ID
                </div>
                <div class="row">
                    <input type="text" placeholder="Gene" class="input" name="gene" readonly="readonly" id="sh3">
                    <span style="color:gray;">(eg:GRMZM2G091756 )</span>
                </div>
            </div>
            </form>
            <div class="btns">
                <button class="btn" style="height: 47px; width: 100px;"><a  href="Step/step_one.jsp">BACK</a></button>
                <button class="btn" id="next">NEXT</button>
            </div>
            
    </div>
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
