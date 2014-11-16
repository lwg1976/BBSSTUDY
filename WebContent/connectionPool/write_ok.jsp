<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");	// 받아오는 값들을 한글로 인코딩합니다.
	
	String name = request.getParameter("name");			// write.jsp에서 name에 입력한 데이터 값
	String password = request.getParameter("password");	// write.jsp에서 password에 입력한 데이터 값
	String title = request.getParameter("title");		// write.jsp에서 title에 입력한 데이터 값
	String memo = request.getParameter("memo");			// write.jsp에서 memo에 입력한 데이터 값
	int max = 0;
	
	try {
		Class.forName("org.apache.commons.dbcp.PoolingDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:apache:commons:dbcp:/wdbpool");
		
		if(conn==null)
		{
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM board";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			max = rs.getInt(1);	
		}

		sql = "INSERT INTO board(USERNAME, PASSWORD, TITLE, MEMO, REF) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		
		pstmt.execute();
		
		pstmt.close();
		conn.close();
	} catch(SQLException e) {
		out.println(e.toString());
	}
%>

<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
</script>