<%-- �⺻ Pie �׷��� (selectBox���� ���� �ޱ� ���� ��Ÿ������ ��) --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="animal_project.DBConn" %>
<%
   Connection conn = DBConn.getMySqlConnection();
   //Parameter
   PreparedStatement pstmtPie = null;
   ResultSet rsPie = null;
    request.setCharacterEncoding("euc-kr");
   String reYear = request.getParameter("year");
   String reKind = request.getParameter("kind");

   String strKind = null;
   if (reKind.equals("1")){   // �ι�° �Ķ���ͷ� �������� �Է��� �� �ֵ��� ���� ��
      strKind = "Cats";
   }else{
      strKind = "Dogs";
   }
   
   String sqlPie = "select count(case when processState_Pre='C' then 1 end) as C, " + 
         "count(case when processState_Pre='A' then 1 end) as A, " + 
         "count(case when processState_Pre='D' then 1 end) as D, " + 
         "count(case when processState_Pre='R' then 1 end) as R,   " + 
         "count(case when processState_Pre='E' then 1 end) as E " +
         "from animal_total where happenDt like ? and kind=?;";
         
   pstmtPie = conn.prepareStatement(sqlPie); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
   pstmtPie.setString(1, reYear+'%');
   pstmtPie.setString(2, reKind);
   rsPie = pstmtPie.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   System.out.println(pstmtPie);      // ������ Ȯ��

   String sqlA1 = "select sido,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY sido ORDER BY sido asc;";
   PreparedStatement pstmtA1 = conn.prepareStatement(sqlA1); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtA1.setString(1, reYear+'%');
   pstmtA1.setString(2, reKind);
   ResultSet rsA1 = pstmtA1.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   String sqlA2 = "select age_u,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY age_u ORDER BY age_u asc;";
   PreparedStatement pstmtA2 = conn.prepareStatement(sqlA2); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtA2.setString(1, reYear+'%');
   pstmtA2.setString(2, reKind);
   ResultSet rsA2 = pstmtA2.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlA3 = "select size,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY size ORDER BY size asc;";
   PreparedStatement pstmtA3 = conn.prepareStatement(sqlA3); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
   pstmtA3.setString(1, reYear+'%');
   pstmtA3.setString(2, reKind);
   ResultSet rsA3 = pstmtA3.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlA4 = "select happenMth,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY happenMth ORDER BY happenMth asc;";
   PreparedStatement pstmtA4 = conn.prepareStatement(sqlA4); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtA4.setString(1, reYear+'%');
   pstmtA4.setString(2, reKind);
   ResultSet rsA4 = pstmtA4.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.    

   String sqlA5 = "select sexCd,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY sexCd ORDER BY sexCd asc;";
   PreparedStatement pstmtA5 = conn.prepareStatement(sqlA5); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtA5.setString(1, reYear+'%');
   pstmtA5.setString(2, reKind);
   ResultSet rsA5 = pstmtA5.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlA6 = "select neuterYn,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='A' GROUP BY neuterYn ORDER BY neuterYn asc;";
   PreparedStatement pstmtA6 = conn.prepareStatement(sqlA6); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtA6.setString(1, reYear+'%');
   pstmtA6.setString(2, reKind);
   ResultSet rsA6 = pstmtA6.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   String sqlD1 = "select sido,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY sido ORDER BY sido asc;";
   PreparedStatement pstmtD1 = conn.prepareStatement(sqlD1); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD1.setString(1, reYear+'%');
   pstmtD1.setString(2, reKind);
   ResultSet rsD1 = pstmtD1.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   String sqlD2 = "select age_u,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY age_u ORDER BY age_u asc;";
   PreparedStatement pstmtD2 = conn.prepareStatement(sqlD2); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD2.setString(1, reYear+'%');
   pstmtD2.setString(2, reKind);
   ResultSet rsD2 = pstmtD2.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlD3 = "select size,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY size ORDER BY size asc;";
   PreparedStatement pstmtD3 = conn.prepareStatement(sqlD3); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD3.setString(1, reYear+'%');
   pstmtD3.setString(2, reKind);
   ResultSet rsD3 = pstmtD3.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlD4 = "select happenMth,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY happenMth ORDER BY happenMth asc;";
   PreparedStatement pstmtD4 = conn.prepareStatement(sqlD4); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD4.setString(1, reYear+'%');
   pstmtD4.setString(2, reKind);
   ResultSet rsD4 = pstmtD4.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.    

   String sqlD5 = "select sexCd,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY sexCd ORDER BY sexCd asc;";
   PreparedStatement pstmtD5 = conn.prepareStatement(sqlD5); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD5.setString(1, reYear+'%');
   pstmtD5.setString(2, reKind);
   ResultSet rsD5 = pstmtD5.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlD6 = "select neuterYn,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='D' GROUP BY neuterYn ORDER BY neuterYn asc;";
   PreparedStatement pstmtD6 = conn.prepareStatement(sqlD6); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtD6.setString(1, reYear+'%');
   pstmtD6.setString(2, reKind);
   ResultSet rsD6 = pstmtD6.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   String sqlR1 = "select sido,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY sido ORDER BY sido asc;";
   PreparedStatement pstmtR1 = conn.prepareStatement(sqlR1); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR1.setString(1, reYear+'%');
   pstmtR1.setString(2, reKind);
   ResultSet rsR1 = pstmtR1.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   String sqlR2 = "select age_u,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY age_u ORDER BY age_u asc;";
   PreparedStatement pstmtR2 = conn.prepareStatement(sqlR2); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR2.setString(1, reYear+'%');
   pstmtR2.setString(2, reKind);
   ResultSet rsR2 = pstmtR2.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlR3 = "select size,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY size ORDER BY size asc;";
   PreparedStatement pstmtR3 = conn.prepareStatement(sqlR3); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR3.setString(1, reYear+'%');
   pstmtR3.setString(2, reKind);
   ResultSet rsR3 = pstmtR3.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlR4 = "select happenMth,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY happenMth ORDER BY happenMth asc;";
   PreparedStatement pstmtR4 = conn.prepareStatement(sqlR4); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR4.setString(1, reYear+'%');
   pstmtR4.setString(2, reKind);
   ResultSet rsR4 = pstmtR4.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.    

   String sqlR5 = "select sexCd,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY sexCd ORDER BY sexCd asc;";
   PreparedStatement pstmtR5 = conn.prepareStatement(sqlR5); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR5.setString(1, reYear+'%');
   pstmtR5.setString(2, reKind);
   ResultSet rsR5 = pstmtR5.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 

   String sqlR6 = "select neuterYn,COUNT(*) as count from animal_total where happenDt like ? and kind=? and processState_Pre='R' GROUP BY neuterYn ORDER BY neuterYn asc;";
   PreparedStatement pstmtR6 = conn.prepareStatement(sqlR6); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�. 
   pstmtR6.setString(1, reYear+'%');
   pstmtR6.setString(2, reKind);
   ResultSet rsR6 = pstmtR6.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�. 
   
   int total = 0;
   
   Gson gsonObj = new Gson();
   Map<Object,Object> map = null;
   List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
   while(rsPie.next()){
      map = new HashMap<Object, Object>(); map.put("label", "�Ծ�/����"); map.put("y", rsPie.getInt("A")); map.put("color", "#6d78ad"); list.add(map);
      map = new HashMap<Object, Object>(); map.put("label", "�ȶ���/�ڿ���"); map.put("y", rsPie.getInt("D")); map.put("color", "#51cda0"); list.add(map);
      map = new HashMap<Object, Object>(); map.put("label", "��ȯ"); map.put("y", rsPie.getInt("R")); map.put("color", "#df7970"); list.add(map);
      map = new HashMap<Object, Object>(); map.put("label", "��Ÿ"); map.put("y", rsPie.getInt("C")+rsPie.getInt("E")); map.put("color", "#4c9ca0"); list.add(map);
      
      total = rsPie.getInt("A")+rsPie.getInt("D")+rsPie.getInt("R")+rsPie.getInt("C")+rsPie.getInt("E");
   }   
   String dataPoints = gsonObj.toJson(list);
   //System.out.println(total);
   //System.out.println(dataPoints);
   
   
   // Sido ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA1.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA1.getString("sido")); map.put("y", rsA1.getInt("count")); list.add(map);
   }
   String sidoA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD1.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD1.getString("sido")); map.put("y", rsD1.getInt("count")); list.add(map);
   }
   String sidoD = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsR1.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR1.getString("sido")); map.put("y", rsR1.getInt("count")); list.add(map);
   }
   String sidoR = gsonObj.toJson(list);
   
   // Age ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA2.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA2.getString("age_u")); map.put("y", rsA2.getInt("count")); list.add(map);
   }
   String ageA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD2.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD2.getString("age_u")); map.put("y", rsD2.getInt("count")); list.add(map);
   }
   String ageD = gsonObj.toJson(list);   
   list = new ArrayList<Map<Object,Object>>();
   while(rsR2.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR2.getString("age_u")); map.put("y", rsR2.getInt("count")); list.add(map);
   }
   String ageR = gsonObj.toJson(list);

   // Size ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA3.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA3.getString("size")); map.put("y", rsA3.getInt("count")); list.add(map);
   }
   String sizeA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD3.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD3.getString("size")); map.put("y", rsD3.getInt("count")); list.add(map);
   }
   String sizeD = gsonObj.toJson(list);   
   list = new ArrayList<Map<Object,Object>>();
   while(rsR3.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR3.getString("size")); map.put("y", rsR3.getInt("count")); list.add(map);
   }
   String sizeR = gsonObj.toJson(list);
   
   // happenMth ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA4.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA4.getString("happenMth")); map.put("y", rsA4.getInt("count")); list.add(map);
   }
   String happenMthA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD4.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD4.getString("happenMth")); map.put("y", rsD4.getInt("count")); list.add(map);
   }
   String happenMthD = gsonObj.toJson(list);   
   list = new ArrayList<Map<Object,Object>>();
   while(rsR4.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR4.getString("happenMth")); map.put("y", rsR4.getInt("count")); list.add(map);
   }
   String happenMthR = gsonObj.toJson(list);
   
   // SexCd ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA5.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA5.getString("sexCd")); map.put("y", rsA5.getInt("count")); list.add(map);
   }
   String sexCdA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD5.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD5.getString("sexCd")); map.put("y", rsD5.getInt("count")); list.add(map);
   }
   String sexCdD = gsonObj.toJson(list);   
   list = new ArrayList<Map<Object,Object>>();
   while(rsR5.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR5.getString("sexCd")); map.put("y", rsR5.getInt("count")); list.add(map);
   }
   String sexCdR = gsonObj.toJson(list);

   // neuterYn ������
   list = new ArrayList<Map<Object,Object>>();
   while(rsA6.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsA6.getString("neuterYn")); map.put("y", rsA6.getInt("count")); list.add(map);
   }
   String neuterYnA = gsonObj.toJson(list);
   list = new ArrayList<Map<Object,Object>>();
   while(rsD6.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsD6.getString("neuterYn")); map.put("y", rsD6.getInt("count")); list.add(map);
   }
   String neuterYnD = gsonObj.toJson(list);   
   list = new ArrayList<Map<Object,Object>>();
   while(rsR6.next()){
      map = new HashMap<Object, Object>(); map.put("label", rsR6.getString("neuterYn")); map.put("y", rsR6.getInt("count")); list.add(map);
   }
   String neuterYnR = gsonObj.toJson(list);
   System.out.println("������ ���� �Ϸ�");
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
   #wrap {
      width:99%;
      height:90%;
      position:absolute;
      margin: 0;
      padding: 0;
   }
   
   #graphZone1{
      float: left;
      width:38%;
      height:100%;
      position:relation;
   }
      
   #graphZone2{
      float: right;
      width:60%;
      height:100%;
      position:relation;
   }
   #graphPart1{
      width:100%;
      height:33%;
      position:relative;
   }
   #graphPart2{
      width:100%;
      height:33%;
      position:relative;
   }
   #graphPart3{
      width:100%;
      height:33%;
      position:relative;
   }   

   
   .iframe{
      width:100%;
      height:100%;
      position:relative;
      margin:0;
      border:0;
   }
</style>
<script type="text/javascript">
window.onload = function () {
 
var totalVisitors = <%out.print(total);%>;
var abandonedData = {
   "Abandoned Animal": [{
      click: ChartDrilldownHandler,
      cursor: "pointer",
      explodeOnClick: false,
      innerRadius: "60%",
      legendMarkerType: "square",
      name: "Abandoned Animal",
      radius: "75%",
      showInLegend: true,
      startAngle: 0,
      type: "doughnut",
      yValueFormatString: "#,##0",
      indexLabel: "{label}: {y}",
      toolTipContent: "{y}",
      dataPoints: <%out.print(dataPoints);%>
   }],
   "�Ծ�/����": [[{
         name: "���⵿�� ��ȣ ����",
         color: "#6d78ad",
         type: "column",
         xValueType: "count",
         dataPoints: <%out.print(sidoA);%>}],
      [{
         name: "���⵿�� ���� ����",
         color: "#6d78ad",
         type: "column",
         yValueType: "count",
         dataPoints: <%out.print(ageA);%>}],
      [{
         name: "���⵿�� ������",
         color: "#6d78ad",
         type: "column",
         yValueType: "count",
         dataPoints: <%out.print(sizeA);%>}],
      [{
         name: "���⵿�� �߻� �ñ�",
         color: "#6d78ad",
         type: "column",
         yValueType: "count",
         dataPoints: <%out.print(sizeA);%>}],
      [{
         name: "���⵿�� ����",
         color: "#6d78ad",
         type: "column",
         yValueType: "count",
         dataPoints: <%out.print(sexCdA);%>}],
      [{
         name: "���⵿�� �߼�ȭ ����",
         color: "#6d78ad",
         type: "column",
         yValueType: "count",
         dataPoints: <%out.print(neuterYnA);%>}]],
   "�ȶ���/�ڿ���": [[{
      name: "���⵿�� ��ȣ ����",
      color: "#51cda0",
      type: "column",
      xValueType: "count",
      dataPoints: <%out.print(sidoD);%>}],
   [{
      name: "���⵿�� ���� ����",
      color: "#51cda0",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(ageD);%>}],
   [{
      name: "���⵿�� ������",
      color: "#51cda0",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sizeD);%>}],
   [{
      name: "���⵿�� �߻� �ñ�",
      color: "#51cda0",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sizeD);%>}],
   [{
      name: "���⵿�� ����",
      color: "#51cda0",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sexCdD);%>}],
   [{
      name: "���⵿�� �߼�ȭ ����",
      color: "#51cda0",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(neuterYnD);%>}]],
   "��ȯ": [[{
      name: "���⵿�� ��ȣ ����",
      color: "#df7970",
      type: "column",
      xValueType: "count",
      dataPoints: <%out.print(sidoR);%>}],
   [{
      name: "���⵿�� ���� ����",
      color: "#df7970",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(ageR);%>}],
   [{
      name: "���⵿�� ������",
      color: "#df7970",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sizeR);%>}],
   [{
      name: "���⵿�� �߻� �ñ�",
      color: "#df7970",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sizeR);%>}],
   [{
      name: "���⵿�� ����",
      color: "#df7970",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(sexCdR);%>}],
   [{
      name: "���⵿�� �߼�ȭ ����",
      color: "#df7970",
      type: "column",
      yValueType: "count",
      dataPoints: <%out.print(neuterYnR);%>}]]
};
 
var pieOptions = {
      animationEnabled: true,
      theme: "light2",
      title: {
         text: <%out.print(reYear);%>+"�� ���⵿�� ��ȣ����"
      },
      legend: {
         fontFamily: "calibri",
         fontSize: 14,
         itemTextFormatter: function (e) {
            return e.dataPoint.label + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
         }
      },
   data: []
};
 
var DrilldownedChartOptions = {
   animationEnabled: true,
   theme: "light2",
   axisX:{
         labelFontColor: "black",
         labelFontWeight: "bold",
         labelFontSize: 12
         },
   data: []
};
 
var chart = new CanvasJS.Chart("chartContainer", pieOptions);
chart.options.data = abandonedData["Abandoned Animal"];
chart.render();
 
function ChartDrilldownHandler(e) {
   //alert(JSON.stringify(abandonedData[e.dataPoint.label][0]));      // ���� �Ķ������ ������ Ȯ��
   //alert(JSON.stringify(abandonedData[e.dataPoint.label][0][0]["name"]));
   chart = new CanvasJS.Chart("sido", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][0];
   chart.options.title = { text: abandonedData[e.dataPoint.label][0][0]["name"] }
   chart.render();   
   chart = new CanvasJS.Chart("age", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][1];
   chart.options.title = { text: abandonedData[e.dataPoint.label][1][0]["name"] }
   chart.render();   
   chart = new CanvasJS.Chart("size", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][2];
   chart.options.title = { text: abandonedData[e.dataPoint.label][2][0]["name"] }
   chart.render();   
   chart = new CanvasJS.Chart("happenMth", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][3];
   chart.options.title = { text: abandonedData[e.dataPoint.label][3][0]["name"] }
   chart.render();   
   chart = new CanvasJS.Chart("sex", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][4];
   chart.options.title = { text: abandonedData[e.dataPoint.label][4][0]["name"] }
   chart.render();   
   chart = new CanvasJS.Chart("neuter", DrilldownedChartOptions);
   chart.options.data = abandonedData[e.dataPoint.label][5];
   chart.options.title = { text: abandonedData[e.dataPoint.label][5][0]["name"] }
   chart.render();   
}
}
</script>
<style>
</style>
</head>
<body>
<div id="wrap">
   <div id="graphZone1">
      <div id="chartContainer" style="height: 100%; width: 99%;"></div>
   </div>
   <div id="graphZone2">      
   
      <div id="graphPart1">
            <div id="sido" style="height: 100%; width: 48%; float:left;"></div>
            <div id="happenMth" style="height: 100%; width: 50%; float:left;"></div>
      </div>      
      <div id="graphPart2">
            <div id="age" style="height: 100%; width: 48%; float:left;"></div>
            <div id="size" style="height: 100%; width: 50%; float:left;"></div>
      </div>
      <div id="graphPart3">
            <div id="sex" style="height: 100%; width: 48%; float:left;"></div>
            <div id="neuter" style="height: 100%; width: 50%; float:left;"></div>
      </div>
   </div>
</div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>        