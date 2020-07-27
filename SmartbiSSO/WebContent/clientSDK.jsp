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
<title>浏览器端SDK登录</title>
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
<style type="text/css">
	div{
	  	text-align:center
	  }
	a{
		text-decoration: none
	}
</style>
<SCRIPT type="text/javascript" src="js/JSLoader.js"></SCRIPT>
</head>
<body>
	<h3>单点登录测试工具/浏览器端SDK</h3>
	<div>
		<p id="succ">
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		打开资源resid：<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
		<input type="button" value="iframe打开首页" onclick="linkFrame()">
		<input type="button" value="iframe打开资源" onclick="linkFrame1()">
		<input type="button" value="新窗口打开资源" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="注销" onclick="logout()">
		<iframe id="frame" src="" height="600" width="95%" style="display: none">
		</iframe>
	</div>
	
	<p>
		备注：登录异常一般是跨域问题，即smartbi地址和当前浏览器访问的地址不是一个域<br/>
	</p>
	<SCRIPT LANGUAGE="JavaScript">
		//打开页面直接调用登录
		var config = new Object();
	    //smartbi服务器的URL地址
	    config.baseURL = document.getElementsByName("smartbiUrl")[0].value+"/vision/";
	    var BOF_UI_DEBUG = false;
	    // 创建全局唯一的JS装载器
	    try {
		    var jsloaderClient = new JSLoader(config);
		    // 创建应用程序对象
		    var userService = jsloaderClient.imports("bof.usermanager.UserService");
		    // 通过userService.getInstance()可以调用所有的UserManagerModule方法.
		    var user = document.getElementsByName("user")[0].value;
		    var password = document.getElementsByName("password")[0].value;
		    var result = userService.getInstance().login(user, password);
		    if (result) {
		        //alert("单点登录成功");
		    	document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK登录成功</font>";
		    } else {
		    	document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK登录失败</font>";
		    }
	  }catch(e){
	    	document.getElementById("succ").innerHTML = "<font color='red'>登录异常，"+ e +"</font>";
	    }
	    //注销
	    function logout(){
	    	try {
			    var jsloaderClient = new JSLoader(config);
			    // 创建应用程序对象
			    var userService = jsloaderClient.imports("bof.usermanager.UserService");
			    // 通过userService.getInstance()可以调用所有的UserManagerModule方法.
			    var result = userService.getInstance().logout();
			    if (result) {
			    	document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK注销成功</font>";
			    } else {
			    	document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK注销失败</font>";
			    }
		    }catch(e){
		    	document.getElementById("succ").innerHTML = "<font color='red'>注销异常，"+ e +"</font>";
		    }
	    }
	    
	    function linkFrame() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/index.jsp";
		}
	    function linkFrame1() {
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("frame").src = "<%=smartbiURL%>/vision/openresource.jsp?resid="+ document.getElementById('resid').value;
		}
	    
	</SCRIPT>
</body>
</html>