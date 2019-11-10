<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�������SDK��¼</title>
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
	<h3>�����¼���Թ���/�������SDK</h3>
	<div>
		<p id="succ">
		</p>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		�����¼�û���<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		�����¼���룺<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		����Դid��<input type="text" id="resid" value="I402881f738d5a79a0138d5c88f7e0089" size="50"/><br/>
		<input type="button" value="iframe����ҳ" onclick="linkFrame()">
		<input type="button" value="iframe����Դ" onclick="linkFrame1()">
		<input type="button" value="�´��ڴ���Դ" onclick="window.open(document.getElementsByName('smartbiUrl')[0].value + '/vision/openresource.jsp?resid='+ document.getElementById('resid').value)">
		<input type="button" value="ע��" onclick="logout()">
		<iframe id="frame" src="" height="600" width="95%" style="display: none">
		</iframe>
	</div>
	
	<p>
		��ע����¼�쳣һ���ǿ������⣬��smartbi��ַ�͵�ǰ��������ʵĵ�ַ����һ����<br/>
	</p>
	<SCRIPT LANGUAGE="JavaScript">
		//��ҳ��ֱ�ӵ��õ�¼
		var config = new Object();
	    //smartbi��������URL��ַ
	    config.baseURL = document.getElementsByName("smartbiUrl")[0].value+"/vision/";
	    var BOF_UI_DEBUG = false;
	    // ����ȫ��Ψһ��JSװ����
	    try {
		    var jsloaderClient = new JSLoader(config);
		    // ����Ӧ�ó������
		    var userService = jsloaderClient.imports("bof.usermanager.UserService");
		    // ͨ��userService.getInstance()���Ե������е�UserManagerModule����.
		    var user = document.getElementsByName("user")[0].value;
		    var password = document.getElementsByName("password")[0].value;
		    var result = userService.getInstance().login(user, password);
		    if (result) {
		        //alert("�����¼�ɹ�");
		    	document.getElementById("succ").innerHTML = "<font color='red'>�������SDK��¼�ɹ�</font>";
		    } else {
		    	document.getElementById("succ").innerHTML = "<font color='red'>�������SDK��¼ʧ��</font>";
		    }
	  }catch(e){
	    	document.getElementById("succ").innerHTML = "<font color='red'>��¼�쳣��"+ e +"</font>";
	    }
	    //ע��
	    function logout(){
	    	try {
			    var jsloaderClient = new JSLoader(config);
			    // ����Ӧ�ó������
			    var userService = jsloaderClient.imports("bof.usermanager.UserService");
			    // ͨ��userService.getInstance()���Ե������е�UserManagerModule����.
			    var result = userService.getInstance().logout();
			    if (result) {
			    	document.getElementById("succ").innerHTML = "<font color='red'>�������SDKע���ɹ�</font>";
			    } else {
			    	document.getElementById("succ").innerHTML = "<font color='red'>�������SDKע��ʧ��</font>";
			    }
		    }catch(e){
		    	document.getElementById("succ").innerHTML = "<font color='red'>ע���쳣��"+ e +"</font>";
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