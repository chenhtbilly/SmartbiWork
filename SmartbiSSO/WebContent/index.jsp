<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Smartbi单点登录测试工具</title>
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}

</style>
</head>
<body>
	<%-- <c:if test="${not empty sessionScope.smartbiUrl}">
		<div>
			<p id="url">
				单点登录目标URL：${sessionScope.smartbiUrl}
			</p>
		</div>
	</c:if> --%>
	<%
		String serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		System.out.println("localServerUrl="+serverUrl);
		session.setAttribute("serverUrl", serverUrl);
	%>
	<h3>单点登录测试工具</h3>
	<div>
		<form action="urlServlet" method="post">
		<h4>全局设置</h4>
		<c:if test="${not empty sessionScope.smartbiUrl}">
			smartbi地址：<input type="text" value="${sessionScope.smartbiUrl}" name="smartbiUrl" size="50"><br/>
		</c:if>
		<c:if test="${empty sessionScope.smartbiUrl}">
			smartbi地址：<input type="text" value="http://10.10.202.17:18600/smartbi" name="smartbiUrl" size="50"><br/>
			<%
				session.setAttribute("smartbiUrl", "http://10.10.202.17:18600/smartbi");
			%>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
			单点登录用户 / 管理员用户(方法一)：<input type="text" value="${sessionScope.user}" name="user" size="20"><br/>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			单点登录用户 / 管理员用户(方法一)：<input type="text" value="admin" name="user" size="20"><br/>
			<%
				session.setAttribute("user", "admin");
			%>
		</c:if>
		<c:if test="${not empty sessionScope.password}">
			单点登录密码 / 管理员密码(方法一)：<input type="text" value="${sessionScope.password}" name="password" size="20"><br/>
		</c:if>
		<c:if test="${empty sessionScope.password}">
			单点登录密码 / 管理员密码(方法一)：<input type="text" value="admin" name="password" size="20"><br/>
			<%
				session.setAttribute("password", "admin");
			%>
		</c:if>
			<input type="submit" value="保存">
		</form>
	</div>
	<br/>
	<div>
		<a href="loginToken.jsp">方法一：LoginToken扩展包</a><br/>
		<a href="loginJS.jsp">方法二：页面中使用Form登录</a><br/>
		<a href="clientSDK.jsp">方法三：浏览器端SDK</a><br/>
		<a href="serverSDK.jsp">方法四：服务器端SDK</a><br/>
	</div>
</body>
</html>