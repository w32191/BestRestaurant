<%@ page import="com.BestRestaurant.Entity.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首頁</title>
<meta name="description" content="">
<meta name="author" content="templatemo">
<%--
	Visual Admin Template
	https://templatemo.com/tm-455-visual-admin
	--%>
<!-- STYLE-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="static/css/font-awesome.min.css" rel="stylesheet">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/templatemo-style.css" rel="stylesheet">
<!-- JS -->
<script src="static/js/jquery-3.6.0.min.js"></script>
<!-- jQuery -->
<script src="static/js/jquery-migrate-1.2.1.min.js"></script>
<!--  jQuery Migrate Plugin -->
<script src="https://www.google.com/jsapi"></script>
<!-- Google Chart -->

</head>
<body>
	<div class="templatemo-flex-row">
		<%--  左側選單--%>
		<%@include file="LeftBarMenu.jsp"%>

		<%--  右邊主頁內容--%>
		<div class="templatemo-content col-1 light-gray-bg">

			<%--  上方選單--%>
			<%@include file="TopBarMenu.jsp"%>

			<%-- 下方內容--%>
			<div class="templatemo-content-container">
				<!-- 第一行-->
				<div class="templatemo-flex-row flex-content-row"></div>
				<!-- 第一行結束 -->
			</div>

			<!-- 頁尾-->
			<%@include file="footer.jsp"%>
		</div>
	</div>

	<%--	<script>--%>
	<%--      //google的長條圖＆圓餅圖--%>
	<%--      /* Google Chart--%>
	<%--			-------------------------------------------------------------------*/--%>
	<%--      // Load the Visualization API and the piechart package.--%>
	<%--      google.load('visualization', '1.0', {'packages': ['corechart']});--%>

	<%--      // Set a callback to run when the Google Visualization API is loaded.--%>
	<%--      google.setOnLoadCallback(drawChart);--%>

	<%--      // Callback that creates and populates a data table,--%>
	<%--      // instantiates the pie chart, passes in the data and--%>
	<%--      // draws it.--%>
	<%--      function drawChart() {--%>

	<%--        // Create the data table.--%>
	<%--        var data = new google.visualization.DataTable();--%>
	<%--        data.addColumn('string', 'Topping');--%>
	<%--        data.addColumn('number', 'Slices');--%>
	<%--        data.addRows([--%>
	<%--          ['Mushrooms', 3],--%>
	<%--          ['Onions', 1],--%>
	<%--          ['Olives', 1],--%>
	<%--          ['Zucchini', 1],--%>
	<%--          ['Pepperoni', 2]--%>
	<%--        ]);--%>

	<%--        // Set chart options--%>
	<%--        var options = {'title': 'How Much Pizza I Ate Last Night'};--%>

	<%--        // Instantiate and draw our chart, passing in some options.--%>
	<%--        var pieChart = new google.visualization.PieChart(--%>
	<%--            document.getElementById('pie_chart_div'));--%>
	<%--        pieChart.draw(data, options);--%>

	<%--        var barChart = new google.visualization.BarChart(--%>
	<%--            document.getElementById('bar_chart_div'));--%>
	<%--        barChart.draw(data, options);--%>
	<%--      }--%>

	<%--      $(document).ready(function () {--%>
	<%--        if ($.browser.mozilla) {--%>
	<%--          //refresh page on browser resize--%>
	<%--          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/--%>
	<%--          $(window).bind('resize', function (e) {--%>
	<%--            if (window.RT) {--%>
	<%--              clearTimeout(window.RT);--%>
	<%--            }--%>
	<%--            window.RT = setTimeout(function () {--%>
	<%--              this.location.reload(false); /* false to get page from cache */--%>
	<%--            }, 200);--%>
	<%--          });--%>
	<%--        } else {--%>
	<%--          $(window).resize(function () {--%>
	<%--            drawChart();--%>
	<%--          });--%>
	<%--        }--%>
	<%--      });--%>

	<%--	</script>--%>

	<!-- Templatemo Script -->
	<script type="text/javascript" src="static/js/templatemo-script.js"></script>


</body>

</html>