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
    	String na;
    	String chr;
    	String[]colors = {"#FFC0CB","#DC143C","#FF1493","#C71585","#DA70D6","#DDA0DD","#4B0082","#9370DB","#0000FF","#1E90FF","#4682B4","#00FFFF","#008B8B","#3CB371",
 	    "#98FB98","#7FFF00","#556B2F","#FFD700","#FF8C00","#FA8072","#B22222","#800000","#A9A9A9","#FFFF00","#00FF00"};	
 	    String color = "";
 	    String[] color_name = {"unknown","5237","E28","Q1261","CHANG7-2","DAN340","HUANGC","HYS","HZS","TY4","ZI330","ZONG3","LX9801","XI502","81515","F349","H21","JI853",
 	    "JI53","LV28","YUANFH","SHUANG741","K12","NX110","ZONG31"};
 	    HashMap<String,ArrayList<String>> table_data = (HashMap<String,ArrayList<String>>)attributes.get("table");
    %>
    <title>Result</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<style type="text/css">
		table{		    
			border:1px solid #ddd;
			border-collapse: collapse;
			border-radius: 1px;
		}
		td, th{
			text-align: center;
			border:1px solid #ddd;
			padding:10px 5px;
		}
	</style>


  </head>
  
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="container">
    
    <%for(int i=0;i<25;i++){
    	color = colors[i];
    %>
     <div style="height:50px;width:85px;display:inline-block;">
     	<canvas id="<%=color %>" width="85" height="30" ></canvas>
     	<script>
     		var c = document.getElementById("<%=color %>");
    	  	var ctx=c.getContext("2d");
    	  	ctx.fillStyle = "<%= color%>";
    	  	ctx.fillRect(0,10,85,10);
    	  	ctx.stroke();
     	</script>
     	<span style="width:85px;text-align:center;display:inline-block; float:left ;font-size:10px; "><%=color_name[i] %></span>
     </div>
    <%} %> 
   
         
    <% if(theChr.length == 1){
       		for(int i=0;i<theName.length;i++){
    	    	na = theName[i];
    	    	ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(na);
    	    	ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    	    	ArrayList<Integer> sta_all = (ArrayList<Integer>)my.get(1);
    	    	ArrayList<Integer> end_all = (ArrayList<Integer>)my.get(2);
    %>
    <div style="height:50px;">
    	<span style="width:72px;display:inline-block;font-size: 15px; color: black;">
    	    <%= na%>:
    	    <!-- <span></span> -->
    	</span>
    	<div style="width:1120px;height:50px;display:inline-block;vertical-align:middle;">
    	  	<canvas id="<%= na %>" width="1120" height="50" ></canvas>
    		<% for(int j=0;j<parent_all.size();j++){
    				color = colors[parent_all.get(j)];
    		%>
    		   <script type="text/javascript">
    	  			var c = document.getElementById("<%= na %>");
    	  			var ctx=c.getContext("2d");
    	  			var sta = <%=(Integer)sta_all.get(j)%>/270000;
    	  	        var end = <%=(Integer)end_all.get(j)%>/270000;
    	  			ctx.fillStyle = "<%= color%>";
    	  	        ctx.fillRect(sta,20,end-sta,10);
    	  	        ctx.stroke();
    			</script>
    		<%}%>
    	</div>
    </div>
    <%} 
    }else{
    	for(int i=0;i<theChr.length;i++){
    		chr = theChr[i];
    	    ArrayList<ArrayList<Integer>> my = (ArrayList<ArrayList<Integer>>)attributes.get(chr);
    	    ArrayList<Integer> parent_all = (ArrayList<Integer>)my.get(0);
    	    ArrayList<Integer> sta_all = (ArrayList<Integer>)my.get(1);
    	    ArrayList<Integer> end_all = (ArrayList<Integer>)my.get(2);
    %>
     <div style="height:50px;">
    	<span style="width:50px;display:inline-block;font-size: 15px; color: black;">Chr<%= chr %>:</span>
    	<div style="width:1150px;height:50px;display:inline-block;vertical-align:middle;">
    	  	<canvas id="<%= chr %>" width="1150" height="50" ></canvas>
    		<% for(int j=0;j<parent_all.size();j++){
    				color = colors[parent_all.get(j)];
    		%>
    		<script type="text/javascript">
    	  			var c = document.getElementById("<%= chr %>");
    	  			var ctx=c.getContext("2d");
    	  			var sta = <%=(Integer)sta_all.get(j)%>/270000;
    	  	        var end = <%=(Integer)end_all.get(j)%>/270000;
    	  			ctx.fillStyle = "<%= color%>";
    	  	        ctx.fillRect(sta,20,end-sta,10);
    	  	        ctx.stroke();
    			</script>
    		<%}%>
    	</div>
     </div>
    <%}
    
    }%>
    </div>
    
    <div class="container" style="overflow-X: scroll;margin-top:50px;margin-bottom:40px;    border-radius: 5px;">	
    <table>
      <thead>
    	<tr>
    		<th>name</th>
    		<th>count</th>
    		<th>min</th>
    		<th>mid</th>
    		<th>sizeAve</th>
    		<th>sizesd</th>
    		<th>covline</th>
    		<th>p0</th>
    		<th>p1</th>
    		<th>p2</th>
    		<th>p3</th>
    		<th>p4</th>
    		<th>p5</th>
    		<th>p6</th>
    		<th>p7</th>
    		<th>p8</th>
    		<th>p9</th>
    		<th>p10</th>
    		<th>p11</th>
    		<th>p12</th>
    		<th>p13</th>
    		<th>p14</th>
    		<th>p15</th>
    		<th>p16</th>
    		<th>p17</th>
    		<th>p18</th>
    		<th>p19</th>
    		<th>p20</th>
    		<th>p21</th>
    		<th>p22</th>
    		<th>p23</th>
    		<th>p24</th>
    	</tr>
    	</thead>
    	
    	<tbody>
    	<%for(int i=0;i<theName.length;i++){
    		ArrayList<String> theLine = (ArrayList<String>)table_data.get(theName[i]);
    	%>
    		<tr>
    		    <td><%=theName[i] %></td>
    			<%for(int k=0;k<theLine.size();k++){%>
    				<td><%=theLine.get(k) %></td>
    			<%}%>
    	    </tr>
    	<%}%>
    	</tbody>
    </table>    
    </div>	
    		
    			
    	
    
    <%@ include file="../ListFooter.jsp"%>
  </body>
</html>
