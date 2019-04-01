<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Blastn</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script type="text/javascript"> 
  function check1()
{ 
	var eralue=$("#Eralue").val();//用户名
	var maxtar=$("#maxtar").val();//用户名
 	var percent=$("#percent").val();
 	var database1=$("#Database").val();
 	var blastprograme1=$("#blastprograme1").val();
 	var inputfile1=$("#inputfile1").val();
 	var inputtext1=$("#inputtext").val();
   if(eralue=="" || word=="" ||percent==""||database1=="Choose database")
   {
     alert("Error: Please put in eralue,maxtarget,percent!");
     alert(inputtext1);
     return false;
   }
   
  return true;
 }	
 </script>
<script type="text/javascript"> 
  function checkdata()
{ 
	var blastprograme1=$("#blastprograme1").val();//用户名
	if(blastprograme1=="primer-blast")
    {
		document.getElementById("Eralue").value="0.1";
    }
	if(blastprograme1=="blastn")
    {
		document.getElementById("Eralue").value="0.00001";
    }
  return true;
 }	
 </script>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    
    <div class="content" style="height:600px;">
            <div class="describe">
               <div class="describe" style="height:450px">
                <h3>BLASTN/Primer-BLASTN</h3>
                <h4>You can use BLASTN program comparing nucleotide sequence to our databases and calculates the statistical significance. If you query sequence is Less than 50 bp, please use Primer-BLASTN. Here we use <u><b>Basic Local Alignment Search Tool (BLAST) </b></u>as a backend engine.</h4>
                 </div>
    <form action="genetree" method="post" >
                
                
                <div class="btns">
                <button class="btn" id="next1">NEXT</button></form>
                </div>
                
          		
                

            </div>
        </div>
    
    
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
