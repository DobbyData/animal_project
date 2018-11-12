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

 String sqlOld = "select count(case when sido='0' then 1 when sido='��⵵' then 1 end) as ��⵵," +
					"count(case when sido='1' then 1 when sido='����Ư����' then 1 end) as ����Ư����," +
					"count(case when sido='2' then 1 when sido='�λ걤����' then 1 end) as �λ걤����," +
					"count(case when sido='3' then 1 when sido='��󳲵�' then 1 end) as ��󳲵�," +
					"count(case when sido='4' then 1 when sido='��õ������' then 1 end) as ��õ������," +
					"count(case when sido='5' then 1 when sido='��û����' then 1 end) as ��û����," +
					"count(case when sido='6' then 1 when sido='������' then 1 end) as ������," +
					"count(case when sido='7' then 1 when sido='�뱸������' then 1 end) as �뱸������," +
					"count(case when sido='8' then 1 when sido='����ϵ�' then 1 end) as ����ϵ�," +
					"count(case when sido='9' then 1 when sido='���ϵ�' then 1 end) as ���ϵ�," +
					"count(case when sido='10' then 1 when sido='����������' then 1 end) as ����������," +
					"count(case when sido='11' then 1 when sido='��걤����' then 1 end) as ��걤����," +
					"count(case when sido='12' then 1 when sido='��û�ϵ�' then 1 end) as ��û�ϵ�," +
					"count(case when sido='13' then 1 when sido='���󳲵�' then 1 end) as ���󳲵�," +
					"count(case when sido='14' then 1 when sido='����Ư����ġ��' then 1 end) as ����Ư����ġ��," +
					"count(case when sido='15' then 1 when sido='���ֱ�����' then 1 end) as ���ֱ�����," +
					"count(case when sido='16' then 1 when sido='����Ư����ġ��' then 1 end) as ����Ư����ġ�� " + 
				"from animal_total  where happenDt like'2018%';"; 

				
pstmtOld = conn.prepareStatement(sqlOld); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
System.out.println(pstmtOld);
rsOld = pstmtOld.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();

 while(rsOld.next()){
map = new HashMap<Object, Object>();
map.put("label", "��⵵");
map.put("y", rsOld.getInt("��⵵"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "����Ư����");
map.put("y", rsOld.getInt("����Ư����"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "�λ걤����");
map.put("y", rsOld.getInt("�λ걤����"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "��󳲵�");
map.put("y", rsOld.getInt("��󳲵�"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "��õ������");
map.put("y", rsOld.getInt("��õ������"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "��û����");
map.put("y", rsOld.getInt("��û����"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "������");
map.put("y", rsOld.getInt("������"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "�뱸������");
map.put("y", rsOld.getInt("�뱸������"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "��걤����");
map.put("y", rsOld.getInt("��걤����"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "��û�ϵ�");
map.put("y", rsOld.getInt("��û�ϵ�"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "���󳲵�");
map.put("y", rsOld.getInt("���󳲵�"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "����Ư����ġ��");
map.put("y", rsOld.getInt("����Ư����ġ��"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "���ֱ�����");
map.put("y", rsOld.getInt("���ֱ�����"));
list1.add(map);

map = new HashMap<Object, Object>();
map.put("label", "����Ư����ġ��");
map.put("y", rsOld.getInt("����Ư����ġ��"));
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
		title: "���⵿�� ��",
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