<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page import="com.stock.model.allStock" %>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

List<allStock> stocks = (List<allStock>) request.getAttribute("stockData");
for (allStock stock : stocks){
    map = new HashMap<Object,Object>(); 
    map.put("label", stock.getDate()); 
    map.put("y",stock.getPrice()); 
    list.add(map);
} // This is the closing brace for the for loop

String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "Stock Detailes (All day)"
	},
	axisX: {
		crosshair: {
			enabled: true,
			snapToDataPoint: true
		}
	},
	axisY: {
		title: "Stock price",
		crosshair: {
			enabled: true,
			snapToDataPoint: true,
			valueFormatString: "##0.00",
		}
	},
	data: [{
		type: "area",
		yValueFormatString: "##0.00 million metric tons",
		dataPoints: <%out.print(dataPoints);%> 
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
</body>
</html>                 