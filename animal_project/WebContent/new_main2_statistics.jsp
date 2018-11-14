<%-- 2페이지 화면 구성 --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
	<link href="css/menubar.css" rel="stylesheet">
	<!-- scripts -->
	<script src="assets/jquery/jquery-3.1.0.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/bootstrap4-alpha3.min.js"></script>
	<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="assets/web-analytics/overview.js"></script>

</head>
<link rel="stylesheet" type="text/css" href="./css/manubar.css">

<style>
	*{
	-moz-box-sizing: border-box;
	box-sizing: border-box;

	}

	#2018data{
	 position: relative;
	 border: 3px solid black;
	}
	
	#iframe1{
	 position:relative;
	 width:100%;
	 height:350px;
	 border: 0;
	}
	#iframe2{
	 position:relative;
	 width:100%;
	 height:750px;
	 border: 0;
	}
	#selectBox{
	 padding-left: 78.5%;
	 position:relative;
	 width:100%;
	 
	
	}
	input{
	 margin-left: 0.5em;
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
</head>
<body>

	
	<div class="container-fluid">

			<!-- 1st row -->
			<div class="row m-b-1">
				<div class="col-md-12">
					<div class="card card-block">
						<h4 class="card-title m-b-2">2018년 유기동물 데이터</h4>
						<div id="2018data">
							<iframe id="iframe1" src="./olddata/allGraph.jsp"></iframe>
						</div>
					</div>
				</div>
			</div>
			<!-- /1st row -->
			<!-- 1st row -->
			<div class="row m-b-1">
				<div class="col-md-12">
					<div class="card card-block">
						<h4 class="card-title m-b-2">"연도별 유기동물 보호상태 및 상세그래프"</h4>
				
					<div id="selectBox">
					<form action="./pie/pieBase2.jsp" target="iframe1" >
						<select name = "year" >
							<option value = 2017> 2017 </option>
							<option value = 2016> 2016 </option>
							<option value = 2015> 2015 </option>
						</select>
						<select name = "kind">
							<option value = "0"> 개 </option>
							<option value = "1"> 고양이 </option>
						</select>
						<input type="submit" value="보내기"> 
					</form>
				</div>
					<div class="pieZone">
						<iframe id='iframe2' name='iframe1' src="./pie/pieBase.jsp" ></iframe>
					</div>
					</div>
				</div>
			</div>
			<!-- /1st row -->
		</div>
		<!-- /.container-fluid -->	
	
	
	
	</body>
</html>