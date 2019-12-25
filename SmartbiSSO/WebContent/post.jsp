<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>报表资源post传参工具</title>
<%
    request.setCharacterEncoding("GBK");
 
    String user ="admin";
    String password = "admin";
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
	<h3>报表资源post传参工具</h3>
	<iframe id="frameLogin" src="<%=smartbiURL%>/vision/index.jsp?user=<%=user%>&password=<%=password%>" height="0" width="0" style="display: none">
	</iframe>
	<div>
		<p id="succ">
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		打开资源id：<input type="text" id="resid" value="I402881b31fd239c7014f20d297d80a38" size="50"/><br/>
		附加参数：<input type="text" id="other" value="showtoolbar=false" size="80"/><br/>
		报表参数：<textarea rows="5" cols="80"></textarea><br/>
			<input type="button" value="iframe打开资源" onclick="linkFrame()">
			<input type="button" value="新窗口打开资源" onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value)"/>
		<br/>
		<iframe id="frame" src="" height="600" width="95%" style="display: none">
		</iframe>
	</div>
	<p>
		备注：<br/>
		1、本页面默认使用全局设置的用户名和密码通过隐藏的iframe登录smartbi首页
		<br/>
	</p>
	<script type="text/javascript">
	</script>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?"
					+ '&resid=' + document.getElementById('resid').value;
		}
	</script>
</body>
</html>