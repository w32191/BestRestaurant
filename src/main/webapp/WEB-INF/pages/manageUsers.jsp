<%@ page contentType="text/html;charset=UTF-8" %>
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

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700'
          rel='stylesheet' type='text/css'>
    <link href="static/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/templatemo-style.css" rel="stylesheet">
    <link href="static/jquery-ui-1.13.1.custom/jquery-ui.min.css"
          rel="stylesheet">
    <style>
      #updateForm,
      #insertForm {
        padding: 0 20%;
      }
    </style>
    <!-- jQuery -->
    <script src="static/js/jquery-3.6.0.min.js"></script>
    <script src="static/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
    <!--JS-->
    <script src="static/js/manageUsers.js"></script>
</head>

<body>
<%@include file="ManageUserIncludePage.jsp" %>

<div class="templatemo-flex-row">
    <%-- 左側選單--%>
    <%@include file="LeftBarMenu.jsp" %>
    <%-- 右邊主頁內容--%>
    <div class="templatemo-content col-1 light-gray-bg">
        <%-- 上方選單--%>
        <%@include file="TopBarMenu.jsp" %>

        <%--   dialog用的空element   --%>
        <div id="dialogResult" title="結果">
            <span id="result-content"></span>
        </div>

        <%-- 下方內容--%>
        <div class="templatemo-content-container">

            <div class="templatemo-flex-row flex-content-row" id="insertBtnDiv">
                <button id="insertBtn" class="ui-button ui-widget ui-corner-all">新增帳號</button>
            </div>
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>姓名</td>
                            <td>帳號</td>
                            <td>性別</td>
                            <td>地址</td>
                            <td>電話</td>
                            <td>權限</td>
                            <td>Edit</td>
                            <c:if test="${accountBean.perssion gt 97}">
                                <td>Delete</td>
                            </c:if>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${requestScope.memberList}" var="member">
                            <tr>
                                <td>${member.accountBean.id}</td>
                                <td>${member.name}</td>
                                <td>${member.accountBean.account}</td>
                                <c:choose>
                                    <c:when test="${member.gender eq 1}">
                                        <td>男</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>女</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${member.address}</td>
                                <td>${member.tel}</td>
                                <c:choose>
                                    <c:when test="${member.accountBean.perssion eq 1}">
                                        <td>一般帳號</td>
                                    </c:when>
                                    <c:when test="${member.accountBean.perssion eq 2}">
                                        <td>門市人員</td>
                                    </c:when>
                                    <c:when test="${member.accountBean.perssion eq 99}">
                                        <td>管理者</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>未知</td>
                                    </c:otherwise>
                                </c:choose>
                                <td><a class="templatemo-edit-btn edit1">Edit</a></td>
                                <c:if test="${accountBean.perssion gt 97}">
                                    <td>
                                            <%--   <a href="member.delete/id/${member.accountBean.id}"--%>
                                            <%--    class="templatemo-del-btn deleteBtn">Delete</a>--%>
                                            <%--    <a href="" class="templatemo-del-btn deleteBtn"--%>
                                            <%--       id="delete${member.accountBean.id}">Delete</a>--%>
                                        <input type="button" class="templatemo-del-btn deleteBtn"
                                               id="delete${member.accountBean.id}" value="Delete">
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Templatemo Script -->
<script type="text/javascript" src="static/js/templatemo-script.js"></script>
</body>
<div id="dialogDelete" title="刪除？">
    <span id="deleteText">確定要刪除嗎？</span>
</div>

<!-- Dialog-->
<!-- 新增帳號-->
<div id="dialog" title="新增帳號">
    <form action="insertMember" method="post" id="insertForm">
        <p>
            <label for="insertName">姓名</label>
            <input type="text" name="insertName" id="insertName" value="使用者">
        </p>
        <p>
            <label for="insertAccount">帳號</label>
            <input type="text" name="insertAccount" id="insertAccount" value="user">
        </p>
        <p>
            <label for="insertPwd">密碼</label>
            <input type="text" name="insertPwd" id="insertPwd" value="uu">
        </p>
        <p>
            <label for="insertGender">性別</label>
            <select name="insertGender" id="insertGender">
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
                <option value="99">管理者</option>
                <option value="1" selected>一般帳號</option>
                <option value="2">門市人員</option>
            </select>
        </p>
    </form>
</div>
<!-- Dialog-->
<!-- 更新資料-->
<div id="dialogUpdate" title="更新資料">
    <form action="updateMember" method="post" id="updateForm">
        <p>
            <label for="updateName">姓名</label>
            <input type="text" id="updateName" name="updateName">
        </p>
        <p>
            <label for="updateAccount">帳號</label>
            <input type="text" id="updateAccount" name="updateAccount">
        </p>
        <p>
            <label for="updateGender">性別</label>
            <select name="updateGender" id="updateGender">
                <option value="1" selected>男</option>
                <option value="2">女</option>
            </select>
        <p>
            <label for="updateAddress">地址</label>
            <input type="text" id="updateAddress" name="updateAddress">
        </p>
        <p>
            <label for="updateTel">電話</label>
            <input type="text" id="updateTel" name="updateTel">
        </p>
        <p>
            <label for="updatePerssion">權限</label>
            <select name="updatePerssion" id="updatePerssion">
                <c:if test="${accountBean.perssion gt 98}">
                    <option value="99" selected>管理者</option>
                </c:if>
                <option value="1">一般帳號</option>
                <c:if test="${accountBean.perssion gt 1}">
                    <option value="2">門市人員</option>
                </c:if>
            </select>
        </p>
        <p>
            <input type="text" hidden="hidden" id="updateId" name="updateId">
        </p>
    </form>
</div>


</html>
