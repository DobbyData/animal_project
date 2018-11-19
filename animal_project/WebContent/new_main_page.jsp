<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=EUC-KR">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Web Analytics - Overview</title>

	<!-- stylesheets -->
	<link href="assets/fonts/font-roboto.css" rel="stylesheet">
	<link href="assets/bootstrap/bootstrap4-alpha3.min.css" rel="stylesheet">
	<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="assets/web-analytics/style.css" rel="stylesheet">

	<!-- scripts -->
	<script src="assets/jquery/jquery-3.1.0.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/bootstrap4-alpha3.min.js"></script>
	<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="assets/web-analytics/overview.js"></script>

</head>
<style>
	
	#iframes{
	 position:relative;
	 width:100%;
	 height:880px;
	 border: 0;
	 
	 
	}

	
</style>
<body>
	<!-- header -->
	<nav class="navbar navbar-fixed-top" id="header">
		<div class="container-fluid">
			<div class="navbar-header">
				
				<div class="brand">
					<a href="new_main_page.jsp">
						<span class="hidden-xs-down m-r-3">유기동물 실태 보고서</span><span class="lead"></span>
					</a>
				</div>

			</div>
		</div>
	</nav>
	<!-- /header -->

	<!-- sidebar -->
	<div class="sidebar-toggle" id="sidebar">
		<ul class="nav nav-sidebar">
			<li>
				<a href="new_main_page.jsp">
					<i class="fa fa-clock-o fa-lg fa-fw" aria-hidden="true"></i>
					<span>Main</span>
				</a>
			</li>
			<li role="separator" class="divider"></li>
			<li>
				<a href="new_main2_statistics.jsp" target="iframes" >
					<i class="fa fa-newspaper-o fa-lg fa-fw" aria-hidden="true"></i>
					<span>Detail statistic </span>
				</a>
			</li>
			<li role="separator" class="divider"></li>
		</ul>
	</div>
	<!-- /sidebar -->

	<!-- page-content-wrapper -->
	<div class="page-content-toggle" id="page-content-wrapper" >
		<div class="container-fluid" style="padding: 0rem; margin: 0rem">
			<iframe name="iframes" id='iframes' src="graph_pages.jsp"  style="padding: 0rem; margin: 0rem"> </iframe>
		
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /page-content-wrapper -->

</body>

</html>