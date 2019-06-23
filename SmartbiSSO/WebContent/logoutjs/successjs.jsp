<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>页面中使用Form注销成功</title>
<%
    request.setCharacterEncoding("GBK");
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
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
			<font color="red">注销成功</font>
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		打开资源id：<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
		<input type="button" value="新窗口打开资源" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="IFrame打开资源" onclick="linkFrame()">
	</div>
	<iframe id="frame" src="" height="300" width="100%" style="display: none">
			
	</iframe>
	<p>
		备注：<br/>
		注销成功后点击新窗口打开资源或IFrame打开资源将跳到登录页
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value;
		}
	</script>
</body>
</html>