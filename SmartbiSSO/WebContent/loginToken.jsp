<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService,smartbi.sdk.InvokeResult" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>loginToken登录</title>
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
</style>
<%
    request.setCharacterEncoding("GBK");
	String user ="admin";
	String password = "admin";
	String serverUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
	session.setAttribute("serverUrl", serverUrl);
	String smartbiURL = serverUrl+ "/smartbi";
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
</head>
<body>
	<h3>单点登录测试工具/LoginToken扩展包</h3>
	<div>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		管理员用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		管理员密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		<font color=red>部署对应版本的logintoken扩展包后测试</font><br/>
		<form id="tokenForm" action="tokenUserServlet" method="post">
			获取Token用户名：<input type="text" value="${requestScope.tokenUser}" name="tokenUser" id="tuser" size="20">
			<input type="submit" value="获取token">
		</form>
		
	</div>	
	<div>
		<p id="succ">
			<c:if test="${not empty requestScope.token}&&${empty requestScope.errmsg}">
				<font color="red">获取token成功</font>
			</c:if>
			<c:if test="${not empty requestScope.errmsg}">
				<font color="red">获取token失败，${requestScope.errmsg}</font>
			</c:if>
		</p>
			Token：<input type="text" id="token" value="${requestScope.token}" size="50"/><br/>
			打开资源id：<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
			
			<input type="button" value="iframe打开首页" onclick="linkFrameIndex()"> 
			<input type="button" value="iframe打开资源" onclick="linkFrame()">
			<input type="button" value="新窗口打开首页" 
			onclick="window.open('<%=smartbiURL%>/vision/index.jsp?user='+ document.getElementById('tuser').value +'&password='+ document.getElementById('token').value)">
			<input type="button" value="新窗口打开资源" 
			onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&user='+ document.getElementById('tuser').value +'&password='+ document.getElementById('token').value)">
			<input type="button" value="注销" onclick="logout()">
	</div>
	<p>
		<iframe id="frame" name="frameTarget" src="" height="300" width="100%" style="display: none">
			
		</iframe>
		备注：<br/>
		1、链接中带了password参数，参数值为获取到的token，url形式如下：<br/>
		http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&user=liming&password=I4028ff81015cfea5fea563d0015cfec67991038d
		<br/>
		
	</p>
	<script type="text/javascript">
		function linkFrame() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value +"&user="+ document.getElementById('tuser').value +"&password=" + document.getElementById('token').value;
		}
		function linkFrameIndex() {
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp?"+ "user="+ document.getElementById('tuser').value +"&password=" + document.getElementById('token').value;
		}
		
		function logout(){
			document.getElementById("frame").style.display = '';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/logout.jsp";
		}
	</script>
</body>
</html>