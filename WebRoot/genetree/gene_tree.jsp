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
                <p>The Visualisation of all SNP-trait associations with genome-wide significance (2.79x10-8).</p>
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
        <input type="text" name="tree1" style="display: none;" id="tree1" value=<%=tree%>></input>  
        </div>
        <%@ include file="../ListFooter.jsp"%>
        
        <style>
            .filter-item{width:100%;height:55px;border-bottom:solid 1px #eee;padding:8px 4px;}
            .filter-item:hover{background:#eee;cursor:pointer;}
            .filter-item-selected{background:#eee;cursor:pointer;}
        </style>
    </body>
<script>

/**
 * @name:绘制基因图
 * @author:daliu
 * @date:2017-04-22
 * @description:
 *
 */
var treeNode = document.getElementById('treeNode');
var html = '';
var tree = document.getElementById('tree1').value;
/**
 * 动态适配宽度
 * ------------------------------------------------------------
 */
var bodyWidth = $('body').width();
var svgWidth = bodyWidth*0.9-200;
treeNode.setAttribute('width',svgWidth);
treeNode.setAttribute('viewBox','0 0 '+svgWidth+' 580');

var width = 200;//每一组的宽度
var height = 2000;//每一组的高度
var xNum = 10;//每一水平方向染色体的个数（水平方向组数）
var topHeight = -700;//距离顶部的高度（相当于一个顶部边距）
var leftWidth = 40;//距离左边的宽度（相当于一个左边距）


var r = 4;//圆圈的半径（三角形则以它为半径的外接圆）
var circleNum = 10;//每一行需要放置圆圈（三角形）的个数
var circleRow = 2;//需要放置圆圈的排数
var circleRowSpan = 1;//每一组圆圈之间的间隔

//var gyHeight = 4;//每个基因的高度（左侧柱条）
var gyWidth = 10;//每个基因的宽度（左侧柱条）

var lineLength = 60;//线条长度
tree= JSON.parse(tree);

var rstlength = tree.length;
    console.log("rstlength:" + rstlength);
for(var i=0; i<rstlength; i++){
	var eachRst = tree[i].children;//每一组染色体数据
	var rst = {};
	rst.x= width*(i%xNum)+leftWidth;
	var length = eachRst.length;
	var allHeight = r*length*2*circleRow+circleRowSpan;//圆圈和每组圆圈间距排成的总高度
	//var allGenHeight = gyHeight*length;//因子的总高度
	var allGenHeight = 0;
	for(var s in eachRst){
		allGenHeight += parseInt(eachRst[s].height);
	}
	var yTemp = 0;
    console.log("eachRst.length:" + eachRst.length);
	for(var k=0;k<length;k++){
        //eachRst[k].height = eachRst[k].height * 2;
		var gyY = topHeight+500+yTemp;
		//var gyY = topHeight+1000+yTemp;
		yTemp += parseInt(eachRst[k].height);

		html += '<rect x="'+rst.x+'" y="'+gyY+'" width="'+gyWidth+'" height="'+eachRst[k].height+'" style="fill:'+eachRst[k].color+'"/>';//stroke:#797677;stroke-width:1;
		var eachYZ = eachRst[k].children;//每一组因子
		var yzlength = eachYZ.length;
		if(eachRst[k].id=='space')
		{
			continue;
		}
        console.log("r:" + r);
        console.log("k:" + k);
        console.log("circleRow:" + circleRow);
        console.log("circleRowSpan:" + circleRowSpan);
        console.log("i:" + i);
        console.log("xNum:" + xNum);
        console.log("topHeight:" + topHeight);
        console.log("height:" + height);
        console.log("floor:i/xNum:" + Math.floor(i/xNum));
		var circley = topHeight+r*k*2*circleRow+Math.floor(i/xNum)*height+circleRowSpan*k;
		//var circley = topHeight+r*k*2*circleRow+Math.floor(i/xNum*height)+circleRowSpan*k;
        console.log("before:circley:"+circley);
        console.log("chr:"+eachRst[k].chr);
        if(eachRst[k].chr=='9')
        {
            circley=circley+550;
        }
        if(eachRst[k].chr=='10')
        {
            circley=circley+250;
        }
        if(eachRst[k].chr=='8')
        {
            circley=circley+200;
        }
        if(eachRst[k].chr=='7')
        {
            circley=circley+250;
        }
        if(eachRst[k].chr=='6')
        {
            circley=circley+550;
        }
        if(eachRst[k].chr=='4')
        {
            circley=circley+150;
        }
        if(eachRst[k].chr=='2')
        {
            circley=circley-150;
        }
        if(eachRst[k].chr=='5')
        {
            circley=circley-230;
        }
        console.log("after:circley:"+circley);
		var circlex = rst.x+lineLength+gyWidth;
		html += '<line x1="'+(rst.x+gyWidth)+'" y1="'+(gyY+eachRst[k].height/2)+'" x2="'+circlex+'" y2="'+circley+'" style="stroke:black;stroke-width:1"/>';
		for(var j=0;j<yzlength;j++){
			if(j<circleNum){
				if(eachYZ[j].type == 'SV_GWAS' || eachYZ[j].type == 'sGWAS'){
					eachYZ[j].type = 'circle';
					// title="start:'+eachYZ[j].start+'\nend:'+eachYZ[j].end+'\nPvalue:'+eachYZ[j].value
					html += '<circle  filter="'+eachYZ[j].filter+'" cx="'+circlex+'" cy="'+circley+'" r="'+r+'" onclick="clickYZ('+eachYZ[j].Chr+',\''+eachYZ[j].filter+'\','+eachYZ[j].start+','+eachYZ[j].end+')" fill="'+eachYZ[j].color+'"><title>start:'+eachYZ[j].start+'\nend:'+eachYZ[j].end+'\nPvalue:'+eachYZ[j].value+ '</title></circle>';
				}else if(eachYZ[j].type == 'BIN_GWAS' || eachYZ[j].type == 'hGWAS'){
					eachYZ[j].type = 'triangle';
					var x1 = circlex-Math.sqrt(3)/2*r;
					var x2 = circlex+Math.sqrt(3)/2*r;
					var x3 = circlex;
					var y1 = circley-r/2;
					var y2 = circley-r/2;
					var y3 = circley+r;
					html += '<polygon filter="'+eachYZ[j].filter+'" points="'+x1+','+y1+' '+x2+','+y2+' '+x3+','+y3+'" onclick="clickYZ('+eachYZ[j].Chr+',\''+eachYZ[j].filter+'\','+eachYZ[j].start+','+eachYZ[j].end+')" style="fill:'+eachYZ[j].color+'"><title>start:'+eachYZ[j].start+'\nend:'+eachYZ[j].end+'\nPvalue:'+eachYZ[j].value+ '</title></polygon>';
				}
				circlex = circlex+2*r;
			}else{
				//顶部高度+半径*（本组个数+前面组的个数）+染色体组高度
				var circley2 = topHeight+r*(2*(Math.floor(j/circleNum))+k*2*circleRow)+Math.floor(i/xNum)*height+circleRowSpan*k;
				//var circley2 = topHeight+r*(2*(Math.floor(j/circleNum))+k*2*circleRow)+Math.floor(i/200*height)+circleRowSpan*k;
				var circlex2 = rst.x+lineLength+gyWidth+2*r*(j%circleNum);
				if(eachYZ[j].type == 'SV_GWAS' || eachYZ[j].type == 'sGWAS'){
					eachYZ[j].type = 'circle';
					html += '<circle filter="'+eachYZ[j].filter+'" onclick="clickYZ('+eachYZ[j].Chr+',\''+eachYZ[j].filter+'\','+eachYZ[j].start+','+eachYZ[j].end+')" cx="'+circlex2+'" cy="'+circley2+'" r="'+eachYZ[j].chr+'" fill="'+eachYZ[j].color+'"/><title>start:'+eachYZ[j].start+'\nend:'+eachYZ[j].end+'\nPvalue:'+eachYZ[j].value+ '</title></circle>';
				}else if(eachYZ[j].type == 'BIN_GWAS' || eachYZ[j].type == 'hGWAS'){
					eachYZ[j].type = 'triangle';
					var x21 = circlex2-Math.sqrt(3)/2*r;
					var x22 = circlex2+Math.sqrt(3)/2*r;
					var x23 = circlex2;
					var y21 = circley2-r/2;
					var y22 = circley2-r/2;
					var y23 = circley2+r;
					html += '<polygon filter="'+eachYZ[j].filter+'" points="'+x21+','+y21+' '+x22+','+y22+' '+x23+','+y23+'" onclick="alert(222)" style="fill:'+eachYZ[j].color+'"/><title>start:'+eachYZ[j].start+'\nend:'+eachYZ[j].end+'\nPvalue:'+eachYZ[j].value+ '</title></polygon>';
				}
			}
		}
	}
}
treeNode.innerHTML = html;


//点击
function clickYZ(chr,trait,start,end){
//http://localhost:8080/Magic/showThree?chr=1&trait=CW&start=122&end=12334&search=first	
	// alert("start:"+start+"\nend:"+end+"\nPvalue="+value);
	// window.location('')
	window.location.href='http://magicmaize.hzau.edu.cn/Magic/showThree?chr='+chr+'&trait='+trait+'&start='+start+'&end='+end+'&search=first';
}


//放大缩小
var treeNode = $('#treeNode');
function zoom(type){
	var viewBox = treeNode.attr('viewBox');
	var viewBoxArray = viewBox.split(" ");
	var x1 = parseInt(viewBoxArray[0]);
	var y1 = parseInt(viewBoxArray[1]);
	var x2 = parseInt(viewBoxArray[2]);
	var y2 = parseInt(viewBoxArray[3]);
	if(type == 'zoomin'){
		var newx1 = x1+(x2-x1)/32;
		var newy1 = y1+(y2-y1)/32;
		var newx2 = x2-(x2-x1)/32;
		var newy2 = y2-(y2-y1)/32;
	}else if(type == 'zoomout'){
		var newx1 = x1-(x2-x1)/16;
		var newy1 = y1-(y2-y1)/16;
		var newx2 = x2+(x2-x1)/16;
		var newy2 = y2+(y2-y1)/16;
	}else if(type == 'reset'){
		var newx1 = 0;
		var newy1 = 0;
		var newx2 = treeNode.width();
		var newy2 = treeNode.height();
		$("circle").css({'fill-opacity':1});
		$("polygon").css({'fill-opacity':1});
	}
	//treeNode.attr('viewBox',newx1+" "+newy1+" "+newx2+" "+newy2);
        setViewBox(treeNode, newx1, newy1, newx2, newy2);
}


//平移
var drag = false;
treeNode.mousedown(function(e){
  drag = true;
  pageXTemp = e.pageX;
  pageYTemp = e.pageY;
  treeNode.css({"cursor":"move"});
});

treeNode.click(function(){

});
treeNode.mouseup(function(){
  drag = false;
  treeNode.css({"cursor":"default"});
});


//缩放
var iszoom = false;//是否在svg图像内，是否启动鼠标滚轮缩放
treeNode.mouseover(function(){
	iszoom = true;
});

treeNode.mouseout(function(){
	iszoom = false;
});


var pageXTemp = 0;
var pageYTemp = 0;
treeNode.mousemove(function(e){
	if(drag){
		var viewBox = treeNode.attr('viewBox');
		var viewBoxArray = viewBox.split(" ");
		var x1 = parseInt(viewBoxArray[0]);
		var y1 = parseInt(viewBoxArray[1]);
		var x2 = parseInt(viewBoxArray[2]);
		var y2 = parseInt(viewBoxArray[3]);
		var doX = pageXTemp == 0? 1.3:Math.abs(e.pageX-pageXTemp)*x2/svgWidth;
		var doY = pageYTemp == 0? 1.3:Math.abs(e.pageY-pageYTemp)*y2/500;

		if(pageXTemp<e.pageX){
			doX = -doX;
		}
		if(pageYTemp<e.pageY){
			doY = -doY;
		}
		pageXTemp = e.pageX;
		pageYTemp = e.pageY;
		var newx1 = x1+doX;
		var newy1 = y1+doY;
		var newx2 = x2+doX;
		var newy2 = y2+doY;
        //treeNode.attr('viewBox',newx1+" "+newy1+" "+newx2+" "+newy2);
        setViewBox(treeNode, newx1, newy1, newx2, newy2);
	}
});


//滚轮缩放
var scrollFunc=function(e){
var direct=0;
e=e || window.event;
var viewBox = treeNode.attr('viewBox');
var viewBoxArray = viewBox.split(" ");
var x1 = parseInt(viewBoxArray[0]);
var y1 = parseInt(viewBoxArray[1]);
var x2 = parseInt(viewBoxArray[2]);
var y2 = parseInt(viewBoxArray[3]);
if(e.wheelDelta){//IE/Opera/Chrome
	if(e.wheelDelta>0){
		var newx1 = x1+(x2-x1)/32;
		var newy1 = y1+(y2-y1)/32;
		var newx2 = x2-(x2-x1)/32;
		var newy2 = y2-(y2-y1)/32;
	}else{
		var newx1 = x1-(x2-x1)/16;
		var newy1 = y1-(y2-y1)/16;
		var newx2 = x2+(x2-x1)/16;
		var newy2 = y2+(y2-y1)/16;
	}
}else if(e.detail){//Firefox
	if(e.detail<0){
		var newx1 = x1+(x2-x1)/32;
		var newy1 = y1+(y2-y1)/32;
		var newx2 = x2-(x2-x1)/32;
		var newy2 = y2-(y2-y1)/32;
	}else{
		var newx1 = x1-(x2-x1)/16;
		var newy1 = y1-(y2-y1)/16;
		var newx2 = x2+(x2-x1)/16;
		var newy2 = y2+(y2-y1)/16;
	}
 }
 if(iszoom == true){
	e.preventDefault();
	//treeNode.attr('viewBox',newx1+" "+newy1+" "+newx2+" "+newy2);
        setViewBox(treeNode, newx1, newy1, newx2, newy2);
 }
}


/*注册事件*/
if(document.addEventListener){
   document.addEventListener('DOMMouseScroll',scrollFunc,false);
}//W3C
window.onmousewheel=document.onmousewheel=scrollFunc;//IE/Opera/Chrome/Safari


//过滤
$('#filterBtn').click(function(){
	var filterval = $('#filter').val();
	filter(filterval);
});


//要过滤出来的数组
var filterListArray = [];


//过滤函数
function filter(filter){
	var added = false;
	for(var i in filterListArray){
		if(filter==filterListArray[i]){
			filterListArray.splice(i,1);
			added = true;
			break;
		}
	}
	if(added == false){
		filterListArray.push(filter);
	}
	if(filterListArray.length>0){
		$("circle").css({'fill-opacity':0.15});
		$("polygon").css({'fill-opacity':0.15});
	}else{
		$("circle").css({'fill-opacity':1});
		$("polygon").css({'fill-opacity':1});
	}

	$("#filterlist").children().removeClass('filter-item-selected');
	for(var k in filterListArray){
		$("circle[filter=\'"+filterListArray[k]+"\']").css({'fill-opacity':1});
		$("polygon[filter=\'"+filterListArray[k]+"\']").css({'fill-opacity':1});
		$("#"+filterListArray[k]).addClass('filter-item-selected');
	}

}
//
function filtercircle(filter){
	$("circle").css({'fill-opacity':1});
	$("polygon").css({'fill-opacity':0.15});
}
function filtertriangle(filter){
	$("circle").css({'fill-opacity':0.15});
	$("polygon").css({'fill-opacity':1});
}

//过滤面板生成
setFilterPan(tree);
function setFilterPan(tree){
	var data = filterPan(tree);
	var data2 = filterPan2(tree);
	var html = '';
	for(var i in data2){
		if(data2[i].filter=='circle'){
				html += '<div onclick="filtercircle(\''+'circle'+'\')" class="filter-item">'+
					'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
					'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
					'<div style="width:100%;float:left;">sGWAS: '+data2[i].filter+'</div>'+
				'</div>';
		}
		else{
			html += '<div onclick="filtertriangle(\''+'triangle'+'\')" class="filter-item">'+
				'<div style="border-top:20px solid '+data2[i].color+';border-left:10px solid transparent;border-right:10px solid transparent;float:left;"></div>'+
				'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
				'<div style="width:100%;float:left;">hGWAS: '+data2[i].filter+'</div>'+
			'</div>';
		}
	}
    //html += '<div onclick="filtercircle(\''+'circle'+'\')" class="filter-item">'+
        //'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
        //'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
        //'<div style="width:100%;float:left;">SV_GWAS: circle</div>'+
    //'</div>';
    //html += '<div onclick="filtercircle(\''+'circle'+'\')" class="filter-item">'+
        //'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
        //'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
        //'<div style="width:100%;float:left;">sGWAS: circle</div>'+
    //'</div>';
    //html += '<div onclick="filtercircle(\''+'circle'+'\')" class="filter-item">'+
        //'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
        //'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
        //'<div style="width:100%;float:left;">BIN_GWAS: triangle</div>'+
    //'</div>';
    //html += '<div onclick="filtercircle(\''+'circle'+'\')" class="filter-item">'+
        //'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
        //'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
        //'<div style="width:100%;float:left;">hGWAS: triangle</div>'+
    //'</div>';

	for(var i in data){
		html += '<div id="'+data[i].filter+'" onclick="filter(\''+data[i].filter+'\')" class="filter-item">'+
					'<div style="background:'+data[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
					'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data[i].num+'</div>'+
					'<div style="width:100%;float:left;">Trait：'+data[i].filter+'</div>'+
				'</div>';
	}
	var filterlist = document.getElementById('filterlist');
	filterlist.innerHTML = html;
}


//分类数据生成
function filterPan(tree){
	var data = [];
	for(var i in tree){
		var yz = tree[i].children;
		for(var k in yz){
			var jy = yz[k].children;
			for(var n in jy){
				var has = false;
				for(var s in data){
					if(data[s].filter == jy[n].filter){
						if(jy[n].filter=='space')
						{
							has = true;
							break;
						}
						data[s].num+=1;
						has = true;
						break;
					}
				}
				if(has == false){
					if(jy[n].filter!='space'){
						data.push({filter:jy[n].filter,num:1,color:jy[n].color});

					}
				}
			}
		}
	}
	return data;
}
//分类数据2

function filterPan2(tree){
	var data = [];
	for(var i in tree){
		var yz = tree[i].children;
		for(var k in yz){
			var jy = yz[k].children;
			for(var n in jy){
				var has = false;
				for(var s in data){
					if(data[s].filter == jy[n].type){
						if(jy[n].filter=='space')
						{
							has = true;
							break;
						}
						data[s].num+=1;
						has = true;
						break;
					}
				}
				if(has == false){
					if(jy[n].filter!='space'){
					data.push({filter:jy[n].type,num:1,color:'yellow'});
					}
				}
			}
		}
	}
	return data;
}

function setViewBox(view, x1, y1, x2, y2){
	if(x2 < 10000 && x2 > 0 && y2 < 10000 && y2 > 0 &&
        Math.abs(x1 ) < x2 && Math.abs(y1) < y2 ){
	view.attr('viewBox',x1+" "+y1+" "+x2+" "+y2);
	}else{
        //alert('已经缩到最小了！');
	}
}
</script>
</html>
