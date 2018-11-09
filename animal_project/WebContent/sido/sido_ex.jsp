<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title: {
		text: "Military Expenditure of Countries: 2016"
	},
	axisX: {
		interval: 1
	},
	axisY: {
		title: "Expenses in Billion Dollars",
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
		dataPoints: [
			{ label: "Israel", y: 17.8, gdp: 5.8, url: "israel.png" },
			{ label: "United Arab Emirates", y: 22.8, gdp: 5.7, url: "uae.png" },
			{ label: "Brazil", y: 22.8, gdp: 1.3, url: "brazil.png"},
			{ label: "Australia", y: 24.3, gdp: 2.0, url: "australia.png" },
			{ label: "South Korea", y: 36.8, gdp: 2.7, url: "skorea.png" },
			{ label: "Germany", y: 41.1, gdp: 1.2, url: "germany.png" },
			{ label: "Japan", y: 46.1, gdp: 1.0, url: "japan.png" },
			{ label: "United Kingdom", y: 48.3, gdp: 1.9, url: "uk.png" },
			{ label: "India", y: 55.9, gdp: 2.5, url: "india.png" },
			{ label: "Russia", y: 69.2, gdp: 5.3, url: "russia.png" },
			{ label: "China", y: 215.7, gdp: 1.9, url: "china.png" },
			{ label: "United States", y: 611.2, gdp: 3.3, url: "us.png" }
		]
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