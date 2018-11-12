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
    //theme: "light2", // "light1", "light2", "dark1", "dark2"
    animationEnabled: true,
    title:{
        text: "2018�� ���⵿�� ������ ����"  
    },
    subtitles: [{
        text: "Try Clicking and Hovering over Legends!"
    }],
    axisX: {
        lineColor: "black",
        labelFontColor: "black"
    },
    axisY2: {
          gridThickness: 0,
        title: "% of Population",
        suffix: "%",
        titleFontColor: "black",
        labelFontColor: "black"
    },
    legend: {
        cursor: "pointer",
        itemmouseover: function(e) {
            e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness * 2;
            e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize + 2;
            e.chart.render();
        },
        itemmouseout: function(e) {
            e.dataSeries.lineThickness = e.chart.data[e.dataSeriesIndex].lineThickness / 2;
            e.dataSeries.markerSize = e.chart.data[e.dataSeriesIndex].markerSize - 2;
            e.chart.render();
        },
        itemclick: function (e) {
            if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                e.dataSeries.visible = false;
            } else {
                e.dataSeries.visible = true;
            }
            e.chart.render();
        }
    },
    toolTip: {
        shared: true
    },
    data: [{
        type: "spline",
        name: "��ȣ��",
        markerSize: 5,
          axisYType: "secondary",
        xValueFormatString: "YYYY",
        yValueFormatString: "#,##0.0\"%\"",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints1);%>
    },
    {
        type: "spline",
        name: "�ڿ���/�ȶ���",
        markerSize: 5,
        axisYType: "secondary",
        xValueFormatString: "YYYY",
        yValueFormatString: "#,##0.0\"%\"",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints2);%>
    },
    {
        type: "spline",
        name: "�Ծ�/����",
        markerSize: 5,
        axisYType: "secondary",
        xValueFormatString: "YYYY",
        yValueFormatString: "#,##0.0\"%\"",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints3);%>
    },
    {
        type: "spline",
        showInLegend: true,
        name: "��",
        markerSize: 5,
        axisYType: "secondary",
        yValueFormatString: "#,##0.0\"%\"",
        xValueFormatString: "YYYY",
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
