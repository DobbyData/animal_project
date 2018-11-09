<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="animal_project.DBConn" %>



<%
Connection conn = DBConn.getMySqlConnection();

PreparedStatement pstmtOld = null;
ResultSet rsOld = null;
//String sqlOld = "select adopted, n_adopted from ml_result where ydate='2018-11-07';";
String sqlOld = "select adopted, n_adopted from ml_result where id='1';";

pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 

rsOld = pstmtOld.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", "�Ծ�");
map.put("y", rsOld.getInt("adopted"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "�Ծ�X");
map.put("y", rsOld.getInt("n_adopted"));
list1.add(map);
}



String dataPoints1 = gsonObj.toJson(list1);
/* System.out.println(dataPoints1);
System.out.println(dataPoints2);
System.out.println(dataPoints3);
System.out.println(dataPoints4); */
%>




<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function() {

var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "���⵿�� �Ծ� ���� ��Ȳ"
	},
	data: [{
		type: "pie",
		startAngle: 25,
		toolTipContent: "<b>{label}</b>: {y}����",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}����",
		dataPoints:<%out.print(dataPoints1);%>
	}]
});
chart.render();

}
</script>
</head>

<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>

</html>