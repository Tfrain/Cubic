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
    	String [] theName = (String[])attributes.get("names");
    	String [] theChr = (String[])attributes.get("chrs");
    	String chrx=theChr[0];
    	String nax = theName[0];
    	ArrayList<ArrayList<Integer>> myx;
    	if(theChr.length==1){
    	myx = (ArrayList<ArrayList<Integer>>)attributes.get(nax);
    	}else{
    	myx = (ArrayList<ArrayList<Integer>>)attributes.get(chrx);}
    	ArrayList<Integer> parent_allx = (ArrayList<Integer>)myx.get(0);
    	
    	double sta1=(Double)attributes.get("sta1");
    	double end1=(Double)attributes.get("end1");
    	ArrayList<ArrayList<Double>> len=new ArrayList<ArrayList<Double>>();
    	String na;
    	String chr;
    	ArrayList<Integer> parent_allna;
    	ArrayList<Integer> parent_allchr;
    	
    	String[]colors = {"#ffc0cb","#dc143c","#ff1493","#c71585","#da70d6","#dda0dd","#4b0082","#9370db","#0000ff","#1e90ff","#4682b4","#00ffff","#008b8b","#3cb371",
 	    "#98fb98","#7fff00","#556b2f","#ffd700","#ff8c00","#fa8072","#b22222","#800000","#a9a9a9","#ffff00","#00ff00"};	
 	    String color = "";
 	    String[] color_name = {"unknown","5237","E28","Q1261","CHANG7-2","DAN340","HUANGC","HYS","HZS","TY4","ZI330","ZONG3","LX9801","XI502","81515","F349","H21","JI853",
 	    "JI53","LV28","YUANFH","SHUANG741","K12","NX110","ZONG31"};
 	    %><script>
 	    	var se=new Array();
 	    <%
 	    HashMap<String,ArrayList<String>> table_data = (HashMap<String,ArrayList<String>>)attributes.get("table");
 	    if(theChr.length==1){
	 	    for(int i=0;i<theName.length;i++){
	    			na=theName[i];
	    			%>se[<%=i%>]=new Array();<%
	    			ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(na);
	    			ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
	    			ArrayList<Integer> sta_all=(ArrayList<Integer>)my.get(1);
	    			ArrayList<Integer> end_all=(ArrayList<Integer>)my.get(2);
					ArrayList<Double> lenr=new ArrayList<Double>();
	    			for(int j=0;j<(parent_all.size());j++){
	    				sta=(Integer)sta_all.get(j);
	    				double stad=sta;
	    				end=(Integer)end_all.get(j);
	    				%>
	    				se[<%=i%>][<%=j%>]={sta:<%=sta%>,end:<%=end%>};
	    				<%
	    				double endd=end;
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
    	}else{
    		for(int i=0;i<theChr.length;i++){
    			chr=theChr[i];
    			%>se[<%=i%>]=new Array();<%
    			ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(chr);
	    		ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
	    		ArrayList<Integer> sta_all=(ArrayList<Integer>)my.get(1);
	    		ArrayList<Integer> end_all=(ArrayList<Integer>)my.get(2);
				ArrayList<Double> lenr=new ArrayList<Double>();
				//System.out.println(parent_all);//[0]
				
				//System.out.println(parent_all.size());//1
				for(int j=0;j<(parent_all.size());j++){
	    				sta=(Integer)sta_all.get(j);
	    				//System.out.println(sta);//1553
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
						try {
							len.add(i,lenr);
							//System.out.println(len);
	    					//System.out.println("----------");
						} catch (IndexOutOfBoundsException e) {
							parent_allx = parent_all;
							for (int k = 0; k <= i;k++) {
								len.add(k,lenr);
								//System.out.println(len);
							}
						}
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
.fixed-table-body{overflow-x:auto;overflow-y:auto;height:auto !important;}
	tr,td,th{
	border:0px solid transparent !important;
	}
	.pagination a:hover{
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
        <%/*if ((ArrayList<ArrayList<Integer>>)attributes.get(theName[0]).get(0).size() != 0) { */%> 
        <%if(parent_allx.size() != 0){ %>
    <div class="content" style="width:100%;min-width:1150px;border:1px solid #ddd;border-collapse:collapse;border-radius:1px;display:inline-block;margin:0 auto">
    	<div id="container" style="width: 95%; height:500px; margin: 0 auto"></div>
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
<%}else{%>
    <div class="content" style="margin:10%"><b  style="margin:40%;font-size:20px;width:30%;color:red !important; ">No matching data!</b></div>
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
   <%}else{%>
    <div class="content" style="margin:10%"><b  style="margin:40%;font-size:20px;width:30%;color:red !important; ">No matching data!</b></div>
    <%} %>   
     
<script language="JavaScript">
	var p=new Array();
	var c=new Array();
	var s=<%=sta1%>;
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
    		//System.out.println("______________");
    		//System.out.println(parent_all);
    		%>
    		c[<%=i%>]='Chr '+c[<%=i%>];
    		<%
    		for(int j=0;j<parent_all.size();j++){
    		//System.out.println("我运行了");
    			%>par[<%=i%>][<%=j%>]=<%=parent_all.get(j)%>;<%
    		}
			for(int j=0;j<(parent_all.size()*2);j++){
			%>
					p[<%=i%>][<%=j%>]=<%=len.get(i).get(j)%>;
    			<%
    		}
		}
	}
	%>
	if(c.length > 29) {
	document.getElementById("container").style.height=1000+'px';
	}
	
	var maxlen=0;
	for(var i=0;i<c.length;i++){
		if(p[i].length>maxlen){maxlen=p[i].length;}
	}
	var pp=new Array();
	for(var i=0;i<maxlen;i++){
		pp[i]=new Array();
		for(var j=0;j<c.length;j++){
			if(p[j][i]==undefined){pp[i][j]={color:'#ffffff',y:0};}
			else{
				if(i%2==0)
				pp[i][j]={color:'#ffffff',y:p[j][i]};
				else
				pp[i][j]={color:colors[((i-1)/2)%25],y:p[j][i]};
				}
				
		}
	}
$(document).ready(function() {  
   var chart = {
      type: 'bar'
   };
   var title = {
      text: ''   
   };
   var color=new Array(maxlen);
   var xAxis = {
      categories: c,
      
   };
   
   var yAxis = {
      min: s,
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
	     stacking: 'normal'
	  }
   };
   
   var credits = {
      enabled: true
   };
   
   var series=new Array();
   for(var i=0;i<maxlen;i++){
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
        $('#table').bootstrapTable({//'#table' 鏀逛负鎵€鐢ㄨ〃鐨勯€夋嫨鍣?
        url: "localhost:8080/Magic/Draw/magic.jsp",//鏀逛负褰撳墠缃戦〉鐨剈rl锛屽彲閫氳繃榧犳爣鍙冲嚮缃戦〉 鏌ョ湅淇℃伅鎵惧嚭
        method: 'GET',                      //璇锋眰鏂瑰紡锛?锛?
       	striped: true,                      //鏄惁鏄剧ず琛岄棿闅旇壊
       	pagination: true,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //蹇界暐鏌愪竴鍒楃殑绱㈠紩  
          fileName: 'Bin Map',              //鏂囦欢鍚嶇О璁剧疆  
          worksheetName: 'Sheet1',          //琛ㄦ牸宸ヤ綔鍖哄悕绉? 
          tableName: 'Bin Map',  
      }, 
        columns: [{//淇敼涓烘墍鐢ㄨ〃鐨勪俊鎭?field濉暟鎹簱涓殑 瀵瑰簲鐨勬爣棰橈紝title涓鸿鏄剧ず鐨勫悕绉?
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
