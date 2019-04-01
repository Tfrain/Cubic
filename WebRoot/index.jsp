<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   >
<html>
<head>
<base href="<%=basePath%>">

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link href="Css/bootstrap.min.css" rel="stylesheet" />
<link href="Css/main.css" rel="stylesheet" />
<link href="Css/main1.css" rel="stylesheet" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script src="jquery.1.11.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<title>Home</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />


<link href="Css/main1.css" rel="stylesheet" />


<script type="text/javascript">
        $(function(){$("#mycarousel").carousel('cycle');});
</script>
    
</head>
<body>
	<%@ include file="../ListHeader.jsp"%>

	<div class="container" style="1400px;height:2300px;margin-top:20px;">
        <div class="row" style="margin-top:5px;">
		<div id="mycarousel" class="carousel slide" >
					<!--这里是1234小图标-->
					<ol class="carousel-indicators">
						<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
						<li data-target="#mycarousel" data-slide-to="1" ></li>
						<li data-target="#mycarousel" data-slide-to="2" ></li>
					</ol>
                <div class="carousel-inner">
                    <div class="item active">
					<a href="/Magic/Dataintroduction/genotypedata.jsp" target="_blank">
						<!--ie浏览器解析图片的时候有时会默认给它加一个边框-->
                        <image class="img" alt="First slide" src="images/index1.png" style="width:100%;max-width:none;height:430px;"
                                 />
					</a>
                    </div>
                    <div class="item">
					<a href="/Magic/Dataintroduction/phenotypedata.jsp" target="_blank" >
                    <image class="img" alt="Second slide" src="images/index2.png" style="width:100%;max-width:none;height:430px;"
                             />
					</a>
                    </div>
                    <div class="item">
					<a href="/Magic/contact.jsp" target="_blank">
                        <image class="img" alt="Third slide" src="images/index3.png" style="width:100%;max-width:none;height:430px;"
                                 />
					</a>
                    </div>
                    </div>
			</div>
			</div>

		<div class="row">
			<div class="col-md-3" style="top:10px;position:sticky;">
				<div class="panel panel-primary">
					<div class="panel-heading">Navigation</div>
					<div class="panel-body">
						<ul class="list-group">
							<a href="Dataintroduction/genotypedata.jsp"
								class="list-group-item" style="color:#333;text-align:center;">Genotype Data</a>
							<a href="Dataintroduction/phenotypedata.jsp"
								class="list-group-item" style="color:#333;text-align:center;">Phenotype Data</a>
							<a href="Draw/magic.jsp" class="list-group-item"
								style="color:#333;text-align:center;">Bin Map</a>
							<a href="JBrowse/jbrowsetool.jsp" class="list-group-item"
								style="color:#333;text-align:center;">Variation Browser</a>
							<a href="Step\step_one.jsp" class="list-group-item"
								style="color:#333;text-align:center;">GWAS Search</a>
							<a href="genetree\gene_tree.jsp" class="list-group-item"
								style="color:#333;text-align:center;">GWAS Diagram</a>
							<a href="Last\Last.jsp" class="list-group-item"
								style="color:#333;text-align:center;">BLAST/Primer-BLAST</a>
							<a href="Primer\Primersearch2.jsp" class="list-group-item"
								style="color:#333;text-align:center;">General Primer Design</a>
							<a href="Primer\Primersearch1.jsp" class="list-group-item"
								style="color:#333;text-align:center;">Primer Design By
								Region</a>
							<a href="Primer\Primersearch3.jsp" class="list-group-item"
								style="color:#333;text-align:center;">Primer Design By
								Variation ID</a>
						</ul>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>

			<div class="col-md-9" style="text-align:justify;">
				<div class="title" style="text-align: center;color:#4381be;margin-bottom:15px">
					<h1>Welcome to Maize CUBIC Variation Database</h1>
					<div class="title" style="color:#4381be;margin-bottom:15px">
					</div>
				</div>
				<div class="panel-body">
					<div class="my-panel">
						<h2 style="color:#4381be;">Population Design</h2>
						<p style="text-indent:2em;">A maize Complete-diallel plus
							Unbalanced Breeding-like Inter-Cross population (CUBIC)
							population consist of 1404 individuals derived from twenty-four
							elite lines that have been widely applied in Chinese breeding
							programs has been developed.<p/>
                        <div style="text-align:center">
							<img alt="graph" src="images\graph.png"
								style="margin:0 auto;width:700px"></img>
                        </div>
						<p style="text-indent:3em;">•30 F1s with best agronomic
							performance were selected to futher cross in NCII,and the other
							110 F1s were randomly selected to cross with open pollinated in
							isolated region.</p>
						<p style="text-indent:3em;">•The seed from above F1s were
							mixed together with the amount of 2:1 with an expectation to
							improve the population performance.</p>
						<p style="text-indent:3em;">•All harvest individuals were
							next planted under open pollination within isolated region for
							totally 6 generations.</p>
						<p style="text-indent:3em;">•Following,the population was
							self-pollinated for another 6 generations.</p>
						<div style="text-align:center">
                            <img alt="maize"
								src="images\maize.png" style="margin:0 auto;width:400px"></img>
						</div>
					</div>
<%--
   -                    <div class="my-panel">
   -                        <h2 style="color:#4381be;">Sequencing</h2>
   -                        <p style="text-indent:2em;">All progenies and founders
   -                            have been sequenced at low coverage (1x and 11x, respectively).
   -                            DNA libraries were sequenced with Illumina HiSeq 2500 with 125-bp
   -                            paired-end reads using V4 reagents, generating generations. All
   -                            progenies and founders have been sequenced at low coverage (1x
   -                            and 11x, respectively). DNA libraries were sequenced with
   -                            Illumina HiSeq 2500 with 125-bp paired-end reads using V4
   -                            reagents, generating almost 2000x genome coverage. Sequences data
   -                            are available in
   -                            <a href="http://bigd.big.ac.cn/" style="color:#4381be;">BIG
   -                                Data Center (BIGD)</a>, and GSA project accession number is <u><b>PRJCA000346</u></b>.
   -                    </p>
   -                    </div>
   -                    <div class="my-panel">
   -                        <h2 style="color:#4381be;">Genotyping</h2>
   -                        <p style="text-indent:2em;">An integrated strategy in
   -                            variant calling and imputation was applied to the population, and
   -                            over 53M SNPs, 2.8M InDels, 660K SVs, 600M novel sequences were
   -                            finally obtained, which constituted the highest density and the
   -                            most diverse maize variant map to date. The SNP set was found
   -                            >99% consistency compared with genotypes derived from array- and
   -                            assembly- based methods, while the percent of validated large
   -                            structural variants was considered as ~60%. This variant map,
   -                            together with the methodological practices, would be a great
   -                            valuable resource for the plant community.
   -                        [><div class="class0"><]
   -                            <a href="/Magic/Dataintroduction/genotypedata.jsp"
   -                                style="color:#4381be;">Read more……</a>
   -                        [></div><]
   -                        </p>
   -                    </div>
   -
   -                    <div class="my-panel">
   -                        <h2 style="color:#4381be;">Phenotyping</h2>
   -                        <p style="text-indent:em;">The population was planted in
   -                            five different provinces in the summer of 2014 and 20 traits were
   -                            investigated.
   -                        [><div class="class0"><]
   -                            <a href="/Magic/Dataintroduction/phenotypedata.jsp"
   -                                style="color:#4381be;"></a>
   -                        [></div><]
   -                        </p>
   -                    </div>
   --%>


					<div class="my-panel">
						<h2 style="color:#4381be;">Comments or Questions</h2>
						<p style="text-indent:2em;">For any questions please contact Jianxiao Liu 
                        (liujianxiao@webmail.hzau.edu.cn) or Jingyun Luo  (jingyunluo@foxmail.com)</p>
					</div>

					<div class="my-panel">
						<h2 style="color:#4381be;">Recommended browsers</h2>
						<p style="text-indent:2em;">The recommended browsers are Chrome, Firefox, 
                        Safari, and Edge ( IE8 and earlier have poorer 
                        support and may give a lesser experience).</p>
					</div>


					<div class="my-panel">
						<h2 style="color:#4381be;">Citations</h2>
						<p style="text-indent:2em;">Researchers who wish to use RiceVarMap are encouraged to refer to our publication or 
                        <a href="http://ricevarmap.ncpgr.cn/v2/publication/" style="color:#4381be;">more</a>:</p>

                        <p style="text-indent:2em;">Zhao H, Yao W, Ouyang Y, Yang W, Wang G, Lian X, Xing Y, Chen L, Xie W. 
                        <a href="https://academic.oup.com/nar/article/43/D1/D1018/2439488" style="color:#4381be;">RiceVarMap: a comprehensive database of rice genomic variations.</a>
                        Nucleic Acids Res, 2015, 43: D1018-1022</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="../ListFooter.jsp"%>
</body>
</html>
