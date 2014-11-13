<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.dbcp.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>데이터베이스 커넥션 풀 목록</title>
	</head>

	<body>
		<h3>데이터베이스 커넥션 풀 목록</h3>
<%
		PoolingDriver driver = (PoolingDriver) DriverManager.getDriver
			("jdbc:apache:commons:dbcp:");
		String[] names = driver.getPoolNames();
		
		for(int cnt=0; cnt<names.length; cnt++)
		{
			out.println(names[cnt] + "<br />");
		}
%>
	</body>
</html>