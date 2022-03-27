<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="static/css/topBarMenu.css" rel="stylesheet">
<!-- 上方選單-->
<div class="templatemo-top-nav-container">
	<div class="row">

<%--		<div class="menuBtn transition">--%>
<%--			<div class="bar bar1 transition"></div>--%>
<%--			<div class="bar bar2 transition"></div>--%>
<%--			<div class="bar bar3 transition"></div>--%>
<%--		</div>--%>

		<nav class="templatemo-top-nav col-lg-8 col-md-8 ">
			<ul class="text-uppercase">
				<li><a href="">Admin panel</a></li>
				<li><a href="">Dashboard</a></li>
				<li><a href="">Overview</a></li>
				<li><a href="">Overview</a></li>
			</ul>

		</nav>
		<div class="accountData col-lg-2 col-md-2 btn-danger">您好：
			${accountBean.memberBean.name}
<%--			<jsp:getProperty name="memberBean" property="name"/>--%>
		</div>
	</div>
</div>
<!-- 上方選單END-->
