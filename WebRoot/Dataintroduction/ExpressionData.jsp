<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>Expression Data</title>
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
        <div class="container" style="width:70%;">
       
            <!--<div class="row" style="width:900px;">
              <div class="title" style="width:900px;">
                  <h3 >Design of the modified MAGIC population</h3>
                </div>
                <div class=""  style="height: 482px; width: 45%;float:left; ">
                            <image src="images/genotype1.png">
                </div><div class=""  style="height: 121px; width: 45%;float:left; ">
                      <br>
              <ul>
                <h4><li><b>Parents:24 elite Chinese maize inbred lines<br></b></li>
                <li><b>Progenises:1404 inbred lines<br></b></li>
                <li><b>Design Of the synthetic population:<br></b></li>
                </h4><li>30 F1s with best agronomic performance were selected to futher cross in NCII,and the other 110 F1s were randomly selected to cross with open pollinated in isolated region.</li>
                <li>The seed from above F1s were mixed together with the amount of 2:1 with an expectation to improve the population performance.</li>
                <li>All harvest individuals were next planted under open pollination within isolated region for totally 6 generations.</li>
                <li>Following,the population was self-pollinated for another 6 generations.</li>
              </ul>
                
                </div>
            </div>-->
            <div class="row">
                
            </div>
            <div class="row" style="margin-top:10px;">
                <div class="my-panel">
                <div class="media-body" style="text-align:justify">
                          &nbsp;&nbsp;&nbsp;&nbsp; RNA-sequencing data and analysis results was collected from “An atlas of genetic architecture promises directed maize improvement”. Here is only extracting and summarizing the data generation and analysis part, which is convenient for users to quickly apply.        
            </div>
                <h3 class="title">RNA-sequencing and analysis pipeline</h3>
                <div class="article">
                    <div class="media">

                        <div class="media-body" style="text-align:justify;">
                           &nbsp;&nbsp;&nbsp;&nbsp;   ATo aid functional gene identification, a subset of 391 progenies were randomly selected from the CUBIC population for RNA-sequencing. These lines and the founder parents were grown at the Hainan field station in the winter of 2016. At the V9 stage (the stage with the fastest leaf tissue growth), total RNA was extracted from the tissue of the 11th leaf. A 150-bp paired end Illumina sequencing was performed using the HiSeq X-Ten protocols. Each sample had on average ~20 million raw reads. The reads with high sequencing quality were remained and mapped onto the B73 AGPv3.25 reference using STAR (Dobin et al., 2013); only those uniquely mapped reads were used to quantify gene expression levels with HTSeq (Anders et al., 2015). The expression for each gene was normalized using the software Deseq2 (Love et al., 2014) and only genes expressed in more than 60% of the lines were retained in eQTL mapping. Top 10 PEER (Stegle et al., 2012) factors, together with the top ten genotypic PCs, were utilized to account for covariates to perform eQTL mapping under EMMAX (Kang et al., 2010).
                           </br> 
                           <a href="https://bigd.big.ac.cn/search?dbId=gsa&q=CRA001241&page=1" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading raw RNA-seq reads] 
   						</a>
   						</br>
   						<a href="https://pan.baidu.com/s/1Po9a-f13ZTz4dAtcmSOmLw#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00"> [Downloading expression quantifications]
   						</a>
   						</br>
   						<a href="https://pan.baidu.com/s/1TKKOZOxTDuDw1ODN1VMTMg#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading eQTL results]
   						</a>
                        <br></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div style="height:40px;"></div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
