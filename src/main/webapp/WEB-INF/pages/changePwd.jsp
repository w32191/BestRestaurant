<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>變更密碼</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
          rel='stylesheet' type='text/css'>
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
</head>

<body>

<div class="templatemo-flex-row">
    <%-- 左側選單--%>
    <%@include file="LeftBarMenu.jsp" %>

    <%-- 右邊主頁內容--%>
    <div class="templatemo-content col-1 light-gray-bg">
        <%-- 上方選單--%>
        <%@include file="TopBarMenu.jsp" %>
        <%-- 下方內容--%>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                <h2 class="margin-bottom-10">變更密碼：</h2>
                <h2 class="margin-bottom-10"></h2>
                <form action="doChangePwd" class="templatemo-login-form" method="post">
                    <div class="row form-group">
                        <div class="col-lg-4 col-md-4 form-group">
                            <div>${accountBean.memberBean.name}</div>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-8 col-md-8 form-group">
                            <label for="inputCurrentPassword">請輸入舊密碼</label>
                            <input type="password" class="form-control" id="inputCurrentPassword"
                                   name="inputCurrentPassword" placeholder="********">
                            <span id="checkSpan01"></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-8 col-md-8 form-group">
                            <label for="inputNewPassword">請輸入新密碼：</label>
                            <input type="password" class="form-control" id="inputNewPassword"
                                   name="inputNewPassword" placeholder="********">
                            <span id="checkSpan02"></span>
                        </div>

                    </div>
                    <div class="row form-group">
                        <div class="col-lg-8 col-md-8 form-group">
                            <label for="inputConfirmNewPassword">再次輸入你的新密碼：</label>
                            <input type="password" class="form-control" id="inputConfirmNewPassword"
                                   name="inputConfirmNewPassword" placeholder="********">
                            <span id="checkSpan03"></span>
                        </div>
                    </div>
                    <div class="form-group text-right">
                        <button type="submit" class="templatemo-blue-button">Update</button>
                        <button type="reset" class="templatemo-white-button">Reset</button>
                    </div>
                </form>
                <div style="color:red">${result.error}</div>
                <div style="color:red">${result.result}</div>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script type="text/javascript" src="static/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="static/js/changePwd.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="static/js/bootstrap-filestyle.min.js"></script>
<!-- http://markusslima.github.io/bootstrap-filestyle/ -->
<script type="text/javascript" src="static/js/templatemo-script.js"></script>
<!-- Templatemo Script -->
</body>

</html>
