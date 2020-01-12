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
        
            <h3 class="title">Collective resources for CUBIC population:</h3>

            <div class="row">
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The raw WGS and RNA-sequencing data of CUBIC population are available in <u><b>NCBI</b></u>, with bioproject accession code <b>PRJNA597703</b>.</h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The genomic variation data，gene expression data，phenotype data  and other analysis scripts and results can be download directly from following links： </h4>
			</br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://www.maizego.org/download/CUBIC_Design.jpg" target="_blank" style="text-indent:2em; color: #fc8e00">[see schematic diagram for population design]
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1AsPJLTe--gU5EN8aFTMYPA#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading SNPs in PLINK formats] 
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1AsPJLTe--gU5EN8aFTMYPA#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading InDels in VCF formats]
   			</a>
			</br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1AsPJLTe--gU5EN8aFTMYPA#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading SV in VCF formats] 
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1Po9a-f13ZTz4dAtcmSOmLw#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading expression quantifications]
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1TKKOZOxTDuDw1ODN1VMTMg#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00"> [Downloading eQTL results]
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="http://www.maizego.org/download/Agronomic_23Traits.txt" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading BLUP penotypes for 23 agronomic traits] 
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1roagTVs9zU6bg31_0sBOMw" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading original significant associations]
   			</a>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="http://www.maizego.org/download/cubicIBD_script&demo.zip" target="_blank" style="text-indent:2em; color: #fc8e00">[HMM script and demo for IBD map construction]
   			</a>
   			</br>
   			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click to enter FTP site</h4>
           <a href="ftp://122.205.95.139/">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<image class="img" alt="" src="images/download.png"/></li>
			</a>
        	</div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
