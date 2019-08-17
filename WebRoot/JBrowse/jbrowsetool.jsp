 	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Variation Browser</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
.loading{
	width:250px;
	height:56px;
	position: absolute;
	top:50%;
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
    <script type="text/javascript">
    //window.location.href = "/Magic/index.jsp";
            //
            function getTracks(start, end){
                //var from = Math.floor(parseInt(start) / 100000);
               // var to = Math.floor((parseInt(end) / 100000) + 1);
              //  var chr = "chr" + $("#chr").val()
                //var str = chr + "_" + (from * 100000) + "_" + ((from + 1) * 100000);
                var str = "cubic_merge";
             //   for (var i = from + 1; i < to; i++) {
            //        str = str + "," + chr + "_" +
           // (i * 100000) + "_" + ((i + 1) * 100000);
               // }
                return str;
            }
        $(function(){$(".eg").tooltip();});
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
    		    if(val=="first")
    		    {
    		    	var str;
    		    	var start=$("#sh1").val();
    		    	var end=$("#sh2").val();
    		    	//var start0=start;
    		    	//var start1=0,end1=0;
    		    	//start=start-100000;
    		    	//while(start>=0)
    		    	//{
    		    		//start1=start1+100000;
    		    		//start=start-1000000;
    		    	//}
    		    	//while(end>start0)
    		    	//{
    		    		//end1=end1+1;
    		    		//end=end-100000;
   		    	//} 		
                    //var vcfTracks;
    		    	//while(end1>0)
    		    	//{
    		    		//end1=end1-1;
    		    		//end=start1;
    		    		//start1=start1+100000;
    		    		//if(str!=null)
    		    		//{
    		    			//str=str+"%2Cchr"+$("#chr").val()+"_"+end+"_"+start1;//chr1_100000_200000
    		    		//}
    		    		//else
    		    		//{
    		    			//str="chr"+$("#chr").val()+"_"+end+"_"+start1;//chr1_100000_200000
    		    		//}
    		    	//}
                    str = getTracks(start, end);
                    var vcfTracks = str;
    		    	//$.ajax({
    		    		//type:"post",
    		    		//url:"jbrowse",
    		    		//data:{"vcfTracks":vcfTracks},
    		    		//success:function(){}
                     //})
    		   		window.location.href = "http://modem.hzau.edu.cn/Magic/JBrowse/jbrowse.jsp?loc="+$("#chr").val()+"%3A"+$("#sh1").val()+".."+$("#sh2").val()+"&tracks="+str+"%2CGFF3%2CDNA&highlight=";
    		    }
    		    else if(val=="second")
    		    {
    		    	var sh3 = $("#sh3");
    		    	$.ajax({
    		    		type:"post",
    		    		url:"jbrowse",
    		    		data:{geneid:sh3.val()},
    		    		success:function(result){
    		    			console.log(result);
    		                var array = result.split(",");
    		                console.log(array);
    		                var str;
		    		    	var start=array[1];
		    		    	var end=array[2];
		    		    	//var start0=start;
		    		    	//var chrr=array[0];
		    		    	//var start1=0,end1=0;
		    		    	//start=start-100000;
		    		    	//while(start>=0)
		    		    	//{
		    		    		//start1=start1+100000;
		    		    		//start=start-1000000;
		    		    	//}
		    		    	//while(end>start0)
		    		    	//{
		    		    		//end1=end1+1;
		    		    		//end=end-100000;
		    		    	//}
		    		    	//while(end1>0)
		    		    	//{
		    		    		//end1=end1-1;
		    		    		//end=start1;
		    		    		//start1=start1+100000;
		    		    		//if(str!=null)
		    		    		//{
		    		    			//str=str+"%2Cchr"+chrr+"_"+end+"_"+start1;//chr1_100000_200000
		    		    		//}
		    		    		//else
		    		    		//{
		    		    			//str="chr"+chrr+"_"+end+"_"+start1;//chr1_100000_200000
		    		    		//}
		    		    	//}
                            str = getTracks(start, end);
    		                window.location.href = "http://modem.hzau.edu.cn/Magic/JBrowse/jbrowse.jsp?loc="+array[0]+"%3A"+array[1]+".."+array[2]+"&tracks="+str+"%2CGFF3%2CDNA&highlight=";
    		    		},
    		    		error:function(error){
    		              console.log("jbrowse    "+error);
    		            }
    		    	});
    		   	}
    			else{
    				alert("please choice one chance");
    			}
    		    
    		});
    	});
    	
    	
    </script>
  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"50600",secure:"50605"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
  
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-17" data-genuitec-path="/Magic/WebRoot/JBrowse/jbrowsetool.jsp">
    <%@ include file="../ListHeader.jsp"%>
    <div class="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-17" data-genuitec-path="/Magic/WebRoot/JBrowse/jbrowsetool.jsp">
            <div class="describe">
                <h3>Variation Browser</h3>
            </div>
            <div class="search">
<style>
.row{
    margin-left:0px;
}
</style>
                <br>
                <h4>Select one or more loci. Specify gene identifiers (e.g. GRMZM2G040380) or regions (e.g. Chr1 45509404 45519404).</h4>
                <div class="row">
                    <input type="radio" name="search" value="first"> Search By Region
                </div>
                <div class="row">  
                    <!-- <input type="text" placeholder="Chr" class="input"> -->
                    <div class="col-md-2 col-xs-2">
                    <select  class="form-control eg" title="eg: Chr1" style="width:200px;display:inline;"  name="chr" id="chr">
                        
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

					<div class="col-md-1 col-xs-1">
                    <span style="color:gray">      </span>
                    </div>

                    <div class="col-md-3 col-xs-3">
                    <div class="input-group ">
                        <span class="input-group-addon">Start:</span>
                    <input type="text" class="form-control eg" style="display:inline;" title="eg: 147" name="start" readonly="readonly" id="sh1">
                    </div>
                    </div>

                    <div class="col-md-1 col-xs-1">
                    <span style="color:gray">      </span>
                    </div>

                    <div class="col-md-3 col-xs-3">
                    <div class="input-group ">
                        <span class="input-group-addon">End:</span>
                    <input type="text" class="form-control eg" style="display:inline;" title="eg: 67828030" name="end" readonly="readonly" id="sh2">
                    </div>
                    </div>
                    <%--<span style="color:gray;">(eg: chr1 147 67828030 )</span>--%>
                </div>
                <br>
               <div class="row">
                    <input type="radio" name="search" value="second" > Search By Gene ID
                </div>
                <div class="row">
                    <div class="input-group" style="padding-left:15px;">
                        <span class="input-group-addon">Gene:</span>
                    <input type="text" class="form-control eg" style="width:200px;display:inline;" title="eg: GRMZM2G040389" name="gene" readonly="readonly" id="sh3">
                    </div>
                    <%--<span style="color:gray;">(eg: GRMZM2G040389 )</span>--%>
                </div>
            </div>
            
            <div class="btns">
                <button class="btn" id="next">Submit</button>
            </div>
            
            
    </div>
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
