<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
          rel='stylesheet' type='text/css'>
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
    <link href="static/jquery-ui-1.13.1.custom/jquery-ui.min.css" rel="stylesheet">
    <style>
      #insertForm {
        padding: 0 20%;
      }
    </style>
    <!-- jQuery -->
    <script type="text/javascript" src="static/js/jquery-3.6.0.min.js"></script>
    <script src="static/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    <script src="static/js/login.js"></script>
</head>

<body class="light-gray-bg">
<%@include file="ManageUserIncludePage.jsp" %>

<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>ＵＳＥＲ ＬＯＧＩＮ</h1>
    </header>
    <form action="loginController.login" class="templatemo-login-form" method="post">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">
                    <label for="accountInput"><i class="fa fa-user fa-fw"></i></label>
                </div>
                <input type="text" class="form-control" name="account" id="accountInput"/>
            </div>
            <div style="color:red">${errors.name}</div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">
                    <label for="pwdInput"><i class="fa fa-key fa-fw"></i></label>
                </div>
                <input type="password" class="form-control" name="pwd" id="pwdInput">
            </div>
            <div style="color:red">${errors.pwd}</div>
        </div>
        <div class="form-group">
            <div class="checkbox squaredTwo">

                <input type="button" value="管理者一鍵輸入" id="adminBtn"
                       class="templatemo-edit-btn edit1">
                <input type="button" value="使用者一鍵輸入" id="userBtn" class="templatemo-edit-btn edit1">
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">登入</button>
        </div>
        <div class="form-group">
            <input type="button" id="insertBtn" value="註冊帳號"
                   class="templatemo-white-button width-100"/>
        </div>

        <div style="color:red">${errors.result}</div>
    </form>
</div>

<!-- 新增帳號-->
<div id="dialog" title="新增帳號">
    <form action="insertMember" method="post" id="insertForm">
        <p>
            <label for="insertName">姓名</label> <input type="text"
                                                      name="insertName" id="insertName"
                                                      value="管理者">
        </p>
        <p>
            <label for="insertAccount">帳號</label> <input type="text"
                                                         name="insertAccount"
                                                         id="insertAccount"
                                                         value="admin">
        </p>
        <p>
            <label for="insertPwd">密碼</label> <input type="text"
                                                     name="insertPwd" id="insertPwd"
                                                     value="aa">
        </p>
        <p>
            <label for="insertGender">性別</label> <select name="insertGender"
                                                         id="insertGender">
            <option value="1">男</option>
            <option value="2">女</option>
        </select>
        </p>
        <p>
            <label for="insertAddress">地址</label>
            <input type="text" name="insertAddress" id="insertAddress" value="Taiwan">
        </p>
        <p>
            <label for="insertTel">電話</label>
            <input type="text" name="insertTel" id="insertTel" value="0900123456">
        </p>
        <p>
            <label for="insertPerssion">權限</label>
            <select name="insertPerssion" id="insertPerssion">
                <option value="99" selected>管理者</option>
                <option value="1">一般帳號</option>
                <option value="2">門市人員</option>
            </select>
        </p>
        <input type="hidden" value="false" name="isLogin"/>
    </form>
</div>
<div id="dialogResult" title="結果">
    <span id="result-content"></span>
</div>
</body>

</html>
