<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/boarddb";
	String id = "root";
	String pass = "wind7622";
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM board3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
			hit++;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 - 상세 보기 (세 번째)</title>
</head>

<body>
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
						<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
						<td>내 용</td>
						<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
					</tr>
				</table>
					
				<table width="413">
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center">글번호</td>
						<td width="319"><%=idx %></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center">조회수</td>
						<td width="319"><%=hit %></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center">이름</td>
						<td width="319"><%=name %></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center">작성일</td>
						<td width="319"><%=time %></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center">제목</td>
						<td width="319"><%=title %></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0"></td>
						<td width="399" colspan="2" height="200"><%=memo %></td>
					</tr>
<%
			sql = "UPDATE board3 SET HIT=" + hit + " WHERE NUM=" + idx;
			stmt.executeUpdate(sql);
			
			rs.close();
			stmt.close();
			conn.close();
		}
	} catch(SQLException e) {
		out.println(e.toString());
	}
%>
					<tr height="1" bgcolor="#ddddd"><td colspan="4" width="407"></td></tr>
					<tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="2" width="399">
							<input type="button" value="글쓰기" OnClick="window.location='write.jsp'" />
							<input type="button" value="답글" OnClick="window.location='reply.jsp?idx=<%=idx %>'" />
							<input type="button" value="목록" OnClick="window.location='list.jsp'" />
							<input type="button" value="수정" OnClick="window.location='modify.jsp?idx=<%=idx %>'" />
							<input type="button" value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx %>'" />
						</td>
						<td width="0">&nbsp;</td>
					</tr>
				</talbe>
			</td>
		</tr>
	</table>
</body>
</html>