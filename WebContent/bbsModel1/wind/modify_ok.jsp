<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String password = ""; 
	
	try {
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		String passwd = request.getParameter("password");
		
		Class.forName("org.apache.commons.dbcp.PoolingDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:apache:commons:dbcp:/wdbpool");
		
		if(conn==null)
		{
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		
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
	location.href="view.jsp?idx=<%=idx %>&pg=<%=pg %>";
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