<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>Dataintroduction</title>
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
        <div class="content" style="height:1900px;">
        <div class="row">
<div  class="title" style="margin-top:20px;text-align: center;">
<h2>Welcome to Maize MAGIC Variation Database</h2>
</div>
<div  class="title">
<h3>Database Overview</h3></div>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A modified MAGIC population consist of 1404 individuals derived from twenty-four elite lines that have been widely applied in Chinese breeding programs has been developed, and all progenies and founders have been sequenced at low coverage (1x and 11x, respectively). DNA libraries were sequenced with Illumina HiSeq 2500 with 125-bp paired-end reads using V4 reagents, generating almost 2000x genome coverage. Sequences data are available in <u><b>BIG Data Center (BIGD)</b></u>, and GSA project accession number is <u><b>PRJCA000346</b></u>.</h4>
<h4>An integrated strategy in variant calling and imputation was applied to the population, and over 53M SNPs, 2.8M InDels, 660K SVs, 600M novel sequences were finally obtained, which constituted the highest density and the most diverse maize variant map to date. The SNP set was found >99% consistency compared with genotypes derived from array- and assembly- based methods, while the percent of validated large structural variants was considered as ~60%. This variant map, together with the methodological practices, would be a great valuable resource for the plant community. <a>Read more……</a></h4>
<h4>And Combining hidden markov model (HMM) and linkage disequilibrium (LD) method, we successfully reconstructed the mosaic structure for any progeny in synthetic population, reflecting a high-resolution reshuffle across 24 parental genomes. <a>Read more……</a></h4>
<h4>Three GWAS method including Single-variant-based GWAS using mixed linear models, a new the haplotype-based mixed linear model method and Allelic genetic heterogeneity GWAS was used for dissecting genetic mechanisms of over 20 agronomic and yield traits. <a>Read more……</a></h4>

</div>
            <div class="row">
            <h3>The main publication for maize MAGIC Project:</h3>
                <h4 class="title">Database contents</h4>
                <p>
                    We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies.

                    Over 50 million single-nucleotide polymorphisms (SNPs) and 2 million InDels were identified using our variant calling pipeline (Figure

                    Briefly, those discordant reads (with unusual insert size) and split ones (best mapped to clipped positions) were applied in SV calling, as population mapping-based strategy. The software LUMPY (Layer et al., 2014) and HYDRA-Multi (Lindberg et al., 2015) were integrated to realize the idea, and TEMP (Zhuang et al., 2014) was used for TE absence/presence calling. Another assembly-based strategy was performed through comparing the B73 (V3) reference genome into HZS scaffolds, for which the MUMmer (release 3.0, Kurtz et al., 2004) was implemented to achieve. Finally, 660K structural variants were obtained under carefully quality control.

                </p>
            </div>
            <div class="row">
                <h4 class="title">Data generation</h4>
                <div class="article">
                    <div class="media">
                        <a class="media-left" href="#">
                            <image src="images/genomaize.png">
                        </a>
                        <div class="media-body">
                            We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies.We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies.
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <h4 class="title">Data processing</h4>
                <div class="article">
                    <div class="media">
                        <div class="media-body">
                            We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies.We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies.
                        </div>
                        <a class="media-left" href="#">
                            <image src="images/B73_v4.png">
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <h4 class="title">Acknowledgements</h4>
                <p>
                    We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies. Over 50 million single-nucleotide polymorphisms (SNPs) and 2 million InDels were identified using our variant calling pipeline (Figure Briefly, those discordant reads (with unusual insert size) and split ones (best mapped to clipped positions) were applied in SV calling, as population mapping-based strategy. The software LUMPY (Layer et al., 2014) and HYDRA-Multi (Lindberg et al., 2015) were integrated to realize the idea, and TEMP (Zhuang et al., 2014) was used for TE absence/presence calling. Another assembly-based strategy was performed through comparing the B73 (V3) reference genome into HZS scaffolds, for which the MUMmer (release 3.0, Kurtz et al., 2004) was implemented to achieve. Finally, 660K structural variants were obtained under carefully quality control.
                </p>
            </div>
            <div class="row">
                <h4 class="title">Citations</h4>
                <p>
                    We have sequenced the whole genomes of 24 parents and 1404 progenies by an Illumina HiSeq 2500 sequencer, generating a total of 41 billion paired-end reads of 125 bp in length (4.1 Tb of sequences), covering 2000× genome in total. The sequencing was done to a mean depth of 11X for every 24 parents, and 1X for each 1404 progenies. Over 50 million single-nucleotide polymorphisms (SNPs) and 2 million InDels were identified using our variant calling pipeline (Figure Briefly, those discordant reads (with unusual insert size) and split ones (best mapped to clipped positions) were applied in SV calling, as population mapping-based strategy. The software LUMPY (Layer et al., 2014) and HYDRA-Multi (Lindberg et al., 2015) were integrated to realize the idea, and TEMP (Zhuang et al., 2014) was used for TE absence/presence calling. Another assembly-based strategy was performed through comparing the B73 (V3) reference genome into HZS scaffolds, for which the MUMmer (release 3.0, Kurtz et al., 2004) was implemented to achieve. Finally, 660K structural variants were obtained under carefully quality control.
                </p>
            </div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
