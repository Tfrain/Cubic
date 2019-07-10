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
        //String search = attributes.get("search").toString();//������һ���Ƚ�ѡ����ж�
        int len = Integer.parseInt(attributes.get("len").toString());
        
        //�ַ��������飨�ַ�����û�����ݿ⣬���߼���ϵlen2����洢��QTL������
        HashMap<String,ArrayList<String>> data = (HashMap<String,ArrayList<String>>)attributes.get("data"); 
    %>
    
    <title>Variation Three</title>
    
	 <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="wei"/>
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
        <div class="col-md-12">
        <div class="search">
            <br>
            <br>
            
            <div class="my-panel">
           <h3>SNP</h3>
           <hr/>
            <%if(len > 0){%>
            <table id="table3" data-toggle="table" class="table table-hover">
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
                    <td><%=data.get(Integer.toString(i)).get(5)%></td>
                    <td><%=data.get(Integer.toString(i)).get(6)%></td>
                    <td><%=data.get(Integer.toString(i)).get(7)%></td>
                    <td><%=data.get(Integer.toString(i)).get(8)%></td>
                    <td><%=data.get(Integer.toString(i)).get(9)%></td>
                    <td><%=data.get(Integer.toString(i)).get(10)%></td>
                    <td><%=data.get(Integer.toString(i)).get(11)%></td>
                    <td><%=data.get(Integer.toString(i)).get(12)%></td>
                    <td><%=data.get(Integer.toString(i)).get(13)%></td>
                    <td><%=data.get(Integer.toString(i)).get(14)%></td>
                    <td><%=data.get(Integer.toString(i)).get(15)%></td>
                </tr>	
           <%} %>
                       </tbody>
           </table>
           <%}else{%>
							<b  style="font-size:25px;width:30%;color:red !important; ">No matching data!</b>
                            <%}%>
            </div>
            <br>
            <br>
        </div>
        </div>
        </div>
    
    	<%@ include file="../ListFooter.jsp"%>
  </body>
  
  <script type="text/javascript">
    $(function(){
        $('#table3').bootstrapTable({//'#table' ��Ϊ���ñ��ѡ����
        url: "localhost:8080/Magic/Step/step_newone.jsp",//��Ϊ��ǰ��ҳ��url����ͨ������һ���ҳ �鿴��Ϣ�ҳ�
        method: 'GET',                      //����ʽ��*��
       	striped: true,						//�Ƿ���ʾ�м��ɫ
       	cache: false,                      	//����
       	pagination: true,
       	smartDisplay:false,
       	pageSize: 10,
       	search: true,
        showExport: true,  
        buttonsAlign:"left",
        exportTypes:['csv','excel'],
        exportOptions:{  
           //ignoreColumn: [0,1],  //����ĳһ�е�����  
           fileName: 'SNP',  //�ļ���������  
           worksheetName: 'sheet1',  //�����������  
           tableName: 'SNP',  
           excelstyles: ['background-color', 'color', 'font-size', 'font-weight'],  
           //onMsoNumberFormat: DoOnMsoNumberFormat  
       }, 
      columns: [{//�޸�Ϊ���ñ����Ϣ field�����ݿ��е� ��Ӧ�ı��⣬titleΪҪ��ʾ������
        field: 'Uploaded_variation',
        title: 'Variation',
        sortable:true,
    }, {
        field: 'Chr',
        title: 'Chr',
        sortable:true
    }, {
        field: 'Location',
        title: 'Location',
        sortable:true
    },{
        field: 'Allele',
        title: 'Allele',
        sortable:true
    },{
        field: 'Gene',
        title: 'Gene',
    },{
        field: 'Feature',
        title: 'Feature',
    },{
        field: 'Feature_type',
        title: 'Feature_type',  
    },{
        field: 'Consequence',
        title: 'Variation_type',
        formatter:function(value,row,index){
            if(value.length>10){ �0�2
�0�2 �0�2 �0�2 �0�2 		return "<span title='"+value+"'>"+value.substring(0,10)+"..."+"</span>"; �0�2
�0�2 �0�2 		}else{ �0�2
�0�2 �0�2 �0�2 �0�2 		return "<span title='"+value+"'>"+value.substring(0,value.length)+"</span>"; �0�2
�0�2 �0�2			} �0�2
     }     
    },{
        field: 'Extra',
        title: 'Extra',
        formatter:function(value,row,index){
            if(value.length>15){ �0�2
�0�2 �0�2 �0�2 �0�2 		return "<span title='"+value+"'>"+value.substring(0,15)+"..."+"</span>"; �0�2
�0�2 �0�2 		}else{ �0�2
�0�2 �0�2 �0�2 �0�2 		return "<span title='"+value+"'>"+value.substring(0,value.length)+"</span>"; �0�2
�0�2 �0�2			} �0�2
     }   
    },{
        field: 'Action',
        title: 'Action',
        formatter:function(value,row,index){
          var textR='<p><a href="'+ value +'" target="_blank" style="color:red">JBrowse</a></p>';
          return textR;
     }
    },{
        field: 'cDNA_position',
        title: 'cDNA_position',
        sortable:true,
    },{
        field: 'CDS_position',
        title: 'CDS_position',
        sortable:true,
    },{
        field: 'Protein_position',
        title: 'Protein_position',
        sortable:true,
    },{
        field: 'Amino_acids',
        title: 'Amino_acids',
        sortable:true,
    },{
        field: 'Codons',
        title: 'Codons',
        sortable:true,
    },{
        field: 'Existing_variation',
        title: 'Existing_variation',
        sortable:true,
    }
    ],    
 		});
 		});
</script>
</html>
