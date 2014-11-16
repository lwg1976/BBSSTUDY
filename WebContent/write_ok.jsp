<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bbsModel1.DAO" />
<jsp:useBean id="vo" class="bbsModel1.VO" />
<jsp:setProperty name="vo" property="*" />

<%
	request.setCharacterEncoding("UTF-8");	// 받아오는 값들을 한글로 인코딩합니다.
	int max = dao.getMax();
	dao.insertWrite(vo, max);
%>

<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
</script>