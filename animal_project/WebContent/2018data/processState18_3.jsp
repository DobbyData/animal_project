<%-- 기본 Pie 그래프 (selectBox에서 값을 받기 전에 나타나도록 함) --%>

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
String sql = "select happenDt, count(case when processState='보호중' then 1 end) as 보호중, " + 
				"count(case when processState like '%자연사%' then 1 when processState like '%안락사%' then 1 end) as 자연안락사, " + 
				"count(case when processState like '%입양%' then 1 when processState like'%기증%' then 1 end) as 입양기증," + 
				"count(*) as 총 from animal_total where happenDt like '2018%' " + 
				"group by happenDt order by happenDt asc;";
				
pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
System.out.println(pstmt);

rs = pstmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 

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
	map.put("y", rs.getInt("보호중"));
	list1.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("자연안락사"));
	list2.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("입양기증"));
	list3.add(map);
	
	map = new HashMap<Object, Object>();
	map.put("label", rs.getString("happenDt"));
	map.put("y", rs.getInt("총"));
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
    theme: "light2",
    title:{
        text: "2018 유기동물 현황"
    },
    axisX:{
        valueFormatString: "DD MMM",
        crosshair: {
            enabled: true,
            snapToDataPoint: true
        }
    },
    axisY: {
        title: "Number of Visits",
        crosshair: {
            enabled: true
        }
    },
    toolTip:{
        shared:true
    },  
    legend:{
        cursor:"pointer",
        verticalAlign: "bottom",
        horizontalAlign: "left",
        dockInsidePlotArea: true,
        itemclick: toogleDataSeries
    },
    data: [{
        type: "line",
        showInLegend: true,
        name: "보호중",
        markerType: "square",
        xValueFormatString: "DD MMM, YYYY",
        color: "#F08080",
        dataPoints: <%out.print(dataPoints1);%>
    },
    {
        type: "line",
        showInLegend: true,
        name: "자연사/안락사",
        lineDashType: "dash",
        dataPoints: <%out.print(dataPoints2);%>
    },

    {
        type: "line",
        showInLegend: true,
        name: "입양/기증",
        lineDashType: "dash",
        dataPoints: <%out.print(dataPoints3);%>
    },
    {
        type: "line",
        showInLegend: true,
        name: "총",
        lineDashType: "dash",
        dataPoints: <%out.print(dataPoints4);%>
    }]
});

chart.render();

function toogleDataSeries(e){
    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
    } else{
        e.dataSeries.visible = true;
    }
    chart.render();
}

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>