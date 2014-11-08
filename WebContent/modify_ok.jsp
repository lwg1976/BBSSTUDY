<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/boarddb";
	String id = "root";
	String pass = "wind7622";
	
	String password = ""; 
	
	try {
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		String passwd = request.getParameter("password");
		
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PASSWORD FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			password = rs.getString(1);
		}
		
		if(password.equals(passwd))
		{
			sql = "UPDATE board SET TITLE='" + title + "', MEMO='" + memo + "' WHERE NUM=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
	self.window.alert("글이 수정되었습니다.");
	location.href="view.jsp?idx=<%=idx %>";
</script>
<%
			rs.close();
			stmt.close();
			conn.close();
		} else {
%>
<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>
<%
		}
	} catch(SQLException e) {
		out.println(e.toString());
	}
%>