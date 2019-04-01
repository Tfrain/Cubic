<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   
    <title>Tool one</title>
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
        <div class="content" style="height:1200px;">
        <div class="row">

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
        <%@ include file="ListFooter.jsp"%>
  </body>
</html>
