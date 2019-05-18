<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="SSOLogin" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>JS脚本登录成功</title>
<%
    request.setCharacterEncoding("GBK");
    String user ="admin";
    String password = "manager";
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
	}
	if (null != (String) session.getAttribute("user")) {
		user = (String) session.getAttribute("user");
	}
	if (null != (String) session.getAttribute("password")) {
		password = (String) session.getAttribute("password");
	}
%>
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
	<h3>单点登录测试工具/方法二</h3>
	<div>
		<p id="succ">
			<font color="red">单点登录成功</font>
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		打开资源id：<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
		<input type="button" value="新窗口打开资源" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="IFrame打开资源" onclick="linkFrame()">
		<form method="POST" id="formLogout" onsubmit="go();return false">
		    <p>注销成功后的跳转地址：<input type="text" name="surl" size="50" value="${serverUrl}${SSOLogin}/logoutjs/successjs.jsp"></p>
		    <p>注销失败后的跳转地址：<input type="text" name="furl" size="50" value="${serverUrl}${SSOLogin}/logoutjs/failjs.jsp"></p>    
		    <p><input type="submit" value="注销" name="B1"></p>
		</form>
	</div>
	<iframe id="frame" src="" height="300" width="100%" style="display: none">
	</iframe>
	<p>
		备注：<br/>
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value;
		}
		//注销
		function go(){
		    formLogout.action = document.getElementsByName("smartbiUrl")[0].value+"/vision/logout.jsp";
		    formLogout.surl.value = document.getElementsByName("surl")[0].value; // 注销成功后的跳转地址 为空时自动跳转到smartbi的index.jsp
		    formLogout.furl.value = document.getElementsByName("furl")[0].value; // 注销失败后的跳转地址 为空时自动跳转到smartbi的index.jsp
		    formLogout.submit();
		    return true;
		}
	</script>
</body>
</html>