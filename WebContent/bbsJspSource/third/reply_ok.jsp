<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/boarddb";
	String id = "root";
	String pass = "wind7622";
	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));	
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;
		
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT REF, INDENT, STEP FROM board3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE board3 SET STEP=STEP+1 WHERE REF=" + ref + " AND STEP>" + step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO board3(USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP)"
				+ "VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute();
		
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
	} catch(SQLException e) {
		out.println(e.toString());
	}
%>

<script language="javascript">
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
</script>