<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp" %>
<jsp:useBean id="bbsView" class="model1.BBSView" />
<jsp:setProperty name="bbsView" property="num" value="${parm.idx}" />
<jsp:setProperty name="bbsView" property="pg" value="${parm.pg}" />

<% bbsView.readDB(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 내용 보기</title>
</head>

<body>
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
						<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
						<td>내  용</td>
						<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
					</tr>
				</table>
				
				<table width="413">
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">글번호</td>
						<td width="319">${bbsView.num}</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">조회수</td>
						<td width="319">${bbsView.hit}</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">이름</td>
						<td width="319">${bbsView.userName}</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">작성일</td>
						<td width="319">${bbsView.date}</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">제목</td>
						<td width="319">${bbsView.title}</td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td width="399" colspan="2" height="200">${bbsView.memo}</td>
					</tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="2" width="399">
							<input type=button value="글쓰기" Onclick="window.location='write.jsp'" />
							<input type=button value="답글" OnClick="window.location='reply.jsp?idx=${bbsView.num}&pg=${bbsView.pg}'" />
							<input type=button value="목록" Onclick="window.location='list.jsp?pg=${bbsView.pg}'" />
							<input type=button value="수정" Onclick="window.location='modify.jsp?idx=${bbsView.num}&pg=${bbsView.pg}'" />
							<input type=button value="삭제" Onclick="window.location='delete.jsp?idx=${bbsView.num}&pg=${bbsView.pg}'" />
						</td>
						<td width="0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>