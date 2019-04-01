<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>TOOLS</title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>

  </head>
  
  <body>
    <%@ include file="ListHeader.jsp"%>
    <div class="content" style="margin-top:60px; height:1000px;">
   		 <div class="contact" style="height:250px">
   			 <div class="title">
   		 		<h3 class="title">Variation Map</h3><br>
   		 	 </div>
            <div class="each-tool">
                <div class="title">Bin Map</div>
                <div class="img"><a href="Step/step_one.jsp"><img src="images/tool1.png"></a></div>
            </div>
            <div class="each-tool">
                <div class="title">Variation Browser</div>
                <div class="img"><a href="JBrowse/jbrowsetool.jsp"><img src="images/tool2.png"></a></div>
            </div>
         </div>
         <div class="contact" style="height:250px">
         	<h3 class="title">GWAS Catalog</h3><br>
            <div class="each-tool">
                <div class="title">GWAS Search</div>
                <div class="img"><a href="Draw/magic.jsp"><img src="images/tool1.png"></a></div>
            </div>
            <div class="each-tool">
                <div class="title">GWAS Diagram</div>
                <div class="img"><a href="genetree.action"/><img src="images/tool1.png"></a></div>
            </div>
         </div>
         <div class="contact" style="height:250px">
            <h3 class="title">Variation Application</h3><br>
            <div class="each-tool">
                <div class="title">BLAST/Primer-BLAST</div>
                <div class="img"><a href="Last/Last.jsp"><img src="images/tool2.png"></a></div>
            </div>
            <div class="each-tool">
                <div class="title">General Primer Design</div>
                <div class="img"><a href="Primer/Primersearch1.jsp"><img src="images/tool1.png"></a></div>
            </div>
            <div class="each-tool">
                <div class="title">Primer Design By Region</div>
                <div class="img"><a href="Primer/Primersearch2.jsp"><img src="images/tool2.png"></a></div>
            </div>
            <div class="each-tool">
                <div class="title">Design Primer By Variation ID</div>
                <div class="img"><a href="Primer/Primersearch3.jsp"><img src="images/tool1.png"></a></div>
            </div>
            
           </div>
        </div>
        <%@ include file="ListFooter.jsp"%>
  </body>
</html>
