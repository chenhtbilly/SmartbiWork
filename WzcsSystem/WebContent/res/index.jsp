<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="WzcsSystem" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统主页</title>
<link rel="stylesheet" type="text/css" href="${WzcsSystem}/css/base.css"/>
</head>
<%
	String username = (String)session.getAttribute("username");
	if(null==username){
		response.sendRedirect("index.jsp");
	}
%>
<frameset rows="100,*" border="5px" frameborder="yes">
	<frame src="res/set/top.jsp" />
  	<frameset cols="170,*" border="5px" frameborder="yes">
  		<frame src="res/set/left.jsp" />
  		<frame src="res/set/right.jsp" name="right" />
  	</frameset>
</frameset>
</html>