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


<title>Document</title>

<style type ="text/css">
		
		*{
	-moz-box-sizing: border-box;
	box-sizing: border-box;

		}	
		html,body{
		width:100%;
		height:100%;
		margin:0;
		padding:0;
		position:absolute;
	
	}
		#wrap{
			width:100%;
			height:100%;
			position:relative;
			border: 1px solid black;
			
		}
		
		#side_top{
			width:100%;
			height:50%;
			position: relative;
			border: 1px solid black;
		}
		
		#side_bottom{
			width:100%;
			height:50%;
			position: absolute;
			border: 1px solid black;
		}
		
		#top_left{
			width:75%;
			height:100%;
			float:left;
			position: relative;
			border: 1px solid black;
		}
		
		#top_right{
			width:25%;
			height:100%;
			float:right;
			position: relative;
			border: 1px solid black;
		}
		
		#bottom_left{
			width:60%;
			height:100%;
			float:left;
			position: relative;
			border: 1px solid black;
		}
		
		#bottom_right{
			width:40%;
			height:100%;
			float:right;
			position: relative;
			border: 1px solid black;
		}	
		
		.iframe{
	      width:99%;
	      height:99%;
	      position:relative;
	      margin:0% 0.5% 0% 0.5%;
	      background-color:white;
	      border-radius: 10px;
      }
		
</style>
</head>

<body>
<div id=wrap>
		<div id = "side_top">
			<div id = "top_left"  style="float:left;">위 왼쪽</div>
			<div id = "top_right"  style="float:right;">위 오른쪽</div>
		</div>
		<div id = "side_bottom">
			<div id = "	bottom_left"  style="float:left;">아래 왼쪽</div>
			<div id = "bottom_right"  style="float:right;">
				<iframe class="iframe" src="../ml/ml_graph.jsp"></iframe>  
			</div>
		</div>
		
</div>
</body>
</html>