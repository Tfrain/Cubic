<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="org.hibernate.HibernateException"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.Map.Entry" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
    <%
    Map attribute = ActionContext.getContext().getSession();
    JSONArray tree=new JSONArray();
	tree=(JSONArray)attribute.get("tree");
	%>
 	  <base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>GWAS Diagram</title>
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="author" content="Daliu"/>
        <meta name="keywords" content=""/>
        <meta name="describe" content=""/>
        <link href="Css/bootstrap.min.css" rel="stylesheet"/>
        <link href="Css/main.css" rel="stylesheet"/>
        <script src="genetree/gene_tree_data.js"></script>
        <script src="genetree/jquery.min.js" type="text/javascript"></script>
		<!-- <script src="js/bootstrap.min.js" type="text/javascript"></script> -->
<!--         <script type="text/javascript">
		$(function() {
			$(".dot").tooltip();
		});
        </script>
 -->    </head>
    <body>
    <s:action name="genetree.action" executeResult="true" />
    	 <%@ include file="../ListHeader.jsp"%>
    	 <div class="describe" style="margin-left:50px;">
                <h3>GWAS Diagram</h3>
                <br/>
                <p>The visualisation of all SNP-trait associations with genome-wide significance (2.79x10-8).Concerned results can be filtered via tracks on side of the page. The trait name and detailed information display when hovering over it. And clicking on it links to the relevant entry in the GWAS Search.</p>
                <p></p>
            </div>
      <div class="content" style="height:1450px;width:100%" >
        <div class="content" style="margin-top:60px;">
            <div style="text-align:right;">
                <button onclick="zoom('zoomin')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Enlarge</button>
                <button onclick="zoom('zoomout')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Narrow</button>
                <button onclick="zoom('reset')" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Reset</button>
                <input type="text" id="filter" value="">
                <button id="filterBtn" class="btn" style="padding:2px 10px;margin:15px;font-size:16px;">Filter</button>
            </div>
            <div>
                <div style="width:180px;height:1240px;float:left;display:inline-block;box-shadow:0 0 1px grey;">
                    <div style="width:180px;height:3%;font-size:16px;padding:4px 0;background:#4381be;color:white;text-align:center;">Data Filter </div>
                    <div id="filterlist" style="width:180px;height:97%;overflow-y:auto;">
                        
                    </div>
                </div>
                <svg id="treeNode" xmlns="http://www.w3.org/2000/svg" version="1.1" height="1240" width="1000" viewBox="0 0 2000 580" style="box-shadow:0 0 1px grey;"></svg>
            </div>
        </div>
        <input type="text" name="tree1" style="display: none;" id="tree1" value='<%=tree%>'>
        </div>
        <%@ include file="../ListFooter.jsp"%>
        
        <style>
            .filter-item{width:100%;height:55px;border-bottom:solid 1px #eee;padding:8px 4px;}
            .filter-item:hover{background:#eee;cursor:pointer;}
            .filter-item-selected{background:#eee;cursor:pointer;}
        </style>
    </body>
        <script src="genetree/gene_tree.js"></script>
</html>
