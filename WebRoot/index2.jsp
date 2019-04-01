<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   >
<html>
    <head>
    <base href="<%=basePath%>">
   
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
        
        <title>Home</title>
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
        <meta name="author" content="Daliu"/>
        <meta name="keywords" content=""/>
        <meta name="describe" content=""/>
        
        
            <link href="Css/main1.css" rel="stylesheet"/>
        <script src="jquery.1.11.3.min.js" type="text/javascript"></script>
        
        
        <script type="text/javascript">
            $(document).ready(function(){
                var width = $('#carousel').width();
                $('.img').width(width);
                // 图片左右翻滚
                var size = $('.slidebtn-01>ul>li').length;
                var frist = 0;
                var datetime;
                $('.slidebtn-01 li').mouseover(function(){
                    frist = $('.slidebtn-01 li').index(this);
                    showpic(frist);
                }).eq(0).mouseover();
                
                $('.slidebox-01').hover(function(){
                    clearInterval(datetime);
                },function(){
                    datetime = setInterval(function(){
                        showpic(frist)
                        frist++;
                        if(frist==size){
                            frist=0;
                        }
                    },4000);
                }).trigger('mouseleave');

                function showpic(frist){
                    var imgheight = $('.slidebox-01 li').width();
                    $('.slidepic-01').stop(true,false).animate({left:-imgheight*frist},600)
                    $('.slidebtn-01 li').removeClass('current').eq(frist).addClass('current');
                };
            });
        </script>
    </head>
    <body>
         <%@ include file="../ListHeader.jsp"%>
        <div class="content" style="height:2000px;margin-top:20px;">
            <div id="carousel">
                <div class="slidebox-01">
					<ul style="left:0px;" class="slidepic-01">
							<a href="Dataintroduction/phenotypedata.jsp"target="_blank"><!--ie浏览器解析图片的时候有时会默认给它加一个边框-->
								<li>
                                    <image class="img" alt="" src="images/index1.png"/>
                                </li>
							</a>
							<a href="Dataintroduction/genotypedata.jsp"target="_blank">
								<li><image class="img" alt="" src="images/index2.png"/></li>
							</a>
							<a href="dataintrudution/"target="_blank">
								<li><image class="img" alt="" src="images/index3.png"/></li>
							</a>
					</ul>
					<div class="slidebtn-01"><!--这里是1234小图标-->
						<ul>
							<li class="current"></li>
							<li class=""></li>
							<li class=""></li>			
						</ul>
					</div>
		        </div>
            </div>
            <div class="row">
            <div  class="title" style="text-align: center;">
<h1>Welcome to Maize MAGIC Variation Database</h1>
</div>
<div  class="title">
<h3>Database Overview</h3></div>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A modified MAGIC population consist of 1404 individuals derived from twenty-four elite lines that have been widely applied in Chinese breeding programs has been developed, and all progenies and founders have been sequenced at low coverage (1x and 11x, respectively). DNA libraries were sequenced with Illumina HiSeq 2500 with 125-bp paired-end reads using V4 reagents, generating almost 2000x genome coverage. Sequences data are available in <u><b>BIG Data Center (BIGD)</b></u>, and GSA project accession number is <u><b>PRJCA000346</b></u>.</h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;An integrated strategy in variant calling and imputation was applied to the population, and over 53M SNPs, 2.8M InDels, 660K SVs, 600M novel sequences were finally obtained, which constituted the highest density and the most diverse maize variant map to date. The SNP set was found >99% consistency compared with genotypes derived from array- and assembly- based methods, while the percent of validated large structural variants was considered as ~60%. This variant map, together with the methodological practices, would be a great valuable resource for the plant community. <a>Read more……</a></h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;And Combining hidden markov model (HMM) and linkage disequilibrium (LD) method, we successfully reconstructed the mosaic structure for any progeny in synthetic population, reflecting a high-resolution reshuffle across 24 parental genomes. <a>Read more……</a></h4>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Three GWAS method including Single-variant-based GWAS using mixed linear models, a new the haplotype-based mixed linear model method and Allelic genetic heterogeneity GWAS was used for dissecting genetic mechanisms of over 20 agronomic and yield traits. <a>Read more……</a></h4>

</div>
            <div class="row">
            <h3>The main publication for maize MAGIC Project:</h3>
                
            </div>
            
        </div>
        <%@ include file="../ListFooter.jsp"%>
    </body>
</html>
