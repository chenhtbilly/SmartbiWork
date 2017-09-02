<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="WzcsSystem" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<link rel="stylesheet" type="text/css" href="${WzcsSystem}/css/base.css"/>
</head>
<body>
	<h3>XX局XX系统</h3>
	<div>
		<form action="LoginServlet" method="post">
			用户名：<input type="text" name="username" /><br/>
			密&nbsp;&nbsp;码：<input type="password" name="password" /><br/>
			<input type="submit" value="登录">
		</form>
	</div>
</body>
</html>