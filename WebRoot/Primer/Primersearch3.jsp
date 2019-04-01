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
<title>Design Primer by Variation ID</title>
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
<script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
            $(function(){$(".eg").tooltip();});
    </script>

</head>

<body>
	<%@ include file="../ListHeader.jsp"%>

	<div class="container" style="height:700px;">
		<div class="describe">
			<h3>Design Primer by SNP/INDEL ID</h3>
			<h4>You can input one SNP, INDEL or SV ID (in our database) and
				select upstream and downstream regions, to pick PCR-primers to
				validate the variant.</h4>
			<h4>Here we use Primer3 as a backend engine.</h4>
			<!-- lv 7-11 change p->h4 -->

		</div>

		<form action="primer3" method="post">
			<div class="leftp">
				<div style="height:50px;">
                    <div class="col-md-6 col-xs-6">
					<div class="input-group input-lg">
						<!-- lv 7-12 change 45-> 48-->
						<span class="Input-group-addon">
                            Upstream:</span><input class="form-control eg" type="input"
								name="upstream" id="upstream1" title="eg:100"
								/>
						<!-- lv 7-12 change style="width: 70%;" -->

					</div>
					</div>
                    <div class="col-md-6 col-xs-6">
					<div class="input-group input-lg">
						<span class="input-group-addon">
                            Downstream:</span><input class="form-control eg" type="input"
								name="downstream" id="downstream1" title="eg:200"
								/>
					</div>
					</div>
                    <div class="col-md-12 col-xs-12">
					<div class="input-lg">
						<input class="form-control eg" title="eg: chr1.s_67196493" type="input" name="id" id="id1"
							placeholder="Input one Variation ID"
                            style="border-top-left-radius:4px;border-bottom-left-radius:4px;"
							/>
                    </div>
                    </div>
				</div>
			</div>

			<div class="leftp2" style="height: 350px;">
				<h3>Parameter Selection</h3>
				<!-- lv 7-11 change 套用的primersearch2 -->
				<div style="height:65px;text-align:right;">
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
						<div class="input-group input-lg" >
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
						<div class="input-group input-lg" >
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
						<div class="input-group input-lg" >
							<span class="input-group-addon">Default product:</span><input
								class="form-control" type="text" name="defaultproduct"
								id="defaultproduct" value="100-300" />
						</div>
					</div>
					<div class="col-md-4 col-xs-4">
						<div class="input-group input-lg">
							<span class="input-group-addon">Max Poly-X:</span><input
								class="form-control" type="text" name="maxployx" id="maxployx1"
								value="5" />
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
	</div>
						<div class="col-md-2 col-md-offset-5">
							<!-- lv 7-11 change new -->
							<button class="btn" id="next1">Submit</button>
						</div>
		</form>

	</div>



	<%@ include file="../ListFooter.jsp"%>
</body>
</html>
