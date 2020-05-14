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
            
            <div class="row" style="margin-top:10px;">
                <div class="my-panel">
                <h3 class="title">Genomic variation</h3>
                <div class="article">
                    <div class="media">

                        <div class="media-body" style="text-align:justify;">
                           &nbsp;&nbsp;&nbsp;&nbsp;Database genotype data (SNPs, Indels) was collected from previous study (Liu et al., 2020). Briefly,
                            all progenies were re-sequenced with ~1x coverage, and the 24 founders with 11x coverage; 194 lines were further genotyped 
                            using a maize200K array to cross-validate variant discovery. Briefly, approximately 5 Tb of raw sequencing data were assembled, 
                            and popular pipelines were employed to characterize over 14 million high-quality SNPs and 43K InDels.
   						</br>
   						<!-- 
   						<a href="https://pan.baidu.com/s/1AsPJLTe--gU5EN8aFTMYPA#list/path=%2F" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading SNPs in PLINK formats] 
   						</a>
   						</br>
   						<a href="https://1479696753-my.sharepoint.com/personal/weicc_hechuan_ooo/_layouts/15/onedrive.aspx?originalPath=aHR0cHM6Ly8xNDc5Njk2NzUzLW15LnNoYXJlcG9pbnQuY29tLzpmOi9nL3BlcnNvbmFsL3dlaWNjX2hlY2h1YW5fb29vL0VuTVI3MW1IRHc5UHROSlNTWTBsUHlVQm5XclUtNUJfaVdGNDgzUEI1ZTdzc3c%5FcnRpbWU9ZUsxcFNYalIxMGc&id=%2Fpersonal%2Fweicc%5Fhechuan%5Fooo%2FDocuments%2F%E5%85%B1%E4%BA%AB%2Fcubic%2FIndel" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading InDels vcf]
   						</a>
   						-->
   				<span> The genomic variation data have been deposited in the figshare database
   				</span>
   				<br>
   				<span>（DOI:10.6084/m9.figshare.12220349; https://figshare.com/)
   				</span>
                             <div class="lefttool" style="width:100%;height:580px;text-align:center;margin-bottom:20px;">
                                  <image src="images/genotype2.png" width="700px"/>
                             </div>  
                              
   						<br>&nbsp;&nbsp;&nbsp;&nbsp; 
                          <h3 class="title" style="color: #4381be">Identification of structure variation</h3>
						  &nbsp;&nbsp;&nbsp;&nbsp; Clean reads after trimmed were mapped to B73 reference genome (v3.25, downloaded from http://plants.ensembl.org) using BWA-mem
						   (Version 0.7.12, Li and Durbin, 2010), 
						   and discordant reads (with unusual insert size) and split ones (best mapped to clipped positions) 
						   were extracted and applied in structure variation calling, as population mapping-based strategy. 
						   The software LUMPY (Layer et al., 2014) and HYDRA-Multi (Lindberg et al., 2015) were integrated to realize the idea. 
                          </br>
                          &nbsp;&nbsp;&nbsp;&nbsp; Another assembly-based structure variation calling strategy was performed through comparing the B73 reference genome into HuangZaoSi (also called HZS) scaffolds 
                          (Li et al., 2019), for which the MUMmer 
                          (release 3.0, Kurtz et al., 2004) was implemented to achieve. And the percent of validated large structural variants was considered as ~60%.
                          <br>&nbsp;&nbsp; 
                          <h3 class="title" style="color: #4381be">Novel sequences assemble</h3>
&nbsp;&nbsp;&nbsp;&nbsp; Reads that could not be aligned to B73 reference genome (v3.25) in above studies, including unmapped reads of ~11x sequencing data of 24 parents and ~1x sequencing data 1404 progenies, were used to generate novel non-reference sequences of CUBIC population. Due to the large number of unmapped reads, we devided these sequences into several collections when using MaSuRCA 
(v3.13, Zimin et al., 2013) software for the de novo assembly. After that cd-hit 
(v4.6.5, Li and Godzik, 2006) software with default parameters was applied to clustering all contigs we obtained to remove redundancy sequences. Then, these non-redundant contigs set was BLAST to 
B73 reference genome (v3.25), and alignments with concordance >= 90% and coverage >=50% was removed from future analysis. Additionally, these novel sequences were ﬁltered against EBI bacterial genome database 
(EBI; http://www.ebi.ac.uk ) and B73 plastid genome sequences 
(v3.25) using Basic local alignment search tool (BLAST) 
(Altschul, 1990) requiring a minimum e-value of 1e-5, a minimum of 50% coverage and 85% identity. Also any sequences tend to be nonPlantae was removed from downstream analyses. Finally, about 600M novel sequences were obtained, including 464707 contigs.
                          </br>
&nbsp;&nbsp;&nbsp;&nbsp;To evaluate the reliability of novel sequences, we compared them with the PAV tags in a study of maize pan-genome sequence anchors 
(Lu et al., 2015), 148916 (32%) of our novel sequences was aligned to 818056 (71.3%) of the PAV tags with a minimum of 90% coverage and 85% identity. Also, the novel sequences were BLAST to a HuangZaoSi (also called HZS) genome 
(Li et al., 2019), nearly 17% (79000 among 464707) of novel sequences had above 85% identity. In brief, our novel sequences is pretty reliable and covers wider variation than previous studies.
                          </br>
                          <h3 class="title" style="color: #4381be">References</h3>
                          1.	Altschul SF, Gish W, Miller W, Myers EW, Lipman DJ. (1990). Basic local alignment search tool. <i>Journal of Molecular Biology, 215</i>(3), 403-410.
                          </br>
                          </br>
                          2.	Kurtz S, Phillippy A, Delcher AL, Smoot M, Shumway M, Antonescu C, Salzberg SL. (2004). Versatile and open software for comparing large genomes. <i>Genome biology, 5</i>(2): R12.
                          </br>
                          </br>
                          3.	Layer RM, Chiang C, Quinlan AR, Hall IM. (2014). Lumpy: a probabilistic framework for structural variant discovery. <i>Genome Biology, 15</i>(6), R84.
                          </br>
                          </br>
                          4.	Li C, Song W, Luo Y, Gao S, Zhang R, Shi Z, Wang X, Wang R, Wang F, Wang J, Zhao Y, Su A, Wang S, Li X, Luo M, Wang S, Zhang Y, Ge J, Tan X, Yuan Y, Bi X, He H, Yan J, Wang Y, Hu S, Zhao J. The HuangZaoSi Maize Genome Provides Insights into Genomic Variation and Improvement History of Maize. <i>Molecular Plant, 12</i>(3), 402-409.
                          </br>
                          </br>
                          5.	Li H, Durbin R. (2009). Fast and accurate short read alignment with burrows-wheeler transform. <i>Bioinformatics, 25</i>(14):1754-60.
                          </br>
                          </br>
                          6.	Lindberg MR, Hall IM, Quinlan AR. (2015). Population-based structural variation discovery with hydra-multi. <i>Bioinformatics, 31</i>(8), 1286-1289.
                     	  </br>
                     	  
                          </br>
                          7.	Liu H, Wang X, Xiao Y, Luo J, Qiao F, Yang W, Zhang R, Meng Y, Sun J, Yan S, Peng Y, Niu L, Jian L, Song W, Yan J, Li C, Zhao Y, Liu Y, Warburton ML, Zhao J, Yan J. (2020). CUBIC: an atlas of genetic architecture promises directed maize improvement. <i>Genome biology, 21</i>(1):20.
                          </br>
                          </br>
                          8.	Li W, Godzik A. (2006). Cd-hit: a fast program for clustering and comparing large sets of protein or nucleotide sequences. <i>Bioinformatics, 17</i>, 282-283
                          </br>
                          
                          </br>
                     	  9.	Lu F, Romay MC, Glaubitz JC, Bradbury PJ, Elshire RJ, Wang T, Li Y, Li Y, Semagn K, Zhang X, Hernandez AG, Mikel MA, Soifer I, Barad O, Buckler ES. (2015). High-resolution genetic mapping of maize pan-genome sequence anchors. <i>Nature Communications, 6</i>, 6914.
                     	  </br>
                          </br>
                     	  10.	Zimin AV, Marçais G, Puiu D, Roberts M, Salzberg SL, Yorke JA. (2013) . The MaSuRCA genome assembler. <i>Bioinformatics, 29</i>(21), 2669-2677.
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
