<%-- �⺻ Pie �׷��� (selectBox���� ���� �ޱ� ���� ��Ÿ������ ��) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="animal_project.DBConn" %>
<%
Connection conn = DBConn.getMySqlConnection();
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "select happenDt, count(case when processState='��ȣ��' then 1 end) as ��ȣ��, " + 
				"count(case when processState like '%�ڿ���%' then 1 when processState like '%�ȶ���%' then 1 end) as �ڿ��ȶ���, " + 
				"count(case when processState like '%�Ծ�%' then 1 when processState like'%����%' then 1 end) as �Ծ����," + 
				"count(*) as �� from animal_total where happenDt like '2018%' " + 
				"group by happenDt order by happenDt asc;";
				
pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
System.out.println(pstmt);

rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

int total = 0;
	
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
	List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
	List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
	List<Map<Object,Object>> list4 = new ArrayList<Map<Object,Object>>();
	
	while(rs.next()){
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("��ȣ��"));
	list1.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("�ڿ��ȶ���"));
	list2.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("�Ծ����"));
	list3.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("��"));
	list4.add(map);
	}
	String dataPoints1 = gsonObj.toJson(list1);
	String dataPoints2 = gsonObj.toJson(list2);
	String dataPoints3 = gsonObj.toJson(list3);
	String dataPoints4 = gsonObj.toJson(list4);

	System.out.println(dataPoints1);
	System.out.println(dataPoints2);
	System.out.println(dataPoints3);
	System.out.println(dataPoints4);

%>


<!DOCTYPE HTML>
<html>
<head>  
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title:{
		text: "2018 ���⵿�� ��Ȳ"
	},
	axisY:{ 
		title: "Percentage",
		includeZero: false, 
		interval: .2,
		suffix: "%",
		valueFormatString: "#.0"
	},
	data: [{
		type: "stepLine",
		name: "��ȣ��",
		yValueFormatString: "#0.0\"%\"",
		xValueFormatString: "MMM YYYY",
		markerSize: 5,
		dataPoints: <%out.print(dataPoints1);%>
	},
	{
		type: "stepLine",
		name: "�ڿ���/�ȶ���",
		yValueFormatString: "#0.0\"%\"",
		xValueFormatString: "MMM YYYY",
		markerSize: 5,
		dataPoints: <%out.print(dataPoints2);%>
	},
	{
		type: "stepLine",
		name: "�Ծ�/����",
		yValueFormatString: "#0.0\"%\"",
		xValueFormatString: "MMM YYYY",
		markerSize: 5,
		dataPoints: <%out.print(dataPoints3);%>
	},
	{
		type: "stepLine",
		name: "��",
		yValueFormatString: "#0.0\"%\"",
		xValueFormatString: "MMM YYYY",
		markerSize: 5,
		dataPoints: <%out.print(dataPoints4);%>
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