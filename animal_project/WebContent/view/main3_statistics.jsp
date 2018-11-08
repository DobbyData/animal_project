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
		#mid_content{
			width:70%;
			height:100%;
			position: absolute;
			float:left;
			border: 1px solid black;
		}
		#side_right{
			width:30%;
			height:100%;
			position: relative;
			float:right;
			border: 1px solid black;
		}
		
		#side_top{
			width:100%;
			height:70%;
			position: relative;
			border: 1px solid black;
		}
		
		#side_bottom{
			width:100%;
			height:30%;
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
		<div id = "mid_content">
				<div id = "side_top">         
					<iframe class="iframe" src="../ml/ml_graph.jsp"></iframe>   
				</div>
				<div id = "side_bottom">아래</div>	
		</div>
		<div id = "side_right">오른쪽 여백</div>
		
</div>
</body>
</html>