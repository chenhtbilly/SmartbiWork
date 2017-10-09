<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width; initial-scale=1.4; minimum-scale=1.0; maximum-scale=2.0"/>
<title>浏览器端SDK登录示例2</title>
<style type="text/css">
div {
	text-align: center
}

a {
	text-decoration: none
}
</style>
<script type="text/javascript" src="js/freequery/lang/JSLoader.js"></script>
</head>
<body>
	<h3>单点登录测试浏览器sdk</h3>
	<div>
		<p id="succ"></p>
		<input type="button" value="登录" onclick="login()">
		<a id="h" href="">测试打开</a>
		<input type="button" value="注销" onclick="logout()">
		<iframe id="frame" src="" height="300" width="100%"
			style="display: none"> </iframe>
	</div>
	<SCRIPT LANGUAGE="JavaScript">
		var jsloader = new JSLoader();
		function login() {
			try {
				var util = jsloader.resolve("freequery.common.util");
				var ret = util.remoteInvoke("UserService", "clickLogin", [
						"admin", "admin" ]);
				if (ret && ret.result) {
					//alert("单点登录成功");
					//window.location.href = "http://localhost:8080/smartbi/vision/mobileportal.jsp";
					//window.location.href = "mobileportal.jsp";
					document.getElementById("h").href = "openresource.jsp?resid=I4028818a015b6b316b311ac3015b840c9ce0488b"
				} else {
					document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK登录失败</font>";
				}
			} catch (e) {
				document.getElementById("succ").innerHTML = "<font color='red'>登录异常，"
						+ e + "</font>";
			}
		}
		//注销
		function logout() {
			try {
				// 创建应用程序对象
				var userService = jsloader
						.imports("bof.usermanager.UserService");
				// 通过userService.getInstance()可以调用所有的UserManagerModule方法.
				var result = userService.getInstance().logout();
				if (result) {
					document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK注销成功</font>";
				} else {
					document.getElementById("succ").innerHTML = "<font color='red'>浏览器端SDK注销失败</font>";
				}
			} catch (e) {
				document.getElementById("succ").innerHTML = "<font color='red'>注销异常，"
						+ e + "</font>";
			}
		}
	</SCRIPT>
</body>
</html>