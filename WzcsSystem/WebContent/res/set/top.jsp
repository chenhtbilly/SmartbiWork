<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="WzcsSystem" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${WzcsSystem}/css/base.css"/>
</head>
<body onload="go();">
	<h3>XX局XX系统</h3>
	<p align="right">欢迎登录<a href="#">${sessionScope.username}</a>
	<a href="${WzcsSystem}/LogoutServlet" onclick="goout()" target="_parent">注销</a>
	</p>
	<form method="POST" id="formLogin" onsubmit="go();return false" target="iframe1">
	    <input type="hidden" name="user" size="20" value="admin">  
	    <input type="hidden" name="password" size="20" value="admin">
	    <input type="submit" value="提交" name="B1" style="display: none">
	</form>
	<iframe src="" name="iframe1" style="display: none"></iframe>
	<form method="POST" id="formLogout" onsubmit="goout();return false" target="iframe1">
	    <input type="hidden" name="user" size="20" value="admin">  
	    <input type="hidden" name="password" size="20" value="admin">
	    <input type="hidden" name="surl" size="20">
    	<input type="hidden" name="furl" size="20">  
	    <input type="submit" value="提交" name="B1" style="display: none">
	</form>
	<script type="text/javascript">
		function go() {
		    formLogin.action = "http://localhost:8080/smartbi/vision/";
		    formLogin.user.value = "admin";
		    formLogin.password.value = "admin";    
		    formLogin.submit();
		    return true;
		}
		function goout(){
		    formLogout.action = "http://localhost:8080/smartbi/vision/logout.jsp";
		    formLogout.surl.value = "http://localhost:8090/WzcsSystem/index.jsp"; // 注销成功后的跳转地址 为空时自动跳转到smartbi的index.jsp
		    formLogout.furl.value = " "; // 注销失败后的跳转地址 为空时自动跳转到smartbi的index.jsp
		    formLogout.submit();
		    return true;
		}
	</script>
</body>
</html>