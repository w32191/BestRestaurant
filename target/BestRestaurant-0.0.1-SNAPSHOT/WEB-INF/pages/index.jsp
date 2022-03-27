<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="templatemo-flex-row flex-content-row">
					<div class="templatemo-content-widget white-bg col-2"></div>
					<div class="templatemo-content-widget white-bg col-1 text-center">


					</div>
					<div class="templatemo-content-widget white-bg col-1"></div>
				</div>
				<!-- 第一行結束 -->
			</div>

			<!-- 頁尾-->
			<%@include file="footer.jsp"%>
		</div>

	</div>
	<!-- Templatemo Script -->
	<script type="text/javascript" src="static/js/templatemo-script.js"></script>
</body>

</html>