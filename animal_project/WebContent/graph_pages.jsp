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

	#2018data{
	 position: relative;
	 border: 3px solid black;
	}
	
	#iframes{
	 width:100%;
	 height:360px;
	 border: 0;
	}
	.iframes2{
	 width:100%;
	 height:350px;
	 border: 0;
	}
	
		*{
	-moz-box-sizing: border-box;
	box-sizing: border-box;

	}
	html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
		
	
		}
</style>
<body >

	<!-- page-content-wrapper -->

		<div class="container-fluid">

			<!-- 1st row -->
			<div class="row m-b-1">
				<div class="col-md-12">
					<div class="card card-block"style="padding: 0rem; margin-top: 1.0rem">
						<h4 class="card-title m-b-2">2018년 유기동물 데이터</h4>
						<div id="2018data">
							<iframe id='iframes' src=./2018data/processState18.jsp>
							</iframe>
						</div>
					</div>
				</div>
			</div>
			<!-- /1st row -->

			<!-- 3rd row -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card card-block" style="padding: 0rem; margin: 0rem">
						<h4 class="card-title m-b-2">
							<span id="visitors-chart-heading">시도 별 유기동물 분포</span>
						</h4>
						<div id="sido_bar">
							<iframe class='iframes2' src=./sido/sido_bar.jsp>
							</iframe>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card card-block" style="padding: 0rem; margin: 0rem">
						<h4 class="card-title m-b-2">머신러닝 입양률 예측</h4>
						<div id="mi_graph">
							<iframe class='iframes2' src=./ml/ml_graph.jsp></iframe>
							
						</div>
					</div>
				</div>

			<!-- /3rd row -->

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /page-content-wrapper -->

</body>

</html>