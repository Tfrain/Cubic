<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Contact</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Daliu"/>
    <meta name="keywords" content=""/>
    <meta name="describe" content=""/>
    <link href="Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/main.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="live2d/assets/waifu.css"/>
	
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>

<body>
<%@ include file="../ListHeader.jsp"%>

<div class="content" style="height:850px; width:100%">
<div class="waifu">
    
    <!-- 提示框 -->
    <div class="waifu-tips"></div>
    
    <!-- 看板娘画布 -->
    <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
    
    <!-- 工具栏 -->
    <div class="waifu-tool">
        <span class="fui-home"></span>
        <span class="fui-chat"></span>
        <span class="fui-eye"></span>
        <span class="fui-user"></span>
        <span class="fui-photo"></span>
        <span class="fui-info-circle"></span>
        <span class="fui-cross"></span>
    </div>
    
</div>

<script src="live2d/assets/waifu-tips.js"></script>
<script src="live2d/assets/live2d.js"></script>

<!-- 初始化看板娘，会自动加载指定目录下的 waifu-tips.json -->
<script type="text/javascript">initModel("http://magicmaize.hzau.edu.cn/live2d/assets/")</script>
  <div class="left" style="height: 700px; width: 45%; ">
  		<h3>Ways to reach me.</h3>
  		<h4>For questions or comments about our database, please contact liujianxiao@mail.hzau.edu.cn or jingyunluo@foxmail.com</h4>
  </div>
  <!--百度地图容器-->
  <div class="left" style="height: 700px; width: 50%; ">
  <div float="left">
  <div class="lefttool" style="height: 138px; width: 215px; "><image style="width:215px;height:138px;" src="images/contact.png"></div><div class="lefttool" style="width:65%"><br/><b>National Key Laboratory of Crop Genetic Improvement Huazhong Agricultural University Wuhan 430070,China</b></div></div>

  		<div  class="lefttool" style="width:100%;height:520px;border:#ccc solid 1px;" id="dituContent"></div>
  </div>
  </div>
  <%@ include file="../ListFooter.jsp"%>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(114.364203,30.483095);//定义一个中心点坐标
        map.centerAndZoom(point,16);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
</script>
</html>