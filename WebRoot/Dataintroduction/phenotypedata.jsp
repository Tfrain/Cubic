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

<title>Phenotype Data</title>
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
    <div class="container" style="height:2050px">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="my-panel1" class="my-panel">
				
					<div class="title" style="width:100%;color:#4381be;">
						<h3 style="color:#4381be;">Phenotype data generation</h3>
					</div>
					<p>&nbsp;&nbsp;&nbsp;&nbsp; The phenotype data was collected from “An atlas of genetic architecture promises
				 directed maize improvement”. Here is only extracting and summarizing the data 
				 generation and analysis part, which is convenient for users to quickly apply.</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp; The 1404 inbreds were planted in a completely randomized block design 
					in 2014 at five locations (N43°42′, E125°18′, Yushu City, Jilin Provence; 
					N42°03′, E123°33′, Shenyang City, Liaoning Provence; N40°10′, E116°21′, 
					Changping District, Beijing City; N38°39′, E115°51, Baoding City, Hebei 
					Provence; N35°27′, E114°01′, Xinxiang City, Henan Provence) of Northern 
					China, where the 24 elite founders that served as the parents of the 
					population are the most adapted. About 16 individual plants were planted 
					for each line, and the line Chang7-2 was planted after every 50th entry.</p>
				</div>
				</div>
                <div class="col-md-10 col-md-offset-1">
				<image src="images\china_map.png" style="width:100%"></image>
                </div>
                <div class="col-md-12">
				<div id="my-panel2" class="my-panel">
					<p style="margin-top:20px;">
						&nbsp;&nbsp;&nbsp;&nbsp; Twenty-three phenotypes were measured at each location, including: 
6 flowering times: Days To Tasseling (DTT, measured as the interval from sowing to the day the tassel appeared in half of the individuals per line), Days To Anthesis (DTA, measured as the interval from sowing to the day of pollen shed for half of the individuals), Days To Silking (DTS, measured as the interval from sowing to the day silks emerged for half the individuals), and the intervals between them: ATI, interval between Anthesis and Tasseling; STI, interval between Silking and Tasseling; SAI, interval between Silking and Anthesis. 
8 developmentally agronomic traits: Plant Height (PH, vertical height from ground to the top of tassel, with an accuracy of 0.5cm), Ear Height (EH, vertical height from ground to the node where the top ear arises), Ear Leaf Length (ELL, straight length of first ear leaf), Ear Leaf Width (ELW, width of ear leaf measured at the widest point), Leaf Number Above Ear (LNAE, leaf or node number from ear leaf to top; counted including ear leaf), Leaf Number Below Ear (LNBE, leaf or node number below ear leaf; not including ear leaf), Tassel Branch Number (TBN, only the primary tassels are considered), Tassel Length (TL, straight length of the main branch).
 9 ear traits: Ear Weight (EW), Ear Diameter (ED), Ear Length (EL), Ear Row Number (ERN), Kernel Number Per Row (KNPR), Kernel Number Per Ear (KNPE), Kernel weight Per Ear (KWPE), Cob Weight (CW) and Length of Barren Tip (LBT). For flowering times, all individuals in a line are considered, while only 5 serial individuals at the middle of each line were measured and the average value is used for developmentally agronomic traits. For measuring ear traits, five approximately equidimensional ears were selected to represent each line.
The best linear unbiased predictor (BLUP) values for each line were used to reduce environmental noise in the phenotypic data.
					</p>
                   <a href="http://www.maizego.org/download/Agronomic_23Traits.txt" target="_blank" style="text-indent:2em; color: #fc8e00">[Downloading BLUP penotypes for 23 agronomic traits] 
   				</a>
				</div>
				</div>
			</div>

			<div class="my-panel">
                <div class="my-panel" style="margin-top:10px;">
				<table style="width:100%;">
					<thead></thead>
					<tbody>
						<tr>
							<td><b>缩略词</b></td>
							<td><b>英文全称</b></td>
							<td><b>中文名称</b></td>
						</tr>
						<tr>
							<td>Abbreviation</td>
							<td>Full name</td>
							<td>Chinese meaning</td>
						</tr>
						<tr>
							<td>CW</td>
							<td>Cob weight</td>
							<td>轴重</td>
						</tr>
						<tr>
							<td>DTA</td>
							<td>Date to anthesis</td>
							<td>散粉期</td>
						</tr>
						<tr>
							<td>DTS</td>
							<td>Date to silking</td>
							<td>吐丝期</td>
						</tr>
						<tr>
							<td>DTT</td>
							<td>Date to tasseling</td>
							<td>抽雄期</td>
						</tr>
						<tr>
							<td>ED</td>
							<td>Ear diameter</td>
							<td>穗粗</td>
						</tr>
						<tr>
							<td>EH</td>
							<td>Ear height</td>
							<td>穗位高</td>
						</tr>
						<tr>
							<td>EL</td>
							<td>Ear length</td>
							<td>穗长</td>
						</tr>
						<tr>
							<td>ELL</td>
							<td>Ear leaf length</td>
							<td>穗位叶长</td>
						</tr>
						<tr>
							<td>ELW</td>
							<td>Ear leaf width</td>
							<td>穗位叶宽</td>
						</tr>
						<tr>
							<td>ERN</td>
							<td>Ear row number</td>
							<td>穗行数</td>
						</tr>
						<tr>
							<td>EW</td>
							<td>Ear weight</td>
							<td>穗重</td>
						</tr>
						<tr>
							<td>KNPE</td>
							<td>Kernel number per ear</td>
							<td>穗粒数</td>
						</tr>
						<tr>
							<td>KNPR</td>
							<td>Kernel number per row</td>
							<td>行粒数</td>
						</tr>
						<tr>
							<td>KWPE</td>
							<td>Kernel weight per ear</td>
							<td>穗粒重</td>
						</tr>
						<tr>
							<td>LBT</td>
							<td>Length of barren tip</td>
							<td>秃尖长</td>
						</tr>
						<tr>
							<td>LNAE</td>
							<td>Leaf number above ear</td>
							<td>穗上茎节数</td>
						</tr>
						<tr>
							<td>LNBE</td>
							<td>Leaf number below ear</td>
							<td>穗下茎节数</td>
						</tr>
						<tr>
							<td>PH</td>
							<td>Plant height</td>
							<td>株高</td>
						</tr>
						<tr>
							<td>TBN</td>
							<td>Tassel branch number</td>
							<td>雄穗分枝数</td>
						</tr>
						<tr>
							<td>TL</td>
							<td>Tassel length</td>
							<td>雄穗主轴长度</td>
						</tr>
						<tr>
							<td>ATI</td>
							<td>anthesis and tasseling interval</td>
							<td>抽雄和散粉的间距</td>
						</tr>
						<tr>
							<td>STI</td>
							<td>silking and tasseling interval</td>
							<td>吐丝和抽雄的间距</td>
						</tr>
						<tr>
							<td>SAI</td>
							<td>silking and anthesis interval</td>
							<td>吐丝和散粉的间距</td>
						</tr>
					</tbody>
				</table>
                </div>
			</div>
			<div class="my-panel">
<style>
table, table tr th, table tr td {
    padding: 8px;
}

table td{
    width: 12%
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

::-webkit-scrollbar{
    display:none;
}
</style>
				</div>
			</div>
		</div>
	</div>
    </div>

	<%--<div style="width:100% height:300px">
	</div>

	<div class="row"
		style="width:40%;height:700px;float:right;margin-bottom:50px;overflow-y:scroll;position:relative;right:10%;">
	</div>
	<div style="height:50px;"></div>--%>
	<%@ include file="../ListFooter.jsp"%>
</body>
<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	option = {
		tooltip : {
			trigger : 'item',
			formatter : '{b}'
		},
		dataRange : {
			x : 'left',
			y : 'bottom',
			splitList : [
				{
					start : 1,
					end : 1,
					label : 'Beijing',
					color : 'red'
				},
				{
					start : 2,
					end : 2,
					label : 'Heibei',
					color : '#00FFFF'
				},
				{
					start : 3,
					end : 3,
					label : 'Henan',
					color : 'pink'
				},
				{
					start : 4,
					end : 4,
					label : 'Liaoning',
					color : 'blue'
				},
				{
					start : 5,
					end : 5,
					label : 'Jilin',
					color : 'purple'
				}
			]
		},
		series : [ {
			name : '中国',
			type : 'map',
			mapType : 'china',
			selectedMode : 'multiple',
			label : {
				normal : {
					show : true
				},
				emphasis : {
					show : true
				}
			},
			data : [
				{
					name : 'Henan',
					selected : false,
					value : 3
				},
				{
					name : 'Hebei',
					selected : false,
					value : 2
				},
				{
					name : 'Beijing',
					selected : false,
					value : 1
				},
				{
					name : 'Liaoning',
					selected : false,
					value : 4
				},
				{
					name : 'Jilin',
					selected : false,
					value : 5
				}
			]
		} ]
	};
	myChart.setOption(option);
	myChart.on('click', function(params) {
		var city = params.name;
		if (city == 'Henan' || city == 'Hebei' || city == 'Beijing' || city == 'Liaoning' || city == 'Jilin') {
			window.location.href = "tools.jsp";
		}
	});
</script>
</html>
