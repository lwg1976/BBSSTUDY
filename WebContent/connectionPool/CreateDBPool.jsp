<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.dbcp.*" %>
<%@ page import="org.apache.commons.pool.impl.*" %>

<%
	GenericObjectPool objectPool = new GenericObjectPool();
	DriverManagerConnectionFactory connectionFactory
		= new DriverManagerConnectionFactory
			("jdbc:mysql://localhost:3306/boarddb", "root", "wind7622");
	new PoolableConnectionFactory
		(connectionFactory, objectPool, null, null, false, true);
	PoolingDriver driver = new PoolingDriver();
	driver.registerPool("/webdb_pool", objectPool);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>커넥션 풀</title>
	</head>

	<body>
		<h3>데이터 베이스 커넥션 풀 생성하기</h3>
		데이터베이스 커넥션 풀을 생성하고 등록했습니다. <br /><br />
		풀 이름: /webdb_pool
	</body>
</html>