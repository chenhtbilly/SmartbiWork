<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,org.apache.log4j.*,javax.crypto.*,javax.crypto.spec.*,java.security.*,sun.misc.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>执行加密测试</title>
</head>
<body>
<%
		Logger log = Logger.getLogger(Connection.class);
		long time = -1L;
		long t1 = System.currentTimeMillis(); 
		log.info("开始：" + t1);
		for(int i=0;i<1000000;i++){
			try {
				 DESKeySpec dks = new DESKeySpec("abcd1234+".getBytes("utf-8"));
			     SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			     Key secretKey = keyFactory.generateSecret(dks);
	            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
	            IvParameterSpec iv = new IvParameterSpec("12345678".getBytes("utf-8"));
	            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
	            byte[] bytes = cipher.doFinal("testEnc1234".getBytes("utf-8"));
	 
	            String s = new String(new BASE64Encoder().encode(bytes));
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		long t2 = System.currentTimeMillis(); 
		log.info("结束：" + t2);
		time = t2 -t1;
		log.info("耗时：" + time);

%>
耗时=<%=  time == -1 ? "未执行" : time + "ms"%><br/>
</body>
</html>