<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${daoResult eq 'DeleteSuccess'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("刪除成功");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
<c:if test="${daoResult eq 'DeleteFail'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("刪除失敗");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
<c:if test="${daoResult eq 'InsertSuccess'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("新增成功");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
<c:if test="${daoResult eq 'InsertFail'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("新增失敗！已有此帳號！");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
<c:if test="${daoResult eq 'UpdateSuccess'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("更新成功");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
<c:if test="${daoResult eq 'UpdateFail'}">
    <c:remove var="daoResult" scope="session"/>
    <script>
      $(function () {
        $('#result-content').text("更新失敗！已有此帳號！");
        $('#dialogResult').dialog();
      });
    </script>
</c:if>
