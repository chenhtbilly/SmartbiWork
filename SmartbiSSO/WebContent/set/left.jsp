<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title></title>
<style type="text/css">
	a{
		text-decoration: none
	}
</style>
<%
    request.setCharacterEncoding("GBK");
    String smartbiURL = "http://localhost:8080/smartbi";
	if (null != session.getAttribute("smartbiUrl")) {
		smartbiURL = (String) session.getAttribute("smartbiUrl");
	}
%>
</head>
<body>
	<p><a href="<%=smartbiURL%>/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089" target="right">访问统计</a></p>
	<p><a href="<%=smartbiURL%>/vision/openresource.jsp?resid=I2c94ea86296db80801296dd20f12005a" target="right">用户权限</a></p>
	<p><a href="<%=smartbiURL%>/vision/openresource.jsp?resid=I4028ff81015bbd11bd110ba5015bbd2381160098" target="right">地图分析</a></p>
	<p><a href="<%=smartbiURL%>/vision/createresource.jsp?restype=VISUAL" target="right">新建可视化查询</a></p>
	<p><a href="<%=smartbiURL%>/vision/createresource.jsp?restype=INSIGHT" target="right">新建透视分析</a></p>
</body>

</html>