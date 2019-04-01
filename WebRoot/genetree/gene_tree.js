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
	for(var k=0;k<length;k++){
		var gyY = topHeight+500+yTemp;
		yTemp += parseInt(eachRst[k].height);

		html += '<rect x="'+rst.x+'" y="'+gyY+'" width="'+gyWidth+'" height="'+eachRst[k].height+'" style="fill:'+eachRst[k].color+';"/>';//stroke:#797677;stroke-width:1;
		var eachYZ = eachRst[k].children;//每一组因子
		var yzlength = eachYZ.length;
		if(eachRst[k].id=='space')
		{
			continue;
		}
		var circley = topHeight+r*k*2*circleRow+Math.floor(i/xNum)*height+circleRowSpan*k;
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
		var circlex = rst.x+lineLength+gyWidth;
		html += '<line x1="'+(rst.x+gyWidth)+'" y1="'+(gyY+eachRst[k].height/2)+'" x2="'+circlex+'" y2="'+circley+'" style="stroke:black;stroke-width:1"/>';
		for(var j=0;j<yzlength;j++){
			if(j<circleNum){
				if(eachYZ[j].type == 'SV_GWAS'){
					eachYZ[j].type = 'circle';
					html += '<circle filter="'+eachYZ[j].filter+'" cx="'+circlex+'" cy="'+circley+'" r="'+r+'" onclick="clickYZ('+eachYZ[j].start+',\''+eachYZ[j].end+'\','+eachYZ[j].value+')" fill="'+eachYZ[j].color+'"/>';
				}else if(eachYZ[j].type == 'BIN_GWAS' || eachYZ[j].type == 'hGWAS'){
					eachYZ[j].type = 'triangle';
					var x1 = circlex-Math.sqrt(3)/2*r;
					var x2 = circlex+Math.sqrt(3)/2*r;
					var x3 = circlex;
					var y1 = circley-r/2;
					var y2 = circley-r/2;
					var y3 = circley+r;
					html += '<polygon filter="'+eachYZ[j].filter+'" points="'+x1+','+y1+' '+x2+','+y2+' '+x3+','+y3+'" onclick="clickYZ('+eachYZ[j].start+',\''+eachYZ[j].end+'\','+eachYZ[j].value+')" style="fill:'+eachYZ[j].color+';"/>';
				}
				circlex = circlex+2*r;
			}else{
				//顶部高度+半径*（本组个数+前面组的个数）+染色体组高度
				var circley2 = topHeight+r*(2*(Math.floor(j/circleNum))+k*2*circleRow)+Math.floor(i/xNum)*height+circleRowSpan*k;
				var circlex2 = rst.x+lineLength+gyWidth+2*r*(j%circleNum);
				if(eachYZ[j].type == 'SV_GWAS' || eachYZ[j].type == 'sGWAS'){
					eachYZ[j].type = 'circle';
					html += '<circle filter="'+eachYZ[j].filter+'" onclick="clickYZ('+eachYZ[j].start+',\''+eachYZ[j].end+'\','+eachYZ[j].value+')" cx="'+circlex2+'" cy="'+circley2+'" r="'+r+'" fill="'+eachYZ[j].color+'"/>';
				}else if(eachYZ[j].type == 'BIN_GWAS'){
					eachYZ[j].type = 'triangle';
					var x21 = circlex2-Math.sqrt(3)/2*r;
					var x22 = circlex2+Math.sqrt(3)/2*r;
					var x23 = circlex2;
					var y21 = circley2-r/2;
					var y22 = circley2-r/2;
					var y23 = circley2+r;
					html += '<polygon filter="'+eachYZ[j].filter+'" points="'+x21+','+y21+' '+x22+','+y22+' '+x23+','+y23+'" onclick="alert(222)" style="fill:'+eachYZ[j].color+';"/>';
				}
			}
		}
	}
}
treeNode.innerHTML = html;


//点击
function clickYZ(start,end,value){
	alert("start:"+start+"\nend:"+end+"\nPvalue="+value);
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
					'<div style="width:100%;float:left;">Data type：'+data2[i].filter+'</div>'+
				'</div>';
		}
		else{
			html += '<div onclick="filtertriangle(\''+'triangle'+'\')" class="filter-item">'+
				'<div style="background:'+data2[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
				'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data2[i].num+'</div>'+
				'<div style="width:100%;float:left;">Data type：'+data2[i].filter+'</div>'+
			'</div>';
		}
	}
	for(var i in data){
		html += '<div id="'+data[i].filter+'" onclick="filter(\''+data[i].filter+'\')" class="filter-item">'+
					'<div style="background:'+data[i].color+';width:20px;height:20px;border-radius:10px;float:left;"></div>'+
					'<div style="background:#398A96;color:white;text-align:center;float:right;width:40px;height:20px;border-radius:10px;">'+data[i].num+'</div>'+
					'<div style="width:100%;float:left;">Triat：'+data[i].filter+'</div>'+
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
