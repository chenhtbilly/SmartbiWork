<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>服务端SDK登录</title>
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
	ClientConnector conn = new ClientConnector(smartbiURL);
    // 建立此连接时，就对smartbi进行了登录
    boolean ret = false;
    String errMsg = "";
    try{
    	ret = conn.open(user, password);
    }catch(Exception e){
    	e.printStackTrace();
    	errMsg = "连接服务器"+ smartbiURL+ "异常";
    }
    if (!ret) {
    	if(errMsg.equals("")){
	    	errMsg = "连接或登录服务器"+ smartbiURL+ "失败";
    	}
%>
    <script>
    //alert("登录失败!");
    	console.log("登录失败!");
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
</style>
</head>
<body>
	<h3>单点登录测试工具/服务器端SDK</h3>
	<div>
		<p id="succ">
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		打开资源resid：<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
			<%-- <a href="${sessionScope.smartbiUrl}/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&user=${requestScope.tokenUser}&password=${requestScope.token}">新窗口测试</a> --%>
		<%if (ret && conn!=null && conn.getCookie()!=null) {
		%>
			<input type="button" value="iframe打开首页" onclick="linkFrame()">
			<input type="button" value="iframe打开资源" onclick="linkFrame1()">
			<input type="button" value="新窗口打开首页" 
			onclick="window.open('<%=smartbiURL%>/vision/index.jsp?smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>')">
			<input type="button" value="新窗口打开资源" 
			onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>')">
			<input type="button" value="注销" onclick="logout()"/>
		<%}else{
		%>	
			<input type="button" value="iframe打开首页" onclick="linkFrame()">
			<input type="button" value="iframe打开资源" onclick="linkFrame1()">
			<input type="button" value="新窗口打开首页" 
			onclick="window.open('<%=smartbiURL%>/vision/index.jsp')">
			<input type="button" value="新窗口打开资源" 
			onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value')">
		<%}
		%>
		<br/>
		<iframe id="frame" src="" height="600" width="95%" style="display: none">
		</iframe>
	</div>
	<p>
		备注：<br/>
		1、点击新窗口打开资源，链接中带了smartbiCookie参数，url形式如下：<br/>
		http://localhost:8080/smartbi/vision/openresource.jsp?resid=I402881f738d5a79a0138d5c88f7e0089&smartbiCookie=JSESSIONID%3DC8FFECB2CE200B8A43179B51B5491969%3B+Path%3D%2Fsmartbi%3B
		<br/>
		2、复制新窗口打开资源的地址，可以在一个隐身窗口打开链接直接访问资源（无需登录）。如果将链接中的smartbiCookie参数的值删除或者修改，则在隐身窗口中打开会提示
		<font color=red>“SmartbiCookie对应的会话已失效！”</font>
		<br/>
		3、新窗口打开资源的窗口先不关闭，点击注销，提示注销成功后，再次刷新新窗口打开的资源，提示
		<font color=red>“SmartbiCookie对应的会话已失效！”</font>
	</p>
	<%if (ret) {
		%>
	<script type="text/javascript">
		if(smartbiCookie){
			document.getElementById("succ").innerHTML = "<font color='red'>服务器端SDK登录成功，smartbiCookie:"+ smartbiCookie +"</font><br/>"+
			"encode的smartbiCookie：<input type='text' size=80 value='"+ "<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>"+"'/>";
		}
	</script>
	<%}else{
	%>
		<script type="text/javascript">
			document.getElementById("succ").innerHTML = "<font color='red'>服务器端SDK登录失败,失败原因：<%=errMsg%></font>";
		</script>
	<%}
	%>
	<script type="text/javascript">
	<%if (conn!=null && conn.getCookie()!=null) {
	%>
	
		function logout(){
			// JavaScript 构建一个 form  
		    var form1 = document.createElement("form");  
		    form1.id = "form1";  
		    // 添加到 body  
		    document.body.appendChild(form1);  
		    // 提交方式  
		    form1.method = "POST";  
		    // 提交路径  
		    form1.action = "serverSDKLogoutServlet";  
		    // 提交  
		    form1.submit();  
		    // 删除form  
		    document.body.removeChild(form1);  
		}
		
		function linkFrame() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp?smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>";
		}
		
		function linkFrame1() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>"
					+ '&resid=' + document.getElementById('resid').value;
		}
		<%}else{
		%>	
		function linkFrame() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp";
		}
		
		function linkFrame1() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid=" + document.getElementById('resid').value;
		}
		<%}
		%>
	</script>
</body>
</html>