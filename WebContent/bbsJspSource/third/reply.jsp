<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<script language="javascript">	// 자바스크립트 시작
	function replyCheck()
	{
		var form = document.replyform;
		
		if(!form.name.value)		// form에 있는 name 값이 없을 때
		{
			alert("이름을 적어주세요.");	// 경고창 띄움
			form.name.focus();		// form에 있는 name 위치로 이동
			return;
		}
		
		if(!form.password.value)
		{
			alert("비밀번호를 적어주세요.");
			form.password.focus();
			return;
		}
		
		if(!form.title.value)
		{
			alert("제목을 적어주세요.");
			form.title.focus();
			return;
		}
		
		if(!form.memo.value)
		{
			alert("내용을 적어주세요.");
			form.memo.focus();
			return;
		}
		
		form.submit();
	}
</script>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/boarddb";
	String id = "root";
	String pass = "wind7622";
	
	String title = "";
	
	try {
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT TITLE FROM board3 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			title = rs.getString(1);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	} catch(SQLException e) {
		out.println(e.toString());
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 - 답글 (세 번째)</title>
</head>

<body>
	<table>
		<form name="replyform" method="post" action="reply_ok.jsp?idx=<%=idx %>">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
							<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
							<td>답글</td>
							<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
						</tr>
					</table>
					
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input name="title" size="50" maxlength="100" value="[답글] <%=title %>" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="name" size="50" maxlength="50" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input type="password" name="password" size="50" maxlength="50" /></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name="memo" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
						<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2">
								<input type="button" value="등록" OnClick="javascript:replyCheck();" />
								<input type="button" value="취소" OnClick="javascript:history.back(-1)" />
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>