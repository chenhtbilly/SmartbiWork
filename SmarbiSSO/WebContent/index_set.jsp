<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>主页</title>
<style type="text/css">
	a{
		text-decoration: none
	}
</style>
</head>
<frameset rows="100,*" border="5px" frameborder="yes">
	<frame src="set/top.jsp" />
  	<frameset cols="170,*" border="5px" frameborder="yes">
  		<frame src="set/left.jsp" />
  		<frame src="set/right.jsp" name="right" />
  	</frameset>
</frameset>
</html>