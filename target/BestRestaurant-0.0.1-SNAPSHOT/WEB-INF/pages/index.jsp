<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首頁</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!-- STYLE-->
    <link
            href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
            rel='stylesheet' type='text/css'>
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <script src="static/js/jquery-migrate-1.2.1.min.js"></script>
</head>

<body>

<div class="templatemo-flex-row">
    <%--  左側選單--%>
    <%@include file="LeftBarMenu.jsp" %>

    <%--  右邊主頁內容--%>
    <div class="templatemo-content col-1 light-gray-bg">

        <%--  上方選單--%>
        <%@include file="TopBarMenu.jsp" %>

        <%-- 下方內容--%>
        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <h2>請點左側功能：帳號資料管理、變更密碼</h2>
                </div>
            </div>
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <h2>帳號資料管理：</h2>
                    <br/>
                    <p>管理者帳號：可查看全部的帳號，且可 更新、刪除 所有帳號資料</p>
                    <p>使用者帳號：只查看、更新 自己的帳號資料，不可刪除帳號資料</p>
                    <p>新增、更新、刪除成功後，彈出提示告知結果</p>
                    <p>若欲新增、更新的帳號，於資料庫已有重複帳號，則彈出錯誤提示</p>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Templatemo Script -->
<script type="text/javascript" src="static/js/templatemo-script.js"></script>
</body>

</html>
