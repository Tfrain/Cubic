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
    <div class="container" style="height:2300px">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="my-panel1" class="my-panel">
					<div class="title" style="width:100%;color:#4381be;">
						<h3 style="color:#4381be;">Phenotype Data</h3>
					</div>
					<p>All 1404 inbreds were planted in a completely randomized
						block design in 2014 at five locations (N43°42′, E125°18′, Yushu
						City, Jilin Provence; N42°03′, E123°33′, Shenyang City, Liaoning
						Provence; N40°10′, E116°21′, Changping District, Beijing City;
						N38°39′, E115°51, Baoding City, Hebei Provence; N35°27′, E114°01′,
						Xinxiang City, Henan Provence) of Northern China, where the 24
						elite founders that served as the parents of the population are
						the most adapted. About 16 individual plants were planted for each
						line, and the line Chang7-2 was planted after every 50th entry.</p>
				</div>
				</div>
                <div class="col-md-10 col-md-offset-1">
				<image src="images\china_map.png" style="width:100%"></image>
                </div>
                <div class="col-md-12">
				<div id="my-panel2" class="my-panel">
					<p style="margin-top:20px;">
						The population was planted in five different provinces in the
						summer of 2014, as shown in the map and 23 traits were
						investigated. Phenotype data in 5 locations
						respectivelyDownload Blup phenotype dataDownload
					</p>
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
<div style="margin-top:10px;">
                <table>
                    <tr>
                        <table style="width:100%">
                            <col width="11%"></col>
                            <col width="23%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
							<tr>
								<td><b>Abbreviation</b></td>
								<td><b>Class</b></td>
								<td><b>Max</b></td>
								<td><b>Min</b></td>
								<td><b>Mean</b></td>
								<td><b>Sd</b></td>
								<td><b>Cv</b></td>
								<td><b>H2</b></td>
							</tr>
                        </table>
                    </tr>
                    <tr>
				<div
					style="width:100%;height:480px;position:relative;overflow-y:scroll">
					<table style="width:100%;">
                            <col width="11%"></col>
                            <col width="23%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
                            <col width="11%"></col>
							<tr>
								<td>DTA</td>
								<td>flowering time</td>
								<td>80.38</td>
								<td>63.54</td>
								<td>70.65</td>
								<td>2.21</td>
								<td>3.13</td>
								<td>0.86</td>
							</tr>
							<tr>
								<td>DTS</td>
								<td>flowering time</td>
								<td>81.66</td>
								<td>67.03</td>
								<td>73.39</td>
								<td>2.37</td>
								<td>3.23</td>
								<td>0.86</td>
							</tr>
							<tr>
								<td>DTT</td>
								<td>flowering time</td>
								<td>78.71</td>
								<td>59.22</td>
								<td>67.43</td>
								<td>2.65</td>
								<td>3.94</td>
								<td>0.87</td>
							</tr>
							<tr>
								<td>EH</td>
								<td>Agronomic trait</td>
								<td>131.20</td>
								<td>48.59</td>
								<td>83.74</td>
								<td>12.97</td>
								<td>15.49</td>
								<td>0.91</td>
							</tr>
							<tr>
								<td>ELL</td>
								<td>Agronomic trait</td>
								<td>98.88</td>
								<td>60.75</td>
								<td>78.35</td>
								<td>6.07</td>
								<td>7.75</td>
								<td>0.88</td>
							</tr>
							<tr>
								<td>ELW</td>
								<td>Agronomic trait</td>
								<td>12.38</td>
								<td>6.50</td>
								<td>9.21</td>
								<td>0.84</td>
								<td>9.08</td>
								<td>0.87</td>
							</tr>
							<tr>
								<td>LNAE</td>
								<td>Agronomic trait</td>
								<td>8.37</td>
								<td>4.88</td>
								<td>6.48</td>
								<td>0.53</td>
								<td>8.22</td>
								<td>0.83</td>
							</tr>
							<tr>
								<td>LNBE</td>
								<td>Agronomic trait</td>
								<td>10.88</td>
								<td>5.44</td>
								<td>7.65</td>
								<td>0.72</td>
								<td>9.41</td>
								<td>0.85</td>
							</tr>
							<tr>
								<td>PH</td>
								<td>Agronomic trait</td>
								<td>283.25</td>
								<td>139.10</td>
								<td>210.86</td>
								<td>20.11</td>
								<td>9.53</td>
								<td>0.92</td>
							</tr>
							<tr>
								<td>TBN</td>
								<td>Agronomic trait</td>
								<td>29.00</td>
								<td>4.47</td>
								<td>12.07</td>
								<td>3.42</td>
								<td>28.31</td>
								<td>0.91</td>
							</tr>
							<tr>
								<td>TL</td>
								<td>Agronomic trait</td>
								<td>47.56</td>
								<td>20.30</td>
								<td>33.14</td>
								<td>4.14</td>
								<td>12.49</td>
								<td>0.93</td>
							</tr>
							<tr>
								<td>CW</td>
								<td>yield trait</td>
								<td>38.77</td>
								<td>9.74</td>
								<td>19.54</td>
								<td>4.16</td>
								<td>21.30</td>
								<td>0.81</td>
							</tr>
							<tr>
								<td>ED</td>
								<td>yield trait</td>
								<td>5.00</td>
								<td>3.14</td>
								<td>4.16</td>
								<td>0.25</td>
								<td>6.02</td>
								<td>0.75</td>
							</tr>
							<tr>
								<td>EL</td>
								<td>yield trait</td>
								<td>19.05</td>
								<td>8.76</td>
								<td>13.38</td>
								<td>1.41</td>
								<td>10.54</td>
								<td>0.84</td>
							</tr>
							<tr>
								<td>ERN</td>
								<td>yield trait</td>
								<td>21.14</td>
								<td>9.87</td>
								<td>14.22</td>
								<td>1.45</td>
								<td>10.21</td>
								<td>0.85</td>
							</tr>
							<tr>
								<td>EW</td>
								<td>yield trait</td>
								<td>171.62</td>
								<td>41.62</td>
								<td>91.25</td>
								<td>15.84</td>
								<td>17.36</td>
								<td>0.77</td>
							</tr>
							<tr>
								<td>KNPR</td>
								<td>yield trait</td>
								<td>30.60</td>
								<td>12.96</td>
								<td>21.17</td>
								<td>3.05</td>
								<td>14.41</td>
								<td>0.80</td>
							</tr>
							<tr>
								<td>KWPE</td>
								<td>yield trait</td>
								<td>100.99</td>
								<td>40.93</td>
								<td>71.83</td>
								<td>10.88</td>
								<td>15.14</td>
								<td>0.74</td>
							</tr>
							<tr>
								<td>LBT</td>
								<td>yield trait</td>
								<td>2.77</td>
								<td>0.32</td>
								<td>1.20</td>
								<td>0.43</td>
								<td>36.10</td>
								<td>0.73</td>
							</tr>
							<tr>
								<td>KNPE</td>
								<td>yield trait</td>
								<td>529.13</td>
								<td>153.11</td>
								<td>304.94</td>
								<td>54.94</td>
								<td>18.02</td>
								<td>0.80</td>
							</tr>
					</table>
                </div>
                    </tr>
                </table>
</div>
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
