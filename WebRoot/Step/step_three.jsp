<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.io.*"%>
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
        Map<String,Object> attributes=ActionContext.getContext().getSession();
        String search = attributes.get("search").toString();
        int len = Integer.parseInt(attributes.get("len").toString());
        int len2 = Integer.parseInt(attributes.get("len2").toString());
        
        //字符串：数组（字符串）没看数据库，但逻辑关系len2里面存储着QTL的数据
        HashMap<String,ArrayList<String>> data = (HashMap<String,ArrayList<String>>)attributes.get("data");
        HashMap<String,ArrayList<String>> data2 = (HashMap<String,ArrayList<String>>)attributes.get("data2");   
    %>
    <title>Tool three</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    
    <link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="Css/bootstrap-table.css"/>
    <link type="text/css" rel="stylesheet" href="Css/main.css"/>
    <link type="text/css" rel="stylesheet" href="Css/tableexport.css"/>
    <script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="Jscript/tableExport.js"></script>
    <script type="text/javascript" src="Jscript/bootstrap-table-export.js"></script>
    
  </head>
  <style type="text/css">
	.fixed-table-body{overflow-x:auto;overflow-y:auto;height:auto;}
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

    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    th{
        background-color:white;
    }

  </style>
  <body>
    <%@ include file="../ListHeader.jsp"%>
    <div class="content" style="">
    	<div class="describe">
		<h3 style="color:black;">GWAS Result</h3>
			<br />
			<h4>Only significant locus plotted below</h4>
		</div> 
        <div class="col-md-12">
            <%String filePath = this.getClass().getResource("").getPath();%>
            <%filePath = filePath.substring(filePath.indexOf("/"), filePath.lastIndexOf("work"));%>
            <%filePath = filePath + "webapps/Magic/py_scripts/chrome.html";%>
            <%File chrome = new File(filePath);%>
            <%--<p><%=chrome.getAbsolutePath()%></p>--%>
            <%--<p><%=chrome.exists()%></p>--%>
            <%
            if(chrome.exists()){
            %>
            <jsp:include page="../py_scripts/chrome.html" flush="true"/>
            <%}else{%>
                   <b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
            <%}%>
        <%--
		   -</div>
           -	<h3>GWAS Search</h3>
           -    <br/>
           -    <p><font size="3">Three GWAS method including single-variant-based GWAS using mixed linear models, a new the haplotype-based mixed linear model method and allelic genetic heterogeneity GWAS was used for dissecting genetic mechanisms of over 20 agronomic and yield traits. You can search and  visualise the GWAS results in a number of ways.</font></p><!--定义了字体大小-->
           -    <p><font size="3">Search the significant SNPs (2.79x10-8) in GWAS results in a number of ways, including by trait, SNP identifier, study and gene.</font></p>
           -</div>
           --%>
<!--         <div class="steps">
            <image src="images/steps3.png" alt="steps1" width="600" height="50">
        </div> -->

        <div class="search">
            <br>
            <br>
            <%
                if(search.equals("first")){
            %>
            <div class="my-panel">
            <h3>QTL region</h3>
            
            <hr/>
            <%if(len2 > 0){%>
            <table id="table" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                    
                        <th>Trait</th>
                        <th>Method</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>SNP</th>
                        <th>SNP</th>
                        <th>SNP</th>
                        <th>SNP</th>
                    </tr>
           </thead> -->
           <tbody>
           <% 
              	    for(int i=1;i<=len2;i++){
            %>
            	<tr>
                    <td><%=data2.get(Integer.toString(i)).get(0)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(1)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(2)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(3)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(4)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(5)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(6)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(7)%></td>
                    <%--<td><%=data2.get(Integer.toString(i)).get(8)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(9)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(10)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(11)%></td>--%>
                </tr>	
           <%} %>
            </tbody>
           </table> 
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
            <div class="my-panel">
           <h3>Significant SNP</h3>
           <hr/>
            <%if(len > 0){%>
            <table id="table3" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                        <th>Trait</th>
                        <th>Method</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>SNP</th>
                    </tr>
           </thead> -->
                      <tbody>
           <% 
              	    for(int i=1;i<=len;i++){
            %>
            	<tr>
                    <td><%=data.get(Integer.toString(i)).get(0)%></td>
                    <td><%=data.get(Integer.toString(i)).get(1)%></td>
                    <td><%=data.get(Integer.toString(i)).get(2)%></td>
                    <td><%=data.get(Integer.toString(i)).get(3)%></td>
                    <td><%=data.get(Integer.toString(i)).get(4)%></td>
                    <%--<td><%=data.get(Integer.toString(i)).get(5)%></td>--%>
                </tr>	
           <%} %>
                       </tbody>
           </table>
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
            <div class="my-panel">
           <h3>Significant annotation</h3>
           <hr/>
            <%if(len > 0){%>
            <table id="table5" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                        <th>Chromesome</th>
                        <th>Position</th>
                        <th>Trait</th>
                        <th>SNP</th>
                        <th>Pvalue</th>
                    </tr>
           </thead> -->
           <tbody>
           <% 
              	    for(int i=1;i<=len;i++){
            %>
            	<tr>
                    <td><%=data.get(Integer.toString(i)).get(5)%></td>
                    <td><%=data.get(Integer.toString(i)).get(6)%></td>
                    <td><%=data.get(Integer.toString(i)).get(7)%></td>
                    <td><%=data.get(Integer.toString(i)).get(8)%></td>
                    <td><%=data.get(Integer.toString(i)).get(9)%></td>
                </tr>	
           <%} %>
                       </tbody>
           </table>
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
           <%}else{%>
           <!-- else是指填的是下面的Search By Gene ID，即非first，结果是相同的 -->
            <div class="my-panel">
           <h3>QTL region</h3>
           <hr/>
            <%if(len2 > 0){%>
            <table id="table2" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                        <th>Trait</th>
                        <th>Method</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>SNP</th>
                        <th>SNP</th>
                        <th>SNP</th>
                        <th>SNP</th>
                    </tr>
           </thead> -->
                      <tbody>
           <% 
              	    for(int i=1;i<=len2;i++){
            %>
            	<tr>
                    <td><%=data2.get(Integer.toString(i)).get(0)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(1)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(2)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(3)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(4)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(5)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(6)%></td>
                    <td><%=data2.get(Integer.toString(i)).get(7)%></td>
                    <%--<td><%=data2.get(Integer.toString(i)).get(8)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(9)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(10)%></td>--%>
                    <%--<td><%=data2.get(Integer.toString(i)).get(11)%></td>--%>
                </tr>	
           <%} %>
                       </tbody>
           </table>
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
            <div class="my-panel">
           <h3>Significant SNP</h3>
           <hr/>
            <%if(len > 0){%>
            <table id="table4" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                        <th>SNP</th>
                        <th>Allele</th>
                        <th>Gene</th>
                        <th>Transcript</th>
                        <th>Annotation</th>                      
                    </tr>
           </thead> -->
           <tbody>
           <% 
              	    for(int i=1;i<=len;i++){
            %>
            
            	<tr>
                    <td><%=data.get(Integer.toString(i)).get(0)%></td>
                    <td><%=data.get(Integer.toString(i)).get(1)%></td>
                    <td><%=data.get(Integer.toString(i)).get(2)%></td>
                    <td><%=data.get(Integer.toString(i)).get(3)%></td>
                    <td><%=data.get(Integer.toString(i)).get(4)%></td>
                    <%--<td><%=data.get(Integer.toString(i)).get(5)%></td>            --%>
                </tr>	
            
            <%} %>
            </tbody>
           </table>     
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
            <div class="my-panel">
           <h3>Significant annotation</h3>
           <hr/>
            <%if(len > 0){%>
           <table id="table6" data-toggle="table" class="table table-hover">
<!--             <thead>
                    <tr>
                        <th>Chromesome</th>
                        <th>Position</th>
                        <th>Trait</th>
                        <th>SNP</th>
                        <th>Pvalue</th>
                    </tr>
           </thead> -->
           <tbody>
           <% 
              	    for(int i=1;i<=len;i++){
            %>
           
            	<tr>
                    <td><%=data.get(Integer.toString(i)).get(5)%></td>
                    <td><%=data.get(Integer.toString(i)).get(6)%></td>
                    <td><%=data.get(Integer.toString(i)).get(7)%></td>
                    <td><%=data.get(Integer.toString(i)).get(8)%></td>
                    <td><%=data.get(Integer.toString(i)).get(9)%></td>
                </tr>	
            
           <%} %>
           </tbody>
           </table>
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
           <%}%>
            </div>
<!--             <div class="btns">
                <br>
                <br>
                <br>
                <br>
                <br>
                <button class="btn" style="height: 48px; width: 150px; ">DOWNLOAD</button>
            </div> -->
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
        </div>
        </div>
        <%@ include file="../ListFooter.jsp"%>
  </body>
 <script type="text/javascript">

    $(function(){
        $('#table').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'QTL region',              //文件名称设置  
          worksheetName: 'gwas2',          //表格工作区名称  
          tableName: 'QTL region',  
      },
        columns: [{//修改为所用表的信息 field填数据库中的 对应的标题，title为要显示的名称
        field: 'Trait',
        title: 'Trait',
        sortable:true
    }, {
        field: 'Peak bin',
        title: 'Peak bin',
        sortable:true
    }, {
        field: 'Chr',
        title: 'Chr',
        sortable:true
    },{
        field: 'Start',
        title: 'Start',
        sortable:true
    },{
        field: 'End',
        title: 'End',
        sortable:true
    },{
        field: 'LRT',
        title: 'LRT',
        sortable:true    
    },{
        field: 'PVE(%)',
        title: 'PVE(%)',
        sortable:true    
    },{
        field: 'Interval',
        title: 'Interval',
        sortable:true    
    }
         /*,{
        field: 'Gene_counts',
        title: 'Gene_counts',
        sortable:true    
    },{
        field: 'Type',
        title: 'Type',
        sortable:true    
    },{
        field: 'Genes',
        title: 'Genes',
        sortable:true    
    },{
        field: 'method',
        title: 'method',
        sortable:true    
    }*/
    ],   
 		});
 		});
</script>
 <script type="text/javascript">
    $(function(){
        $('#table2').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'QTL region',              //文件名称设置  
          worksheetName: 'gwas2',          //表格工作区名称  
          tableName: 'QTL region',  
      },
        columns: [{//修改为所用表的信息 field填数据库中的 对应的标题，title为要显示的名称
        field: 'Trait',
        title: 'Trait',
        sortable:true
    }, {
        field: 'Peak bin',
        title: 'Peak bin',
        sortable:true
    }, {
        field: 'Chr',
        title: 'Chr',
        sortable:true
    },{
        field: 'Start',
        title: 'Start',
        sortable:true
    },{
        field: 'End',
        title: 'End',
        sortable:true
    },,{
        field: 'LRT',
        title: 'LRT',
        sortable:true    
    },{
        field: 'PVE(%)',
        title: 'PVE(%)',
        sortable:true    
    },{
        field: 'Interval',
        title: 'Interval',
        sortable:true    
    }
            /*,{
        field: 'Gene_counts',
        title: 'Gene_counts',
        sortable:true    
    },{
        field: 'Type',
        title: 'Type',
        sortable:true    
    },{
        field: 'Genes',
        title: 'Genes',
        sortable:true    
    },{
        field: 'method',
        title: 'method',
        sortable:true    
    }*/
    ],   
 		});
 		});
</script>
<script type="text/javascript">
    $(function(){
        $('#table3').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'Significant SNP',              //文件名称设置  
          worksheetName: '111',          //表格工作区名称  
          tableName: 'Significant SNP',  
      },
        columns: [ {
        field: 'Trait',
        title: 'Trait',
        sortable:true
    },{
        field: 'Marker',
        title: 'Marker',
        sortable:true
    },{
        field: 'Locus',
        title: 'Locus',
        sortable:true
    },{
        field: 'Site',
        title: 'Site',
        sortable:true
    },{
        field: 'p',
        title: 'p',
        sortable:true
    }/*,{
        field: 'markerR2',
        title: 'markerR2',
        sortable:true    
    }*/
    ],   
 		});
 		});
</script>
<script type="text/javascript">
    $(function(){
        $('#table4').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'Significant SNP',              //文件名称设置  
          worksheetName: '111',          //表格工作区名称  
          tableName: 'Significant SNP',  
      },
        columns: [ {
        field: 'Trait',
        title: 'Trait',
        sortable:true
    },{
        field: 'Marker',
        title: 'Marker',
        sortable:true
    },{
        field: 'Locus',
        title: 'Locus',
        sortable:true
    },{
        field: 'Site',
        title: 'Site',
        sortable:true
    },{
        field: 'p',
        title: 'p',
        sortable:true
    }/*,{
        field: 'markerR2',
        title: 'markerR2',
        sortable:true    
    }*/
    ],   
 		});
 		});
</script>
<script type="text/javascript">
    $(function(){
        $('#table5').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'Significant annotation',              //文件名称设置  
          worksheetName: 'sig_snp_annotation',          //表格工作区名称  
          tableName: 'Significant annotation',  
      },
        columns: [ {
        field: 'snp',
        title: 'snp',
        sortable:true
    }, {
        field: 'allele',
        title: 'allele',
        sortable:true
    },{
        field: 'gene',
        title: 'gene',
        sortable:true
    },{
        field: 'transcript',
        title: 'transcript',
        sortable:true
    },{
        field: 'annotation',
        title: 'annotation',
        sortable:true    
    }
    ],   
 		});
 		});
</script>
<script type="text/javascript">
    $(function(){
        $('#table6').bootstrapTable({//'#table' 改为所用表的选择器
        url: "localhost:8080/Magic/Step/step_one.jsp",//改为当前网页的url，可通过鼠标右击网页 查看信息找出
        method: 'GET',                      //请求方式（*）
       	striped: true,                      //是否显示行间隔色
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 5,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
          //ignoreColumn: [0,0],            //忽略某一列的索引  
          fileName: 'Significant annotation',              //文件名称设置  
          worksheetName: 'sig_snp_annotation',          //表格工作区名称  
          tableName: 'Significant annotation',  
      },
        columns: [ {
        field: 'snp',
        title: 'snp',
        sortable:true
    }, {
        field: 'allele',
        title: 'allele',
        sortable:true
    },{
        field: 'gene',
        title: 'gene',
        sortable:true
    },{
        field: 'transcript',
        title: 'transcript',
        sortable:true
    },{
        field: 'annotation',
        title: 'annotation',
        sortable:true    
    }
    ],   
 		});
 		});
</script>
 
</html>
