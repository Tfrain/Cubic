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
  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"50615",secure:"50605"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
  
  <body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-38" data-genuitec-path="/Magic/WebRoot/download/download.jsp">
        <%@ include file="../ListHeader.jsp"%>
        <div class="content" style="height:550px;" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-38" data-genuitec-path="/Magic/WebRoot/download/download.jsp">
        
            <h3 class="title">Collective resources for CUBIC population:</h3>

            <div class="row">
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The raw WGS and RNA-sequencing data of CUBIC population are available in <u><b>NCBI</b></u>, with bioproject accession code <b>PRJNA597703</b>.</h4>
            <!-- <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA597703 </h4>-->
			<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL: <a href="https://www.ncbi.nlm.nih.gov/bioproject/PRJNA597703" target="_blank" style="text-indent:2em; color: #fc8e00">https://www.ncbi.nlm.nih.gov/bioproject/PRJNA597703
   			</a>
   			</p>
			 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Some data can be download directly from following links :</h4>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://www.maizego.org/download/CUBIC_Design.jpg" target="_blank" style="text-indent:2em; color: #fc8e00">[see schematic diagram for population design]
   			</a>
   			<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="http://www.maizego.org/download/Agronomic_23Traits.txt" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading BLUP penotypes for 23 agronomic traits] 
   			</a>
   			<!--  
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href= "https://1479696753-my.sharepoint.com/personal/weicc_hechuan_ooo/_layouts/15/onedrive.aspx?originalPath=aHR0cHM6Ly8xNDc5Njk2NzUzLW15LnNoYXJlcG9pbnQuY29tLzpmOi9nL3BlcnNvbmFsL3dlaWNjX2hlY2h1YW5fb29vL0VuTVI3MW1IRHc5UHROSlNTWTBsUHlVQm5XclUtNUJfaVdGNDgzUEI1ZTdzc3c%5FcnRpbWU9ZUsxcFNYalIxMGc&id=%2Fpersonal%2Fweicc%5Fhechuan%5Fooo%2FDocuments%2F%E5%85%B1%E4%BA%AB%2Fcubic%2Fgermplasm" target="_blank" style="text-indent:2em; color: #fc8e00">[see germplasm list and grouping information for population] 
   			</a>
   			-->
   			</br>
   			 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;And some resources have been deposited in the figshare database（
   			 <a href="https://figshare.com" target="_blank" style="text-indent:2em; color: #fc8e00">https://figshare.com/
   			</a>
   			）:
   			</h4>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00">[Downloading SNPs] —— DOI:10.6084/m9.figshare.12220226
   			</span>
			</br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00">[Downloading InDels, novel sequences and SVs] —— DOI:10.6084/m9.figshare.12220253
   			</span>
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00">[Downloading gene expression data and eQTL results] —— DOI:10.6084/m9.figshare.12220349
   			</span>
   			
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00">[Downloading GWAS results] —— DOI:10.6084/m9.figshare.12220367
   			</span>
   			
   			
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00"> [Downloading haplotype map resources] —— DOI:10.6084/m9.figshare.12220376
   			</span>
   			
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00"> [Downloading germplasm list and grouping information]—— DOI:10.6084/m9.figshare.12220127
   			</span>
   			
   			</br>
   			
   			<!-- 
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<span style="text-indent:2em; color: #fc8e00">[Downloading original significant associations from OneDrive]
   			</span>
   			-->
   			<!--
   			</br>
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://1479696753-my.sharepoint.com/personal/weicc_hechuan_ooo/_layouts/15/onedrive.aspx?originalPath=aHR0cHM6Ly8xNDc5Njk2NzUzLW15LnNoYXJlcG9pbnQuY29tLzpmOi9nL3BlcnNvbmFsL3dlaWNjX2hlY2h1YW5fb29vL0VuTVI3MW1IRHc5UHROSlNTWTBsUHlVQm5XclUtNUJfaVdGNDgzUEI1ZTdzc3c%5FcnRpbWU9ZUsxcFNYalIxMGc&id=%2Fpersonal%2Fweicc%5Fhechuan%5Fooo%2FDocuments%2F%E5%85%B1%E4%BA%AB%2Fcubic%2Fbin%20map" target="_blank" style="text-indent:2em; color: #fc8e00">[HMM script and demo for IBD map construction from OneDrive]
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			-->
			
			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We also keep a synchronized copy of above resources on Baidu Cloud:</h4>
			<!-- 
			<div style="text-indent:2em">
				<a href="https://pan.baidu.com/s/1u_ARp87BdDLs_fvrT654hA" target="_blank" style="text-indent:2em; color: #fc8e00">[CUBIC Resources on Baidu Cloud]</a>
			</div>
			-->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			<a href="https://pan.baidu.com/s/1u_ARp87BdDLs_fvrT654hA" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading CUBIC Resources from Baidu Cloud]
			</a>
			
   			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click to enter FTP site</h4>
           <a href="ftp://122.205.95.139/">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<image class="img" alt="" src="images/download.png"/></li>
			</a>
        	</div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
