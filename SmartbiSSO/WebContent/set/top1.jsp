<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title></title>
<%
    request.setCharacterEncoding("GBK");
 
    String user ="admin";
    String password = "manager";
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
	ClientConnector conn = new ClientConnector(smartbiURL);
    // 建立此连接时，就对smartbi进行了登录
    boolean ret = conn.open(user, password);
    if (!ret) {
%>
    <script>
    //alert("登录失败!");
    </script>
<%
    } else {
%>
    <script>
    // 获取smartbi的cookie，在集成页面需要传递smartbiCookie值，以保证前后台cookie的一致性
    var smartbiCookie = "<%=conn.getCookie()%>";
    </script>
<%
	session.setAttribute("conn", conn);
    }
%>
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
</head>
</style>
<body>
	<h2><font color="blue">XXXX管理系统</font></h2>
	<iframe id="frame" style="display: none" src=""></iframe>
	<%if (ret) {
		%>
	<script type="text/javascript">
		if(smartbiCookie){
			document.getElementById("frame").src = "http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>";
		}
	</script>
	<%}else{
	%>
		<script type="text/javascript">
		</script>
	<%}
	%>
</body>

</html>