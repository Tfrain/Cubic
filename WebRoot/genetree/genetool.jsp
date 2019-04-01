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
    <title>Gwas D</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>

  </head>
  
  <body>
    
             <form action="genetree" method="post" >
                
                
                <div class="btns">
                <button class="btn" id="next1">NEXT</button></form>
               
    
    
    
  </body>
</html>
