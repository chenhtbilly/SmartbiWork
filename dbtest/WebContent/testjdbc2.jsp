<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,org.apache.log4j.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC驱动测试-Statement</title>
</head>
<body>
	<%
		String className = request.getParameter("className");	//驱动类名
		String url = request.getParameter("url");				//jdbc url
		String userName = request.getParameter("userName");		//数据库用户名
		String password = request.getParameter("password");		//数据库密码
		String sqlQuery = request.getParameter("sqlQuery");		//查询SQL
		String fetch = request.getParameter("fetch");		//是否setFetchSize 20行
		Logger log = Logger.getLogger(Connection.class);
		long timeCreate = -1;	//创建连接耗时(-1用来表示未执行成功)
		long timeQuery = -1;	//执行sql耗时
		long timeResult = -1;	//遍历结果集耗时
		long timeClose = -1;	//关闭连接耗时
		String message = "";	//错误信息
		Connection conn = null;
		ResultSet rs = null;
		Statement statement = null;
		int rsCount = -1;	//结果集行数(-1用来表示未执行)
		if ("".equals(className) || "".equals(url)) return;
		try {
			if (className != null && url != null) {
				long t1 = System.currentTimeMillis();
				log.info("准备创建连接：" + t1);
				Class.forName(className); 	//classLoader,加载对应驱动
	    		conn = (Connection) DriverManager.getConnection(url, userName, password);//获取连接  
				long t2 = System.currentTimeMillis(); 
				timeCreate = t2-t1;
				log.info("创建连接完成：" + t2 + "，耗时：" + timeCreate + "ms");
				if (!"".equals(sqlQuery) && sqlQuery != null){
					log.info("查询SQL：" + sqlQuery);
					long t3 = System.currentTimeMillis(); 
					log.info("准备执行SQL：" + t3);
					statement = conn.createStatement();
					if("1".equals(fetch)){
						log.info("setFetchSize");
						statement.setFetchSize(20);
					}
					rs = statement.executeQuery(sqlQuery);		//非预编译
					rsCount = 0;		//初始化查询结果集行数
					long t4 = System.currentTimeMillis();
					timeQuery = t4 -t3;
					log.info("执行SQL查询完毕：" + t4 + "，耗时：" + timeQuery + "ms");
					long t5 = System.currentTimeMillis();
					log.info("开始取结果集："  + t5);
					while(rs.next()){
						rsCount++;
					}
					long t6 = System.currentTimeMillis();
					timeResult = t6-t5;
					log.info("取结果集结束，" + t6 + "，总行数："+ rsCount + "，耗时：" + timeResult + "ms");
				}
			}
		} catch (Exception e) {
			log.error("执行sql出现异常：" + e.getMessage(), e);
			e.printStackTrace();
			message = e.getMessage();
		} finally {
			if(statement != null){
				statement.close();
			}
			if(rs != null){
				rs.close();
			}
			if (conn != null) {
				long t7 = System.currentTimeMillis(); 
				conn.close();
				long t8 = System.currentTimeMillis(); 
				timeClose = t8-t7;
				log.info("关闭连接成功：" + t8 + "，耗时：" + timeClose  + "ms");
			}
		}

	%>
</head>
<body >
<h3>数据库JDBC驱动创建和查询测试-Statement</h3>
<form action="testjdbc2.jsp" method="post">
<table border="1">
<tr>
	<td align="right">驱动类(CLASS)：</td>
	<td><input type="text" name="className" value="<%=className == null ? "com.mysql.jdbc.Driver" : className%>" style="width:500px"/></td>
</tr>
<tr>
	<td align="right">连接字符串(URL)：</td>
	<td><input type="text" name="url" value="<%=url == null ? "jdbc:mysql://localhost:6688/smartbidemo" : url%>" style="width:500px"/></td>
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
	<td align="right">setFetchSize：</td>
	<td>
		<input type="radio" name="fetch" value="1" />是
		<input type="radio" name="fetch" value="0" />否
	</td>
</tr>
<tr>
	<td align="right">查询SQL：</td>
	<td><textarea name="sqlQuery"  style="width:100%;height:300px"><%=sqlQuery == null ? "" : sqlQuery%></textarea></td>
</tr>
<tr>
	<td align="center" colspan="2"><input type="submit" value="提交" /></td>
</tr>
</table>
</form>

<div id="result">
测试结果：setFetchSize=<%=fetch %><br/>
创建连接耗时=<%=  timeCreate == -1 ? "未执行" : timeCreate + "ms"%><br/>
查询耗时=<%=  timeQuery == -1 ? "未执行" : timeQuery + "ms"%><br/>
结果集行数=<%=  rsCount == -1 ? "未执行" : rsCount%><br/>
遍历结果集耗时=<%=  timeResult == -1 ? "未执行" : timeResult + "ms"%><br/>
关闭连接耗时=<%=  timeClose == -1 ? "未执行" : timeClose + "ms"%><br/>
查询SQL=<%=sqlQuery == null ? "" : sqlQuery%>
</div>
<div id="message" style="border: 1px">
错误信息：<%=message %>
</div>
</body>
</html>