<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService, smartbi.sdk.*,smartbi.net.sf.json.*" pageEncoding="UTF-8"%>
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
<%
	String username = "admin";//用户名
	String password = "admin";
	ClientConnector conn = new ClientConnector("http://localhost:8080/smartbi");
	// 建立此连接时，就对smartbi进行了登录
	boolean ret = conn.open(username, password);
	if(ret){
		InvokeResult remoteInvoke = conn.remoteInvoke("UserService", "getUserByName", new Object[]{username});
		JSONObject originalResult = remoteInvoke.getOriginalResult();
		//System.out.println(originalResult);
		String retcode =  originalResult.getString("retCode");
		//System.out.println("retcode="+ retcode);
		JSONObject jsonObject = originalResult.getJSONObject("result");
		String id =  jsonObject.getString("id");
		session.setAttribute("id", id);
	}
	conn.close();
%>
<body>
	<p><a href="right.jsp" target="right">主页</a></p>
	<p><a href="http://localhost:8080/smartbi/vision/openmodule.jsp?id=displaycatalog&catalogid=SELF_${id}" target="right">我的收藏夹</a></p>
	<p><a href="http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089" target="right">访问统计</a></p>
	<p><a href="http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089" target="right">访问统计</a></p>
	<p><a href="http://localhost:8080/smartbi/vision/openresource.jsp?resid=I2c94ea86296db80801296dd20f12005a" target="right">用户权限</a></p>
	<p><a href="iframe.jsp" target="right">ifram报表测试</a></p>
	<p><a href="http://localhost:8080/smartbi/vision/createresource.jsp?restype=VISUAL" target="right">新建可视化查询</a></p>
</body>

</html>