<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${requestScope.result eq 'DeleteSuccess'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("刪除成功");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
<c:if test="${requestScope.result eq 'DeleteFail'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("刪除失敗");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
<c:if test="${requestScope.result eq 'InsertSuccess'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("新增成功");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
<c:if test="${requestScope.result eq 'InsertFail'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("新增失敗");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
<c:if test="${requestScope.result eq 'UpdateSuccess'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("更新成功");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
<c:if test="${requestScope.result eq 'UpdateFail'}">
	<c:remove var="daoResult" scope="session"/>
	<script>
      $(function () {
        $('#result-content').text("更新失敗");
        $('#dialogResult').dialog();
      });
	</script>
</c:if>
