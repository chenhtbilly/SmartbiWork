<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>浏览器端SDK登录</title>
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
	<h3>单点登录测试工具/方法三</h3>
	<div>
		<p id="succ">
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		打开资源id：<input type="text" id="resid" value="I4028ff81015bbd11bd110ba5015bbd2381160098" size="50"/><br/>
		<input type="button" value="新窗口打开资源" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="注销" onclick="logout()">
	</div>
	<p>
		备注：<br/>
	</p>
	<SCRIPT LANGUAGE="JavaScript">
		//打开页面直接调用登录
		var config = new Object();
	    //smartbi服务器的URL地址
	    config.baseURL = document.getElementsByName("smartbiUrl")[0].value+"/vision/";
	    var BOF_UI_DEBUG = false;
	    // 创建全局唯一的JS装载器
	    try {
		    var jsloader = new JSLoader(config);
		    // 创建应用程序对象
		    var userService = jsloader.imports("bof.usermanager.UserService");
		    // 通过userService.getInstance()可以调用所有的UserManagerModule方法.
		    var user = document.getElementsByName("user")[0].value;
		    //var password = document.getElementsByName("password")[0].value;
		    var result = userService.getInstance().isLoginAs(user);
		    debugger;
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
			    var jsloader = new JSLoader(config);
			    // 创建应用程序对象
			    var userService = jsloader.imports("bof.usermanager.UserService");
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
	</SCRIPT>
</body>
</html>