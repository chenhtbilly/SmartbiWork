<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Smartbi�����¼���Թ���</title>
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
	<%-- <c:if test="${not empty sessionScope.smartbiUrl}">
		<div>
			<p id="url">
				�����¼Ŀ��URL��${sessionScope.smartbiUrl}
			</p>
		</div>
	</c:if> --%>
	<h3>�����¼���Թ���</h3>
	<div>
		<form action="urlServlet" method="post">
		<h4>ȫ������</h4>
		<c:if test="${not empty sessionScope.smartbiUrl}">
			smartbi��ַ��<input type="text" value="${sessionScope.smartbiUrl}" name="smartbiUrl" size="50"><br/>
		</c:if>
		<c:if test="${empty sessionScope.smartbiUrl}">
			smartbi��ַ��<input type="text" value="http://localhost:8080/smartbi" name="smartbiUrl" size="50"><br/>
		</c:if>
		<c:if test="${not empty sessionScope.user}">
			�����¼�û� / ����Ա�û�(����һ)��<input type="text" value="${sessionScope.user}" name="user" size="20"><br/>
		</c:if>
		<c:if test="${empty sessionScope.user}">
			�����¼�û� / ����Ա�û�(����һ)��<input type="text" value="admin" name="user" size="20"><br/>
		</c:if>
		<c:if test="${not empty sessionScope.password}">
			�����¼���� / ����Ա����(����һ)��<input type="text" value="${sessionScope.password}" name="password" size="20"><br/>
		</c:if>
		<c:if test="${empty sessionScope.password}">
			�����¼���� / ����Ա����(����һ)��<input type="text" value="manager" name="password" size="20"><br/>
		</c:if>
			<input type="submit" value="����">
		</form>
	</div>
	<br/>
	<div>
		<a href="loginToken.jsp">����һ��LoginToken��չ��</a><br/>
		<a href="loginJS.jsp">��������JS�ű�</a><br/>
		<a href="clientSDK.jsp">���������������SDK</a><br/>
		<a href="serverSDK.jsp">�����ģ���������SDK</a><br/>
	</div>
</body>
</html>