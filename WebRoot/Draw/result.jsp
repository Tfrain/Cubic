<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <%
    	int sta;
    	int end;
    	Map<String,Object> attributes=ActionContext.getContext().getSession();
    	String [] theName = (String[])attributes.get("names");//获取填的第二列
    	String [] theChr = (String[])attributes.get("chrs");//获取第三列
    	String chrx=theChr[0];//每一个键的值都是二维数组
    	String nax = theName[0];
    	ArrayList<ArrayList<Integer>> myx;
    	if(theChr.length==1){//只有一个时
    	myx = (ArrayList<ArrayList<Integer>>)attributes.get(nax);//myx就是M开头的那个东西
    	}else{
    	myx = (ArrayList<ArrayList<Integer>>)attributes.get(chrx);}
    	ArrayList<Integer> parent_allx = (ArrayList<Integer>)myx.get(0);//第一个数组
    	
    	System.out.println(parent_allx);
    	
    	double sta1=(Double)attributes.get("sta1");//findData里面已经填进去了1
    	double end1=(Double)attributes.get("end1");
    	//二维len 存储多组数据
    	ArrayList<ArrayList<Double>> len=new ArrayList<ArrayList<Double>>();
    	String na;
    	String chr;
    	String[]colors = {"#ffc0cb","#dc143c","#ff1493","#c71585","#da70d6","#dda0dd","#4b0082","#9370db","#0000ff","#1e90ff","#4682b4","#00ffff","#008b8b","#3cb371",
 	    "#98fb98","#7fff00","#556b2f","#ffd700","#ff8c00","#fa8072","#b22222","#800000","#a9a9a9","#ffff00","#00ff00"};	
 	    String color = "";
 	    String[] color_name = {"unknown","5237","E28","Q1261","CHANG7-2","DAN340","HUANGC","HYS","HZS","TY4","ZI330","ZONG3","LX9801","XI502","81515","F349","H21","JI853",
 	    "JI53","LV28","YUANFH","SHUANG741","K12","NX110","ZONG31"};
 	    %><script>
 	    	var se=new Array();
 	    <%
 	    //获取<String,ArrayList<String>一组键值对
 	    HashMap<String,ArrayList<String>> table_data = (HashMap<String,ArrayList<String>>)attributes.get("table");
 	    if(theChr.length==1){
	 	    for(int i=0;i<theName.length;i++){
	 	    //把一堆M开头的收拾好，此时显示的是一堆M 的东西，反之，则是一堆Chr的东西
	    			na=theName[i];
	    			%>se[<%=i%>]=new Array();<%
	    			//my是na，na[i]里面parent,sta,end，是数据库里面的对应三个数组
	    			ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(na);
	    			ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
	    			ArrayList<Integer> sta_all=(ArrayList<Integer>)my.get(1);
	    			ArrayList<Integer> end_all=(ArrayList<Integer>)my.get(2);
					ArrayList<Double> lenr=new ArrayList<Double>();
					//涉及表格的显示，初步猜测涉及不同颜色块的不同大小
	    			for(int j=0;j<(parent_all.size());j++){
	    				sta=(Integer)sta_all.get(j);//如980，1273514
	    				double stad=sta;
	    				end=(Integer)end_all.get(j);//如1273504，2735973
	    				%>
	    				se[<%=i%>][<%=j%>]={sta:<%=sta%>,end:<%=end%>};
	    				<%
	    				double endd=end;
	    				if(stad<sta1){
	    					stad=sta1;//基本上是1
	    				}
	    				if(endd>end1){
	    					endd=end1;//301354135
	    				}
	    				if(j==0){
	    					lenr.add(0,stad);
	    					lenr.add(1,endd-stad);
	    				}else{
	    					lenr.add(2*j,stad-(Integer)end_all.get(j-1));//长度紧贴,要差值
	    					lenr.add(2*j+1,endd-stad);
	    					}
	    				len.add(i,lenr);//转移到二维的那个，类似第一个M{0,{980,1273504,-10，...}}
	    		}
	    	}
    	}else{
    		for(int i=0;i<theChr.length;i++){
    			chr=theChr[i];
    			%>se[<%=i%>]=new Array();<%
    			ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(chr);
	    		ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
	    		ArrayList<Integer> sta_all=(ArrayList<Integer>)my.get(1);
	    		ArrayList<Integer> end_all=(ArrayList<Integer>)my.get(2);
				ArrayList<Double> lenr=new ArrayList<Double>();
				for(int j=0;j<(parent_all.size());j++){
	    				sta=(Integer)sta_all.get(j);
	    				double stad=sta;
	    				end=(Integer)end_all.get(j);
	    				double endd=end;
	    				%>
	    				se[<%=i%>][<%=j%>]={sta:<%=sta%>,end:<%=end%>};
	    				<%
	    				if(stad<sta1){
	    					stad=sta1;
	    				}
	    				if(endd>end1){
	    					endd=end1;
	    				}
	    				if(j==0){
	    					lenr.add(0,stad);
	    					lenr.add(1,endd-stad);
	    				}else{
	    					lenr.add(2*j,stad-(Integer)end_all.get(j-1));
	    					lenr.add(2*j+1,endd-stad);
	    					}
	    				len.add(i,lenr);	
    			}
    		}
    	}
    %>
    </script>
  </head>
    <title>Result</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="Css/bootstrap-table.css"/>   
    <link href="Css/main.css" rel="stylesheet"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="Jscript/tableExport.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table-export.js"></script>
    <script type="text/javascript" src="https://code.highcharts.com/highcharts.js"></script>
	<style type="text/css">
	/*如果溢出框，则应该提供滚动机制。!important 提高优先级*/
.fixed-table-body{overflow-x:auto;overflow-y:auto;height:auto !important;}
	tr,td,th{
	border:0px solid transparent !important;
	}
	.pagination a:hover{
	/*渐进色*/
	background: linear-gradient(to bottom, #fff 0%, #dcdcdc 100%);border:1px solid #979797 !important;
	}
	.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus
	 {
    z-index: 2;
    color: #fff;
    cursor: default;
    background: linear-gradient(to bottom, #585858 0%, #111 100%);
    border-color: #428bca;
    }
    //选择器
    .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 10px;
    line-height: 2.42857143;
    vertical-align: top;
    border-top: 1px solid #ddd;
     }
     .btn{
     line-height:0.4;
     }

	</style>


  </head>
  
  <body>
     	<p style="display:none;Z-index:1;position:absolute;border-style:solid;border-width:thin;Z-index:1;background-color:white;margin:0;margin-left:1%;margin-top:1%" id="in"></p>
    <%@ include file="../ListHeader.jsp"%>
    <div class="container" style="width:95%">
        <%if((theChr.length!=1&&parent_allx.size()!=0)||(theChr.length==1)){%>
    
    <div class="describe">
               <h3>Bin Map</h3>
               <br/>
               <h4>The Visualisation of mosaic haplotypes for progenies in synthetic population, reflecting a high-resolution reshuffle across 24 founders genomes.</h4>
        </div>
        <br/>
        <br/>
        
        
    <div class="content" style="width:100%;min-width:1150px;border:1px solid #ddd;border-collapse:collapse;border-radius:1px;display:inline-block;margin:0 auto">
    	//实例中 id 为 container 的 div 用于包含 Highcharts 绘制的图表。
    	<div id="container" style="width: 95%; margin: 0 auto"></div>
    </div>
    
    
    <div class="content" style="width:100%;min-width:1150px;height:160px;border:1px solid #ddd;border-collapse:collapse;border-radius:1px;display:inline-block;margin:0 auto">
    <%for(int i=0;i<25;i++){
    	color = colors[i];
    %>
     <div  style="height:40px;width:95px;display:inline-block;text-align:center;">
     	<canvas id="<%=color %>" width="55" height="40" ></canvas>
     	<script>
     		var c = document.getElementById("<%=color %>");
    	  	var ctx=c.getContext("2d");
    	  	ctx.fillStyle = "<%=color%>";
    	  	ctx.fillRect(0,20,40,10);
    	  	ctx.stroke();
     	</script>
     	<span style="width:80px;height:10px;text-align:center;display:inline-block; float:left ;font-size:10px; "><%=color_name[i] %></span>
     </div>
    <%} %> 
    </div>
    
    
    <div class="content" style="width:100%;min-width:1150px;border:1px solid #ddd;border-collapse:collapse;border-radius:1px;display:inline-block;margin:0 auto"">	
    <table id="table" data-toggle="table">
      <thead>
    	</thead>
    	
    	<tbody>
    	<%for(int i=0;i<theName.length;i++){
    		ArrayList<String> theLine = (ArrayList<String>)table_data.get(theName[i]);
    	%>
    		<tr>
    		    <td><span style="font-size: 10pt;"><%=theName[i] %></span></td>
    			<%for(int k=0;k<theLine.size();k++){%>
    				<td><span style="font-size: 10pt;"><%=theLine.get(k) %></span></td>
    			<%}%>
    	    </tr>
    	<%}%>
    	</tbody>
    </table>    
    </div>	
   </div>
   /*以上是主干*/
   <%}else{%>
    <div class="content" style="margin:10%"><b  style="margin:40%;font-size:20px;width:30%;color:red !important; ">No matching data!</b></div>
    <%} %>    
<script language="JavaScript">
	var p=new Array();
	var c=new Array();
	var par=new Array();
	var colors = new Array("#ffc0cb","#dc143c","#ff1493","#c71585","#da70d6","#dda0dd","#4b0082","#9370db","#0000ff","#1e90ff","#4682b4","#00ffff","#008b8b","#3cb371","#98fb98","#7fff00","#556b2f","#ffd700","#ff8c00","#fa8072","#b22222","#800000","#a9a9a9","#ffff00","#00ff00","#ffffff");	
 	var color_n = new Array("unknown","5237","E28","Q1261","CHANG7-2","DAN340","HUANGC","HYS","HZS","TY4","ZI330","ZONG3","LX9801","XI502","81515","F349","H21","JI853","JI53","LV28","YUANFH","SHUANG741","K12","NX110","ZONG31","Missing");
	<%if(theChr.length==1){%>
		for(var i=0;i<<%=theName.length%>;i++){
			p[i]=new Array();
			par[i]=new Array();
		}
		<%for(int i=0;i<theName.length;i++){
			na=theName[i];
		%>
			c[<%=i%>]='<%=theName[i]%>';
			<%
    		ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(na);
    		ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    		for(int j=0;j<parent_all.size();j++){
    			%>par[<%=i%>][<%=j%>]=<%=parent_all.get(j)%>;<%
    		}
    		for(int j=0;j<((parent_all.size())*2);j++){
    		%>
    			p[<%=i%>][<%=j%>]=<%=len.get(i).get(j)%>;
    			<%
    		}
		}
	}
	else{
	%>
		for(var i=0;i<<%=theChr.length%>;i++){
			p[i]=new Array();
			par[i]=new Array();
		}
		<%for(int i=0;i<theChr.length;i++){
			chr=theChr[i];
		%>
			c[<%=i%>]='<%=theChr[i]%>';
			<%	
			ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(chr);
    		ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    		%>
    		c[<%=i%>]='Chr '+c[<%=i%>];
    		<%
    		for(int j=0;j<parent_all.size();j++){
    			%>par[<%=i%>][<%=j%>]=<%=parent_all.get(j)%>;<%
    		}
			for(int j=0;j<(parent_all.size()*2);j++){//上面是2倍
			%>
					p[<%=i%>][<%=j%>]=<%=len.get(i).get(j)%>;
    			<%
    		}
		}
	}
	%>
	var maxlen=0;//p[i].length指的是M中，首尾数组的长度
	for(var i=0;i<c.length;i++){
		if(p[i].length>maxlen){maxlen=p[i].length;}
	}
	var pp=new Array();
	for(var i=0;i<maxlen;i++){
		pp[i]=new Array();
		for(var j=0;j<c.length;j++){//j是M的个数
			if(p[j][i]==undefined){pp[i][j]={color:'#ffffff',y:0};}
			else{
				if(i%2==0)
				pp[i][j]={color:'#ffffff',y:p[j][i]};//猜测表格的缝隙
				else
				pp[i][j]={color:colors[((i-1)/2)%25],y:p[j][i]};//其实就是按顺序给颜色
				}
				
		}
	}
$(document).ready(function() {  //防止文档在完全加载（就绪）之前运行
   var chart = {
      type: 'bar'//条形
   };
   var title = {
      text: ''   
   };
   var color=new Array(maxlen);//即用到最多的颜色
   var xAxis = {
      categories: c,//非M即chr
      
   };
   var yAxis = {
      min: 0,
      title: {
         text: '',
         align: 'high'
      },
      labels: {
         overflow: 'justify'
      },
      reversedStacks: false
   };
   var tooltip = {
      formatter:function(){
      if(this.colorIndex%2!=0)
      	return '<b>parent: '+color_n[((this.colorIndex-1)/2)%25]+'</b><br/><span>sta: '+se[this.point.index][(this.colorIndex-1)/2].sta+'<br/>end: '+se[this.point.index][(this.colorIndex-1)/2].end+'</span>';
      	else
      	return null;
      },
   };
   var plotOptions = {
	  series: {
	     stacking: 'normal'//使其分色
	  }
   };
   
   var credits = {
      enabled: true
   };
   
   var series=new Array();
   for(var i=0;i<maxlen;i++){//假设为10组，则长度为10.M的个数和p[i][j]一致
   		series[i]={data:pp[i]};
   };
   var legend = {
   	enabled:false
   }     
      
   var json = {};   
   json.chart = chart;
   json.title = title;  
   json.tooltip = tooltip;
   json.colors = color;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series=series;
   json.legend=legend;
   json.plotOptions = plotOptions;
   json.credits = credits;
   $('#container').highcharts(json);
});
</script>
       <%@ include file="../ListFooter.jsp"%>
  </body>

<script type="text/javascript">
    $(function(){
        $('#table').bootstrapTable({//'#table' 改为所用表的选择
        url: "localhost:8080/Magic/Draw/magic.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式
       	striped: true,                      //是否显示行间隔色
       	pagination: true，//显示分页
       	pageSize: 5,
       	search: true,
        showExport: true,  //是否显示导出按钮
        buttonsAlign:"left",//按钮位置
        exportTypes:['csv','excel'],//导出文件类型
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引 
          fileName: 'Bin Map',              //文件名称设置
          worksheetName: 'Sheet1',          //表格工作区名
          tableName: 'Bin Map',  
      }, 
        columns: [{//修改为所用表的信�?field填数据库中的 对应的标题，title为要显示的名
        field: 'name',
        title: 'name',
        sortable:true
    }, {
        field: 'count',
        title: 'count',
        sortable:true
    }, {
        field: 'min',
        title: 'min',
        sortable:true
    },{
        field: 'mid',
        title: 'mid',
        sortable:true
    },{
        field: 'sizeAve',
        title: 'sizeAve',
        sortable:true
    },{
        field: 'sizesd',
        title: 'sizesd',
        sortable:true    
    },{
        field: 'covline',
        title: 'covline',
        sortable:true    
    },{
        field: 'p0',
        title: 'p0',
        sortable:true    
    },{
        field: 'p1',
        title: 'p1',
        sortable:true    
    },{
        field: 'p2',
        title: 'p2',
        sortable:true    
    },{
        field: 'p3',
        title: 'p3',
        sortable:true    
    },{
        field: 'p4',
        title: 'p4',
        sortable:true    
    },{
        field: 'p5',
        title: 'p5',
        sortable:true    
    },{
        field: 'p6',
        title: 'p6',
        sortable:true    
    },{
        field: 'p7',
        title: 'p7',
        sortable:true    
    },{
        field: 'p8',
        title: 'p8',
        sortable:true    
    },{
        field: 'p9',
        title: 'p9',
        sortable:true    
    },{
        field: 'p10',
        title: 'p10',
        sortable:true    
    },{
        field: 'p11',
        title: 'p11',
        sortable:true    
    },{
        field: 'p12',
        title: 'p12',
        sortable:true    
    },{
        field: 'p13',
        title: 'p13',
        sortable:true    
    },{
        field: 'p14',
        title: 'p14',
        sortable:true    
    },{
        field: 'p15',
        title: 'p15',
        sortable:true    
    },{
        field: 'p16',
        title: 'p16',
        sortable:true    
    },{
        field: 'p17',
        title: 'p17',
        sortable:true    
    },{
        field: 'p18',
        title: 'p18',
        sortable:true    
    },{
        field: 'p19',
        title: 'p19',
        sortable:true    
    },{
        field: 'p20',
        title: 'p20',
        sortable:true    
    },{
        field: 'p21',
        title: 'p21',
        sortable:true    
    },{
        field: 'p22',
        title: 'p22',
        sortable:true    
    },{
        field: 'p23',
        title: 'p23',
        sortable:true    
    },{
        field: 'p24',
        title: 'p24',
        sortable:true    
    }], 
 		});
 		});
</script>

</html>
