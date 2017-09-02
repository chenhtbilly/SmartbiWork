<%@ page language="java" contentType="text/html; charset=GBK" 
import="java.util.*, smartbi.sdk.ClientConnector, smartbi.sdk.service.user.UserManagerService" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�����SDK��¼</title>
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
    // ����������ʱ���Ͷ�smartbi�����˵�¼
    boolean ret = conn.open(user, password);
    if (!ret) {
%>
    <script>
    //alert("��¼ʧ��!");
    </script>
<%
    } else {
%>
    <script>
    // ��ȡsmartbi��cookie���ڼ���ҳ����Ҫ����smartbiCookieֵ���Ա�֤ǰ��̨cookie��һ����
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
	<h3>�����¼���Թ���/������</h3>
	<div>
		<p id="succ">
		</p>
		smartbi��ַ��<input type="text" disabled="disabled" value="<%=smartbiURL%>" name="smartbiUrl" size="50"><br/>
		�����¼�û���<input type="text" disabled="disabled" value="<%=user%>" name="user" size="20"><br/>
		�����¼���룺<input type="text" disabled="disabled" value="<%=password%>" name="password" size="20"><br/>
		����Դid��<input type="text" id="resid" value="I4028ff81015bbd11bd110ba5015bbd2381160098" size="50"/><br/>
			<%-- <a href="${sessionScope.smartbiUrl}/vision/openresource.jsp?resid=I4028ff81015bbd11bd110ba5015bbd2381160098&user=${requestScope.tokenUser}&password=${requestScope.token}">�´��ڲ���</a> --%>
		<%if (ret) {
		%>
			<input type="button" value="�´��ڴ���Դ" onclick="window.open('<%=smartbiURL%>/vision/openresource.jsp?resid='+ document.getElementById('resid').value +'&smartbiCookie=<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>')">
			<input type="button" value="ע��" onclick="logout()"/>
		<%}
		%>
	</div>
	<p>
		��ע��<br/>
		1������´��ڴ���Դ�������д���smartbiCookie������url��ʽ���£�<br/>
		http://localhost:8080/smartbi/vision/openresource.jsp?resid=I4028ff81015bbd11bd110ba5015bbd2381160098&smartbiCookie=JSESSIONID%3DC8FFECB2CE200B8A43179B51B5491969%3B+Path%3D%2Fsmartbi%3B
		<br/>
		2�������´��ڴ���Դ�ĵ�ַ��������һ���������ڴ�����ֱ�ӷ�����Դ�������¼��������������е�smartbiCookie������ֵɾ�������޸ģ��������������д򿪻���ʾ
		<font color=red>��SmartbiCookie��Ӧ�ĻỰ��ʧЧ����</font>
		<br/>
		3���´��ڴ���Դ�Ĵ����Ȳ��رգ����ע������ʾע���ɹ����ٴ�ˢ���´��ڴ򿪵���Դ����ʾ
		<font color=red>��SmartbiCookie��Ӧ�ĻỰ��ʧЧ����</font>
	</p>
	<%if (ret) {
		%>
	<script type="text/javascript">
		if(smartbiCookie){
			document.getElementById("succ").innerHTML = "<font color='red'>��������SDK��¼�ɹ���smartbiCookie:"+ smartbiCookie +"</font><br/>"+
			"encode��smartbiCookie��<input type='text' size=80 value='"+ "<%=java.net.URLEncoder.encode(conn.getCookie(), "UTF-8")%>"+"'/>";
		}
	</script>
	<%}else{
	%>
		<script type="text/javascript">
			document.getElementById("succ").innerHTML = "<font color='red'>��������SDK��¼ʧ��</font>";
		</script>
	<%}
	%>
	<script type="text/javascript">
		function logout(){
			// JavaScript ����һ�� form  
		    var form1 = document.createElement("form");  
		    form1.id = "form1";  
		    // ���ӵ� body  
		    document.body.appendChild(form1);  
		    // �ύ��ʽ  
		    form1.method = "POST";  
		    // �ύ·��  
		    form1.action = "serverSDKLogoutServlet";  
		    // �ύ  
		    form1.submit();  
		    // ɾ��form  
		    document.body.removeChild(form1);  
		}
	</script>
</body>
</html>