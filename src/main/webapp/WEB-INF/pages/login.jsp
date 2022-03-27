<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<meta name="description" content="">
<meta name="author" content="templatemo">
<%--        Visual Admin Template --%>
<%--        https://templatemo.com/tm-455-visual-admin --%>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="static/css/font-awesome.min.css" rel="stylesheet">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/templatemo-style.css" rel="stylesheet">

<script type="text/javascript" src="static/js/jquery-3.6.0.min.js"></script>
<script src="static/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
</head>

<body class="light-gray-bg">
	<script>
		$(function() {
			$('#adminBtn').click(function() {
				$('#accountInput').val('admin');
				$('#pwdInput').val('aa');
			});
			$('#userBtn').click(function() {
				$('#accountInput').val('user');
				$('#pwdInput').val('uu');
			});
		});
	</script>
	<div class="templatemo-content-widget templatemo-login-widget white-bg">
		<header class="text-center">
			<div class="square"></div>
			<h1>ＵＳＥＲ ＬＯＧＩＮ</h1>
		</header>

		<form action="loginController.login" class="templatemo-login-form"
			method="post">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<input type="text" class="form-control" name="account"
						id="accountInput">

				</div>
				<div style="color:red">${errors.name}</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-key fa-fw"></i>
					</div>
					<input type="password" class="form-control" name="pwd"
						id="pwdInput">

				</div>
				<div style="color:red">${errors.pwd}</div>
			</div>
			<div class="form-group">
				<div class="checkbox squaredTwo">
					<input type="button" value="管理者一鍵登入" id="adminBtn"
						class="templatemo-edit-btn edit1"> <input type="button"
						value="使用者一鍵登入" id="userBtn" class="templatemo-edit-btn edit1">
					<%-- <input type="checkbox" id="c1" name="cc"/> --%>
					<%-- <label for="c1"><span></span>Remember me</label> --%>
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="templatemo-blue-button width-100">Login</button>
			</div>
			<div style="color:red">${errors.result}</div>
		</form>
	</div>


</body>

</html>