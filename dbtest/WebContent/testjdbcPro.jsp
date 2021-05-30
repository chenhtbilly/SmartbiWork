<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,org.apache.log4j.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据源测试</title>
</head>
<body>
	<h2>存储过程查询测试-遍历结果集所有行</h2>
	<%
	String className = request.getParameter("className");	//驱动类名
	String url = request.getParameter("url");				// TODO 数据源jdbc  url
	String userName = request.getParameter("userName");		//数据库用户名
	String password = request.getParameter("password");		//数据库密码
	String proQuery = request.getParameter("proQuery");		//查询SQL
	long timeCreate = -1;	//创建连接耗时(-1用来表示未执行成功)
	long timeQuery = -1;	//执行存储过程耗时
	long timeResult = -1;	//遍历结果集耗时
	long timeClose = -1;	//关闭连接耗时
	String message = "";	//错误信息
	int rsCount = -1;
	Logger log = Logger.getLogger(Connection.class);
	long t1 = System.currentTimeMillis();
	log.info("准备创建Connection：" + t1);
	Connection conn = null;
	try {
		Class.forName(className);
		conn = DriverManager.getConnection(url, userName, password);// 获取连接
		conn.setAutoCommit(false);// 开启事务
		long t0 = System.currentTimeMillis();
		log.info("开启事务：" + (t0 - t1) + "ms");
		long t2 = System.currentTimeMillis();
		log.info("创建Connection完成：" + t2);
		timeCreate = t2 - t1;
		log.info("创建Connection耗时：" + timeCreate + "ms");
		CallableStatement statement = conn.prepareCall(proQuery);
		
		long t3 = System.currentTimeMillis();
		log.info("准备执行存储过程：" + t3);
		boolean hasResultSet = statement.execute();
		long t4 = System.currentTimeMillis();
		if (hasResultSet) {
			log.info("执行存储过程成功：" + t4);
		}
		timeQuery = t4 - t3;
		log.info("执行存储过程耗时：" + timeQuery + "ms");
		int i = 0;
		ResultSet rs = null;
		
		long t5 = System.currentTimeMillis();
		if(hasResultSet) {
			rs = statement.getResultSet();
			rsCount = 1;
			log.info("if 结果集个数rsCount=" + rsCount);
		}
			do {
				if (hasResultSet) {
					rs = statement.getResultSet();
					rsCount++;
					log.info("else 结果集个数rsCount=" + rsCount);
				} else
					if (statement.getUpdateCount() < 0) {
						break;
					}
				hasResultSet = statement.getMoreResults();
			} while(true);
			
		long t6 = System.currentTimeMillis();
		timeResult = t6 - t5;
		log.info("遍历结果耗时：" + timeResult + "ms");
		log.info("准备关闭CallableStatement。" + t6);
		statement.close();
		long t7 = System.currentTimeMillis();
		log.info("关闭CallableStatement完毕。耗时：" + (t7 - t6) + "ms");
		conn.commit();// 提交事务
		conn.setAutoCommit(true);//关闭事务
		long t8 = System.currentTimeMillis();
		timeClose = t8 - t7;
		log.info("提交和关闭事务完毕。耗时：" + timeClose + "ms");
	} catch (Exception e) {
		e.printStackTrace();
		message = e.getMessage();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			log.info("finally 关闭连接。");
		}
	}
	%>
	<form action="testjdbcPro.jsp" method="post">
<table border="1">
<tr>
	<td align="right">驱动类(CLASS)：</td>
	<td><input type="text" name="className" value="<%=className == null ? "net.sourceforge.jtds.jdbc.Driver" : className%>" style="width:500px"/></td>
</tr>
<tr>
	<td align="right">连接字符串(URL)：</td>
	<td><input type="text" name="url" value="<%=url == null ? "jdbc:jtds:sqlserver://10.10.202.10:1433;DatabaseName=BiData" : url%>" style="width:500px"/></td>
</tr>
<tr>
	<td align="right">用户名：</td>
	<td><input type="text" name="userName" value="<%=userName == null ? "admin" : userName%>" style="width:500px"/></td>
</tr>	
<tr>
	<td align="right">密码：</td>
	<td><input type="password" name="password" value="<%=password == null ? "admin" : password%>" style="width:500px"/></td>
</tr>
<tr>
	<td align="right">查询存储过程：</td>
	<td><textarea name="proQuery"  style="width:100%;height:300px"><%=proQuery == null ? "" : proQuery%></textarea></td>
</tr>
<tr>
	<td align="center" colspan="2"><input type="submit" value="提交" /></td>
</tr>
</table>
</form>

<div id="result">
测试结果：<br/>
创建连接耗时=<%=  timeCreate == -1 ? "未执行" : timeCreate + "ms"%><br/>
查询耗时=<%=  timeQuery == -1 ? "未执行" : timeQuery + "ms"%><br/>
结果集行数=<%=  rsCount == -1 ? "未执行" : rsCount%><br/>
遍历结果集耗时=<%=  timeResult == -1 ? "未执行" : timeResult + "ms"%><br/>
关闭连接耗时=<%=  timeClose == -1 ? "未执行" : timeClose + "ms"%><br/>
查询存储过程=<%=proQuery == null ? "" : proQuery%>
</div>
<div id="message" style="border: 1px">
错误信息：<%=message %>
</div>
</body>
</html>