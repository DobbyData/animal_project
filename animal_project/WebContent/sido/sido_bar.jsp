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

 String sqlOld = "select count(case when sido='0' then 1 when sido='경기도' then 1 end) as 경기도," +
					"count(case when sido='1' then 1 when sido='서울특별시' then 1 end) as 서울특별시," +
					"count(case when sido='2' then 1 when sido='부산광역시' then 1 end) as 부산광역시," +
					"count(case when sido='3' then 1 when sido='경상남도' then 1 end) as 경상남도," +
					"count(case when sido='4' then 1 when sido='인천광역시' then 1 end) as 인천광역시," +
					"count(case when sido='5' then 1 when sido='충청남도' then 1 end) as 충청남도," +
					"count(case when sido='6' then 1 when sido='강원도' then 1 end) as 강원도," +
					"count(case when sido='7' then 1 when sido='대구광역시' then 1 end) as 대구광역시," +
					"count(case when sido='8' then 1 when sido='전라북도' then 1 end) as 전라북도," +
					"count(case when sido='9' then 1 when sido='경상북도' then 1 end) as 경상북도," +
					"count(case when sido='10' then 1 when sido='대전광역시' then 1 end) as 대전광역시," +
					"count(case when sido='11' then 1 when sido='울산광역시' then 1 end) as 울산광역시," +
					"count(case when sido='12' then 1 when sido='충청북도' then 1 end) as 충청북도," +
					"count(case when sido='13' then 1 when sido='전라남도' then 1 end) as 전라남도," +
					"count(case when sido='14' then 1 when sido='제주특별자치도' then 1 end) as 제주특별자치도," +
					"count(case when sido='15' then 1 when sido='광주광역시' then 1 end) as 광주광역시," +
					"count(case when sido='16' then 1 when sido='세종특별자치시' then 1 end) as 세종특별자치시 " + 
				"from animal_total  where happenDt like'2018%';"; 

				
pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement에서 해당 sql을 미리 컴파일한다. 
System.out.println(pstmtOld);
rsOld = pstmtOld.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다. 


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

 while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", "경기도");
map.put("y", rsOld.getInt("경기도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "서울특별시");
map.put("y", rsOld.getInt("서울특별시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "부산광역시");
map.put("y", rsOld.getInt("부산광역시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "경상남도");
map.put("y", rsOld.getInt("경상남도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "인천광역시");
map.put("y", rsOld.getInt("인천광역시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "충청남도");
map.put("y", rsOld.getInt("충청남도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "강원도");
map.put("y", rsOld.getInt("강원도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "대구광역시");
map.put("y", rsOld.getInt("대구광역시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "울산광역시");
map.put("y", rsOld.getInt("울산광역시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "충청북도");
map.put("y", rsOld.getInt("충청북도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "전라남도");
map.put("y", rsOld.getInt("전라남도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "제주특별자치도");
map.put("y", rsOld.getInt("제주특별자치도"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "광주광역시");
map.put("y", rsOld.getInt("광주광역시"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "세종특별자치시");
map.put("y", rsOld.getInt("세종특별자치시"));
list1.add(map);

}
 


String dataPoints1 = gsonObj.toJson(list1);
/* System.out.println(dataPoints1);
System.out.println(dataPoints2);
System.out.println(dataPoints3);
System.out.println(dataPoints4); */
System.out.println(dataPoints1);
%>


<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	
	axisX: {
		interval: 1
	},
	axisY: {
		title: "유기동물 수",
		scaleBreaks: {
			type: "wavy",
			customBreaks: [{
				startValue: 80,
				endValue: 210
				},
				{
					startValue: 230,
					endValue: 600
				}
		]}
	},
	data: [{
		type: "bar",
		toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
		dataPoints:<%out.print(dataPoints1);%>
	}]
});
chart.render();

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>