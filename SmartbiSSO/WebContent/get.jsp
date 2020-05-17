<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>报表资源get方式传参测试页</title>
<%
    request.setCharacterEncoding("UTF-8");
 
    String user ="admin";
    String password = "admin";
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
</head>
<body>
	<h3>报表资源get方式传参测试页</h3>
	<iframe id="frameLogin" src="<%=smartbiURL%>/vision/index.jsp?user=<%=user%>&password=<%=password%>" height="0" width="0" style="display: none">
	</iframe>
	<div>
		<p id="succ">
		</p>
		smartbi地址：<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		单点登录用户：<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		单点登录密码：<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		报表参数是否Base64编码：<input type="radio" id="other1" name="base64" value="1" size="80"/>是
								<input type="radio" id="other2" name="base64" value="2" checked="checked" size="80"/>否<br/>
		
		<form id="url" action="" method="get">
			报表参数：
			<textarea rows="5" id="param" cols="80" name="paramsInfo">[{"name":"参数演示_区域","value":"华南","displayValue":"华南"},{"name":"参数演示_城市","value":"深圳","displayValue":"深圳"}]</textarea>
			<br/>
			打开资源id：<input type="text" id="res" name="resid" value="I402881b31fd239c7014f20d297d80a38" size="50"/>
		</form>
		iframe宽度(数值或百分比)：<input type="text" id="iwidth" value="95%" size="10"/><br/>
		iframe高度(数值)：<input type="text" id="iheight" value="600" size="10"/><br/>
		<br/>
		<input type="button" value="iframe打开资源" onclick="linkFrame()">
		<input type="button" value="新窗口打开资源" onclick="openWindow()"/>
		<br/>
		<iframe id="frame" name="frame" height="600" width="95%" style="display: none">
		</iframe>
	</div>
	<p>
		备注：本页面默认使用全局设置的用户名和密码通过隐藏的iframe登录smartbi首页
		<br/>
	</p>
	<script type="text/javascript">
	</script>
	<script type="text/javascript">
		function getActionUrl() {
			document.getElementById("url").action = "<%=smartbiURL%>/vision/openresource.jsp";
		}
		
		function getBase64() {
			var flag = document.getElementById("other1").checked;
			if(flag){
				document.getElementById("param").name = "paramsInfoBase64";
			}else{
				document.getElementById("param").name = "paramsInfo";
			}
		}
		
		function linkFrame() {
			getActionUrl();
			getBase64();
			var iwidth = document.getElementById("iwidth").value;
			var iheight = document.getElementById("iheight").value;
			var regW = /^(0|[1-9][0-9]*[%]{0,1})$/;
			var regH = /^(0|[1-9][0-9]*)$/;
			if (regW.test(iwidth)) {
				document.getElementById("frame").width = iwidth;
			} else {
				alert("输入的宽度值不合法，使用默认值：95%");
				document.getElementById("iwidth").value="95%";
			}
			if (regH.test(iheight)) {
				document.getElementById("frame").height = iheight;
			} else {
				alert("输入的高度值不合法，使用默认值：600");
				document.getElementById("iheight").value = 600;
			}
			document.getElementById("url").target = "frame";
			document.getElementById("frame").style.display = 'inline';
			document.getElementById("url").submit();
		}
		
		function openWindow() {
			getActionUrl();
			getBase64();
			document.getElementById("url").target = "_blank";
			document.getElementById("url").submit();
		}
	</script>
</body>
</html>