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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"50615",secure:"50605"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/Magic/WebRoot/guide.jsp">
	<%@ include file="../ListHeader.jsp"%>
    <div class="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/Magic/WebRoot/guide.jsp">
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
                    <h3>Manual for MaizeCUBIC database</h3>
                </div>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;This manual is created with the expectation to help you better understand MaizeCUBIC 
            database. Any comments or problems please contact: </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;Dr. Jianxiao Liu (liujianxiao@mail.hzau.edu.cn)</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;Miss Jingyun Luo (jingyunluo@foxmail.vom)</p>
        </div>
    </div>


        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <h3>What are the types of data integrated in database?</h3>
                </div>
            <p>MaizeCUBIC is a free database describes genomic variations, and phenotypes for
             a maize CUBIC population (24 founders and 1404 inbred offspring), including comprehensive
              information of over 14M SNPs, 43K Indels, 660K SVs, 600M novel sequences which 
              constituted high density and diverse maize population variant map. And a subset of 391
               progenies were randomly selected from the CUBIC population for RNA-sequencing, and
                the gene expression quantifications data and eQTL mapping results was collected in
                 database. A total of 23 agronomic traits measured on parents and progeny in five
                  locations representative of where maize is mainly grown in China was also provided
                   in database. Based on these variations, we display the mosaic structure for
                    progenies in the population, reflecting a high-resolution reshuffle across
                     parental genomes. And to further exploring the genotype–phenotype relationships
                     , two different methods of GWAS results was provided for dissecting genetic 
            mechanisms 23 agronomic traits. All these data can be accessed through the following 
            analytical tools, as well as download directly.</p>
        <div style="text-align:center">
            <img src="images\1.png"></img>
        </div>
        </div>
    </div>

		<div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                <h3>Features list and examples to realize it step-by-step</h3>
                </div>
            <p> MaizeCUBIC is free and open to the public with user-friendly tools for data analysis, visualization, and download. The tools can be grouped into three general classes according to its related information: Variation Map (Haplotype Bin Map, Genome Browser, Variation Search，Gene Expression Search), GWAS Catalog (GWAS Search, GWAS Diagram), Variation Application (BLAST/Primer-BLAST, General Primer Design, Primer Design by Region, Primer Design by Variation ID).</p>
        <div style="text-align:center">
            <img src="images\2.png"></img>
        </div>
    	</div>
	</div>

        <div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                <h3>Haplotype Bin Map</h3>
                    <!--  <span class="dot"></span><span class="title">Haplotype Bin Map</span>-->
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
                <h3>Genome Browser</h3>
                </div>
            <p> Genome Browser is a utility to easy browse sequences, genes, and genetic variations in various regions of maize genome.</p>
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
                    <span class="dot"></span><span class="title">Variation Search</span>
                </div>
            <p>In our database, each identified SNP or Indel is labeled with a unique identifier (ID, e.g. chr1.s_1234, chr1.i_1234). The first string ‘chr’ represents chromosome and the second string indicates the polymorphic type (‘s’ for SNP, ‘i’ for Indel). The subsequent number is the chromosome coordinate of a variation. ‘chr1.s_1234’ means a SNP at chromosome 1, 1234 bp. In this interface, users can fetch the genotypes directly through entering the variation ID. Also, information of variations can be queried by limiting genomic coordinates of the reference genome or gene identifiers. Furthermore, variations can be filtered by keywords of variations annotation.</p>
        <div style="text-align:center">
            <img src="images\11.png"></img>
        </div>
        
        <p>The acquired variations would be displayed in the results page within a table and have links to the relevant entry in Variation Browser tool to see detail information about them.</p>
        <div style="text-align:center">
            <img src="images\12.png"></img>
        </div>
        </div>
    </div>

	<div class="col-md-12">
            <div class="my-panel">
                <div class="title">
                    <span class="dot"></span><span class="title">Gene Expression Search</span>
                </div>
            <p>The expression values by RPKM normalization can be searched and displayed via this tool. Just select the sample list and input the gene list.</p>
        <div style="text-align:center">
            <img src="images\gene_search.png"></img>
        </div>
        
        <p>The results will be display in a table and can be download directly.</p>
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
            <img src="images\gwas_table1.PNG"></img>
            <img src="images\gwas_table2.PNG"></img>
            <img src="images\gwas_table3.PNG"></img>
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
