<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>Download</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
  </head>
  
  <body>
        <%@ include file="../ListHeader.jsp"%>
        <div class="content" style="height:500px;">
        

            <div class="row">
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The raw sequences data of population are available in <u><b>BIG Data Center (BIGD)</b></u>, and GSA project accession number is <b>PRJCA000346</b>.</h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The genomic variation data and phenotype data can be download directly from the our FTP site. </h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click to enter FTP site</h4>
            <a href="ftp://122.205.95.139/">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<image class="img" alt="" src="images/download.png"/></li>
			</a>
        	</div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
