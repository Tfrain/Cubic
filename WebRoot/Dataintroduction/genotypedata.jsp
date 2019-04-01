<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>Genotype Data</title>
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
                <div class="my-panel">
                <h3 class="title" style="ali">Data generation</h3>
                <div class="article">
                    <div class="media">
                        <div class="media-body" style="text-align:justify">
                          &nbsp;&nbsp;&nbsp;&nbsp; Young leaves in vegetative growth stage were collected about 5 weeks after planting and quickly frozen in liquid nitrogen. Genomic DNA from each sample was extracted with the cetyltrimethylammonium bromide (CTAB) method and resolved in bidistilled water. DNA solution was then checked for quality and quantity on agarose gels and Qubit (~). Samples having at least 1 µg of total DNA, A260/A230 above 2.0 and A260/A280 above 1.8 were selected and used to construct a sequencing library following the manufacturer’s instructions (Illumina Inc.). DNA libraries were sequenced with Illumina HiSeq 2500 with 125-bp paired-end reads using V4 reagents, generating almost 2000x genome coverage. The sequencing was done to a mean depth of 11X for every founder, and 1X for each 1404 progenies. Sequences data are available in BIG Data Center (BIGD), and GSA project accession number is PRJCA000346.
            </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="row" style="margin-top:10px;">
                <div class="my-panel">
                <h3 class="title">Genomic Variation</h3>
                <div class="article">
                    <div class="media">

                        <div class="media-body" style="text-align:justify;">
                           &nbsp;&nbsp;&nbsp;&nbsp; Over 53M SNPs and 2.8M InDels were finally obtained using the pipeline shown in the picture. The SNP set was found >99% consistency compared with genotypes derived from array- and assembly- based methods, while the percent of validated large structural variants was considered as ~60%. Download     
                             <div class="lefttool" style="width:100%;height:580px;text-align:center;margin-bottom:20px;">
                                  <image src="images/genotype2.png" width="700px"/>
                             </div>   
                          <br>&nbsp;&nbsp;&nbsp;&nbsp; Those discordant reads (with unusual insert size) and split ones (best mapped to clipped positions) were applied in SV calling, as population mapping-based strategy. The software LUMPY (Layer et al., 2014) and HYDRA-Multi (Lindberg et al., 2015) were integrated to realize the idea, and TEMP (Zhuang et al., 2014) was used for TE absence/presence calling. Another assembly-based strategy was performed through comparing the B73 (V3.25) reference genome into HZS scaffolds, for which the MUMmer (release 3.0, Kurtz et al., 2004) was implemented to achieve. Download

    Unmapped reads were used to generate population novel sequences. Due to the large number this reads, we devided this sequence into several collections when using MaSuRCA (V3.13) software for de novo assembly. After that we use cd-hit v 4.6.5 software clustering all the contigs we obtained with default parameters to remove redundancy sequence. Then, this Non-redundant contigs set was blast to B73 reference genome, and any with concordance >= 90% and contigs alignment coverage >=50% was removed from future analysis. Additionally, this novel sequence were ﬁltered against EBI bacterial genome database and B73 plastid genome sequences using BLASTN requiring a minimum E-value of 1e-5, and a minimum of 50% coverage and 85% identity, any sequence tend to be nonPlantae was removed from downstream analyses. About 600M novel sequences were finally obtained, including 464707 contigs. >Download
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
