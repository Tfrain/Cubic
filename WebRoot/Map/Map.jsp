<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Map</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script  type="text/javascript" src="./js/jquery-jvectormap.js"></script>
    <script src="./js/jquery-jvectormap-cn-mill-en.js"></script> 
    <!-- <link href="css/map.css" rel="stylesheet" type="text/css"> -->
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/JavaScript" src="Jscript/echarts.js"></script>
	<script src="Jscript/china.js"></script>
	<style type="text/css">
		
		table{
			/* border:thin solid gray; */
			
		}
		caption{
			/* font-style:italic; */
			margin-left:200px;
		}
		td, th{
			border:thin solid gray;
			background-color:#c3dde0;
			/* margin:5px 5px 5px 5px; */
			padding:5px;
			border-color:white;
		}
	</style>
  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content" style="width:90%">
    	<div class="describe">
             <h3>表型调查</h3>
        </div>
    	<div id="main" style="height:600px;width:55%;display:inline-block;"></div>
    	<div id="myTable" style="height:600px;width:33%px;display:inline-block;margin-top:40px;">
    		<table>
    			<caption>
    				<h4>表型blup统计结果</h4>
    			</caption>
    			<tr>
    				<th>trait</th>
    				<th>chinese</th>
    				<th>abbreviation</th>
    				<th>CLASS</th>
    				<th>Max</th>
    				<th>Min</th>
    				<th>Mean</th>
    				<th>Sd</th>
    				<th>CV</th>
    				<th>H2</th>
    			</tr>
    			<tr>
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
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
    				<td>Date to anthesis</td>
    				<td>散丝期</td>
    				<td>DTA</td>
    				<td>flowering time</td>
    				<td>80.38</td>
    				<td>63.54</td>
    				<td>70.65</td>
    				<td>2.21</td>
    				<td>3.13</td>
    				<td>0.86</td>
    			</tr>
    		</table>
    	
    	</div>
	    <div style="height:800px;">
	    	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本群体于2014年夏分别种植在国内5个不同的省份，如图所示。为了确保田间试验的准确性，都采用随机区组方式：
	    	首先，1404份MAGIC子代采用随机排列的方式，MAGIC亲本分别置于群体首尾两部分，亲本内部随机区组，同时每隔50行种植一个对照材料“昌7-2”。为了避免边际效应的干扰，群体首尾各种2行保护行，并尽量避免与玉米杂交种靠近。
	    	5个环境采用相同的种植密度，均为4000株/亩，行长4米，株距0.65米，每行16株。密度设置得较低，是为了防止植物间的竞争导致的数据不准确。农艺实践与当地一致，并给予合适的灌溉和有利的生长条件。人工收获果穗，并在水分基本一致的情况下脱粒。
	    	</p>
	        &nbsp;
	        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本研究共调查了20个性状，分为3类，即开花期性状、农艺性状、产量性状，每类性状包含的性状如下：</p>
	   		<ul>
	   			<li style="margin-left:20px;">开花期3个：抽雄期、散粉期、吐丝期。</li>
	   			<li style="margin-left:20px;">农艺性状8个：株高、穗位高、穗上茎节数、穗下茎节数、穗位叶长、穗位叶宽、雄穗分枝数、雄穗主轴长。</li>
	   			<li style="margin-left:20px;">产量性状9个：雌穗穗长、雌穗穗粗、穗行数、行粒数、总粒数、穗重、轴重、穗粒重。</li>
	   		</ul>
	   		&nbsp;
	   		<p>各性状调查方法如下:</p>
	   		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在材料生长至开花期，调查整个群体的开花期，并于整个群体开花期结束后，调查农艺性状。待玉米晾干后，调查产量性状。每行调查5株，每个性状的调查参照国家普通玉米品种区试调查项目和标准，并进行适当调整。</p>
	    	<ul>
	   			<li style="margin-left:20px;">抽雄期（DTT）：每行材料一半以上的植株，雄穗尖端露出顶叶2cm的时间。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">散粉期（DTA）：每行材料一半以上的植株，雄穗主轴1/3开始散粉的时间。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">吐丝期（DTS）：每行材料一半以上的植株，雌穗花丝从苞叶露出2cm的时间。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">株高（PH）：植株主茎从地面到雄穗顶端的高度。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗位高（EH）：植株主茎从地面到最上部有效雌穗（由上而下第一穗）着生节的高度。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗上茎节数（LNAE）：穗位（由上而下第一穗）以上到旗叶的茎节数。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗下茎节数（LNBE）：穗位（由上而下第一穗）以下到地面的茎节数。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">雄穗一级分枝数（TBN）：雄穗主轴一级分枝的数目，包括未发育成熟的小穗节点。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">雄穗主轴长度（TL）：从雄穗主轴与茎的分界点到雄穗顶端的距离。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗位叶叶长（ELL）：从由上而下第一穗叶基部到顶部的长度。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗位叶叶宽（ELW）：从由上而下第一穗叶中部叶宽。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗长（EL）：测量从穗基部到顶端的长度。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">秃尖长（LBT）：从秃尖最低的位置到顶端的长度。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗粗（ED）：果穗中部直径。将测量的果穗头尾相间排列，测量果穗中部直径，求平均值。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗行数（ERN）：果穗中部的籽粒行数<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">行粒数（KNPR）：数中等长度的一行的籽粒数。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗粒数（KNPE）：一个果穗中所有的籽粒数，为二级性状，以穗行数乘行粒数。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗重（EW）：自然风干下果穗的重量。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">轴重（CW）：完全脱粒后轴的重量。<a href="#" style="color: red;">链接</a></li>
	   			<li style="margin-left:20px;">穗粒重（KWPE）：果穗中的籽粒净重，为二级性状，以穗重减去轴重。<a href="#" style="color: red;">链接</a></li>
	   		</ul>
	    </div>
    </div>
    <%@ include file="../ListFooter.jsp"%>
  </body>
  <script type="text/javascript">
	    	var myChart = echarts.init(document.getElementById('main'));
	    	option = {
				tooltip: {
					trigger: 'item',
					formatter: '{b}'
				},
				dataRange: {
        			x: 'left',
        			y: 'bottom',
        			splitList: [
            			{start:1, end:1, label: 'Beijing', color: 'red'},
            			{start:2, end:2, label: 'Heibei', color: '#00FF00'},
            			{start:3, end:3, label: 'Henan', color: 'pink'},
            			{start:4, end:4, label: 'Liaoning', color: 'blue'},
            			{start:5, end:5, label: 'Jilin', color: 'purple'}
        			]
    			},
				series: [{
					name: '中国',
					type: 'map',
					mapType: 'china',
					selectedMode : 'multiple',
					label: {
						normal: {
							show: true
						},
						emphasis: {
							show: true
						}
					},
                    data:[
						{name:'Henan',selected:false,value:3},
						{name:'Hebei',selected:false,value:2},
						{name:'Beijing',selected:false,value:1},
						{name:'Liaoning',selected:false,value:4},
						{name:'Jilin',selected:false,value:5}
		            ]					
				}]
			};
			myChart.setOption(option);
			myChart.on('click',function(params){
				var city = params.name;
				if(city == 'Henan' || city == 'Hebei' || city == 'Beijing' || city == 'Liaoning' || city == 'Jilin'){
					window.location.href="tools.jsp";
				}
			});
	</script>
</html>
