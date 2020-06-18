<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService,smartbi.sdk.InvokeResult" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="SSOLogin" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>JS脚本登录</title>
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
	<h3>单点登录测试工具/页面中使用Form登录</h3>
	<div>
		smartbi地址：<input type="text" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		
		<form method="POST" id="formLogin" onsubmit="go();return false">
		    <p>单点登录用户：<input type="text" name="user" size="20" value="<%=user%>"></p>     
		    <p>单点登录密码：<input type="text" name="password" size="20" value="<%=password%>"></p>
		    <p>登录成功后的跳转地址：<input type="text" name="surl" size="50" value="${serverUrl}${SSOLogin}/loginjs/successjs.jsp"></p>
		    <p>登录失败后的跳转地址：<input type="text" name="furl" size="50" value="${serverUrl}${SSOLogin}/loginjs/failjs.jsp"></p>     
		    <p><input type="submit" value="登录" name="B1"></p> 
		</form>
	</div>	
	<script type="text/javascript">
		function go() {
		    formLogin.action = document.getElementsByName("smartbiUrl")[0].value+"/vision/index.jsp";
		    formLogin.user.value = document.getElementsByName("user")[0].value;
		    formLogin.password.value = document.getElementsByName("password")[0].value;    
		    formLogin.surl.value = document.getElementsByName("surl")[0].value;	//登录成功地址
		    formLogin.furl.value = document.getElementsByName("furl")[0].value; // 登录失败后的跳转地址
		    formLogin.submit();
		    return true; 
			   
		}
	</script>
</body>
</html>