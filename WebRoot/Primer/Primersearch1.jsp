<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Primer Design by Region</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="Daliu" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link href="Css/bootstrap.min.css" rel="stylesheet" />
<link href="Css/main.css" rel="stylesheet" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
		$(function() {
			$(".eg").tooltip();
		});
    </script>

</head>

<body>
	<%@ include file="../ListHeader.jsp"%>

	<div class="container" style="height:700px;">
		<div class="describe">
			<h3>Primer Design by Region</h3>
			<h4>You can choose one of the provided databases and input a
				genomic region to pick PCR-primers to validate genomic sequence or
				develop molecular markers. Here we use Primer3 as a backend engine.
			</h4>
			<!-- lv 7-11 change p->h4 -->

		</div>
		<div class="inputs" style="height: 150px; ">
			<form action="primer" method="post">
				<div class="leftp">
					<div style="height:65px;">
						<!-- lv 7-11 change class=""->class="background1" 包括以下所有class="background"修改了style-->
                        <div class="col-md-6 col-xs-6">
						<div class="input-group input-lg">
							<span class="input-group-addon">
                                Chromosome:</span><select name="chromosome"
									id="chromosome1" class="form-control">

									<option value="1">1</option>
									<option value="2">2</option>
								</select>

						</div>
						</div>
                        <div class="col-md-6 col-xs-6">
						<div class="input-group input-lg">
                            <span class="input-group-addon">
                                Database:</span><select
									name="database" id="database1" class="form-control"
									>
									<option style="width:150px" value="V3.25">V3.25</option>
									<option style="width:150px" value="HZS">HZS</option>
									<option style="width:150px" value="V4">V4</option>
								</select>
						</div>
                        </div>

					</div>
					<div style="height:50px;">
                        <div class="col-md-6 col-xs-6">
						<div class="input-group input-lg">
							<span class="input-group-addon">
                                Start position:</span><input class="form-control eg" title="eg: 120" type="text"
									name="sposition" id="sposition1" />
						</div>
						</div>
                        <div class="col-md-6 col-xs-6">
						<div class="input-group input-lg">
							<span class="input-group-addon">
                                End position:</span><input class="form-control eg" title="eg: 400" type="text"
									name="eposition" id="eposition1" />
						</div>
						</div>
					</div>
				</div>
				<form action="blast" method="post">
					<div class="leftp2" style="height: 350px;">
						<h3>Parameter Selection</h3>
						<!-- lv 7-11 change 套用的primersearch2 -->
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Optimal primer size:</span><input
									class="form-control" type="text" name="opsize" id="opsize1"
									value="20" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Max primer size:</span><input
									class="form-control" type="text" name="maxsize" id="maxsize1"
									value="27" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Min primer size:</span><input
									class="form-control" type="text" name="minsize" id="maxsize1"
									value="18" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Optimal primer TM:</span><input
									class="form-control" type="text" name="opttm" id="opttm1"
									value="60.0" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Max primer TM:</span><input
									class="form-control" type="text" name="maxtm" id="maxtm1"
									value="63.0" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Min primer TM:</span><input
									class="form-control" type="text" name="mintm" id="mintm1"
									value="57.0" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Optimal GC percent:</span><input
									class="form-control" type="text" name="optgc" id="optgc1"
									value="50.0" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Max GC percent:</span><input
									class="form-control" type="text" name="maxgc" id="maxgc1"
									value="80.0" />
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="input-group input-lg">
								<span class="input-group-addon">Min GC percent:</span><input
									class="form-control" type="text" name="mingc" id="mingc1"
									value="20.0" />
							</div>
						</div>
							<div class="col-md-4 col-xs-4">
								<div class="input-group input-lg">
									<span class="input-group-addon">Default product:</span><input
										class="form-control" type="text" name="defaultproduct"
										id="defaultproduct" value="100-300" />
								</div>
							</div>
							<div class="col-md-4 col-xs-4">
								<div class="input-group input-lg">
									<span class="input-group-addon">Max Poly-X:</span><input
										class="form-control" type="text" name="maxployx"
										id="maxployx1" value="5" />
								</div>
							</div>
							<div class="col-md-4 col-xs-4">
								<div class="input-group input-lg">
									<span class="input-group-addon">Max Self Any:</span><input
										class="form-control" type="text" name="selfany" id="selfany1"
										value="8" />
								</div>
							</div>
						</div>
						<div class="col-md-2 col-md-offset-5">
							<!-- lv 7-11 change new -->
							<button class="btn" id="next1">Submit</button>
						</div>
						</div>
				</form>
		</div>



	<%@ include file="../ListFooter.jsp"%>
</body>
</html>
