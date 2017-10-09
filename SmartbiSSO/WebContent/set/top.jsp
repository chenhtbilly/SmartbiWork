<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>

<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
	h3{
		color: blue;
		font-family: Microsoft YaHei
	}
</style>
<script type="text/javascript">
	var flag = "0";
</script>
</head>
<body onload="go();">
	<h3>XXXX集团XX系统</h3>
	<p align="right">欢迎登录<a href="#">admin</a></p>
	<form method="POST" id="formLogin" onsubmit="go();return false" target="iframe1">
	    <input type="hidden" name="user" size="20" value="admin">  
	    <input type="hidden" name="password" size="20" value="manager">
	    <input type="submit" value="提交" name="B1" style="display: none">
	</form>
	<iframe src="" name="iframe1" style="display: none"></iframe>
	
	<script type="text/javascript">
		function go() {
		    formLogin.action = "http://localhost:8080/smartbi/vision/";
		    formLogin.user.value = "admin";
		    formLogin.password.value = "manager";    
		    formLogin.submit();
		    return true;
		}
	</script>
</body>
</html>