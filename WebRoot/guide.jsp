<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Guide</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-jvectormap.js"></script>
<link href="Css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="Css/bootstrap-table.css" />
<link href="Css/main.css" rel="stylesheet" />
<link href="Css/tableexport.css" rel="stylesheet" />
<script type="text/JavaScript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/JavaScript" src="Jscript/bootstrap.min.js"></script>
<script type="text/JavaScript" src="Jscript/bootstrap-table.min.js"></script>
<script type="text/JavaScript" src="Jscript/tableExport.js"></script>
<script type="text/JavaScript" src="Jscript/bootstrap-table-export.js"></script>
<script type="text/JavaScript" src="Jscript/echarts.js"></script>
<script src="Jscript/china.js"></script>
</head>

<body>
	<%@ include file="../ListHeader.jsp"%>
    <div class="container">
<style>
span.dot{
    color:#5b9bd5;
    font-family:Wingdings;
    font-size:12pt;
}

span.mar{

}

img{
    margin:50px 20px;
    max-width:90%;
    height:auto;
    box-shadow:1px 1px 3px #ccc;
}

h3{
    padding:50px 20px;
}

p{
    padding:2px 20px;
}

</style>
        <div class="row">
        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <h3>What are the types of data integrated in database?</h3>
                </div>
            <p>MaizeCUBIC is a free database describes genomic variations, and phenotypes 
            for a maize CUBIC population (24 founders and 1404 inbred offspring),  including
            comprehensive information of over 14M SNPs, 410K InDels, 660K SVs, 600M novel sequences
            which constituted the highest density and the most diverse maize variant map to date. A
            total of 23 agronomic traits measured on parents and progeny in five locations representative
            of where maize is mainly grown in China was also provided in database. Based on 
            these variations, we display the mosaic structure for progenies in the population, reflecting a
            high-resolution reshuffle across parental genomes. And to further exploring the
            genotype–phenotype relationships, two different methods of GWAS results was provided for 
            dissecting genetic mechanisms 23 agronomic traits. All these data can be accessed through
            the following analytical tools, as well as download directly from our FTP site.</p>
        <div style="text-align:center">
            <img src="images\guide_index.png"></img>
        </div>
        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <h3>Features list and examples to realize it step-by-step</h3>
                </div>
            <p>MaizeCUBIC is free and open to the public with user-friendly tools for data analysis,
            visualization, and download. The tools can be grouped into three
            general classes according to its related information: Variation Map (Variation Browser, Bin Map),
            GWAS Catalog (GWAS Search, GWAS Diagram) , Variation Application (BLAST/Primer-BLAST, General
            Primer Design, Primer Design by 
            Region, Primer Design by Variation ID).</p>
        <div style="text-align:center">
            <img src="images\guide_tools.png"></img>
        </div>
        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                <h3>Variation Browser</h3>
                </div>
            <p>Variation Browser is a utility to easy browse sequences, genes, and genetic variations in various regions of the maize genome.</p>
            <p>STEP ONE : choose a region or gene you want to look for, and submit</p>
        <div style="text-align:center">
            <img src="images\guide_browser1.png"></img>
            <img src="images\guide_browser2.png"></img>
        </div>
            <p>STEP TWO: Several tracks are available. </p>
        <div style="text-align:center">
            <img src="images\guide_jbrowse1.png"></img>
        </div>


        <span class="dot" style="color:black"></span><span>The ‘Reference sequence’ track show the B73(v3.25) reference sequence and amino acids from six possible reading frames.</span>
        <div style="text-align:center">
            <img src="images\guide_jbrowse2.png"></img>
        </div>


            <span class="dot" style="color:black"></span><span>The ‘GFF3’ track contains gene structure annotation and expression comparison description of the reference genome. </span>
        <div style="text-align:center">
            <img src="images\guide_jbrowse3.png"></img>
        </div>


            <span class="dot" style="color:black"></span><span>And the SNP information including ID, allele frequency and alleles for each individual in population was list below in the ‘VCF’ track.</span>

        <div style="text-align:center">
            <img src="images\guide_jbrowse4.png"></img>
        </div>

        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span><span class="title">Bin Map</span>
                </div>
            <p>Based on variations, we display the mosaic structure for progenies in the population, reflecting a high-resolution reshuffle across parental genomes. You can search detailed haplotype information through choosing or entering accession names and selecting the corresponding genomic region.</p>
        <div style="text-align:center">
            <img src="images\guide_binmap1.png"></img>
        </div>


            <p>The results will be like this:</p>
        <div style="text-align:center">
            <img src="images\guide_binmap2.png"></img>
        </div>


            <p>Or:</p>
        <div style="text-align:center">
            <img src="images\guide_binmap3.png"></img>
        </div>

        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span><span class="title">GWAS Search</span>
                </div>
            <p>Single-variant-based GWAS and haplotype-based GWAS results of 23 agronomic traits for poplulation were available in this section. And detailed information of significant SNPs(p&lt;2.79x10-8) for you interested traits can be queried by limiting genomic coordinate or gene ID.</p>
            <p>The results show like this:</p>
        <div style="text-align:center">
            <img src="images\gwas_search_column.PNG"></img>
            <img src="images\gwas_dot.PNG"></img>
            <img src="images\gwas_table.PNG"></img>
        </div>
        </div>
    </div>



        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span> <span class="title">GWAS Diagram</span>
                </div>
            <p>We integrated the GWAS results for multiple traits obtained by diverse methods, and dynamic showing their distribution characteristics in whole chromosome range. Concerned results can be filtered via tracks on side of the page. The trait name and detailed information display when hovering over it. And clicking on it links to the relevant entry in the GWAS Search.</p>
        <div style="text-align:center">
            <img src="images\guide_gentree.png"></img>
        </div>
        </div>
    </div>



        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span><span class="title">BLAST/Primer-BLAST</span>
                </div>
            <p>BLASTN program was provided to find regions of similarity between nucleotide query to sequences in our local databases and calculates the statistical significance. If the query sequence is less than 50 bp, please choose Primer-BLASTN. Multiple parameters can be adjusted according to demands. Here we use Basic Local Alignment Search Tool (BLAST) as a backend engine.</p>

            <p>Long sequences blast:</p>
        <div style="text-align:center">
            <img src="images\guide_blast1.png"></img>
        </div>

            <p>Short (less than 50 bp) sequences blast:</p>
        <div style="text-align:center">
            <img src="images\guide_blast2.png"></img>
        </div>

            <p>The results are given in a table format showing the hits found, sequence identifiers for the hits with scoring related data, as well as alignments for the sequence of interest and the hits received with corresponding BLAST scores for your query sequence.</p>
        <div style="text-align:center">
            <img src="images\guide_blast3.png"></img>
        </div>


            <p>And you can choose a hit , the detail alignment bases will be show like this:</p>
        <div style="text-align:center">
            <img src="images\guide_blast4.png"></img>
            <img src="images\guide_blast5.png"></img>
        </div>


        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                  <span class="dot"></span> <span class="title">General Primer Design</span>
                </div>
            <p>You can input your sequences directly to pick PCR-primers or develop molecular markers in this option. </p>
        <div style="text-align:center">
            <img src="images\guide_primer_general.png"></img>
        </div>
        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span><span class="title">Primer Design by Region</span>
                </div>
            <p>You can choose one of the provided databases and input a genomic region to pick PCR-primers in this option. </p>
        <div style="text-align:center">
            <img src="images\guide_primer_byregion.png"></img>
        </div>
        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                   <span class="dot"></span><span class="title">	Primer Design by Variation ID</span>
                </div>
            <p>In our database, each SNP or INDEL is labeled with a unique identifier (ID, e.g. chr1.s_1111111, chr1.i_11111). The first string ‘chr’ represents chromosome and the second string indicates the polymorphic type (‘s’ for SNP, ‘i’ for INDEL). The subsequent number is the chromosome coordinate of a variation. ‘chr1.s_1111111’ means a SNP at chromosome 1, 1111111 bp. Users can input a SNP or INDEL ID (in our database) and select upstream and downstream regions to pick PCR-primers to validate the variant through the ‘Primer Design by Region Variation ID’ tool. </p>
        <div style="text-align:center">
            <img src="images\guide_primer_byvar.png"></img>
        </div>
        </div>
    </div>



        <div class="col-md-12">
            <div class="my-panel">
            <p>And in all three primer design options, the results will be show like this and you can download if needed:</p>
        <div style="text-align:center">
            <img src="images\guide_primer_result1.png"></img>
            <img src="images\guide_primer_result2.png"></img>
            <img src="images\guide_primer_result3.png"></img>
        </div>
        </div>
    </div>

</div>
</div>
	<%@ include file="../ListFooter.jsp"%>
</body>
</html>
