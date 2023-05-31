<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.MemberDto" %>  
<%
MemberDto loginMember=(MemberDto)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴하기</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/member/deleteMemberEnd.do?userId=<%=loginMember.getUserId()%>" method="post">
			<input type="password" name="password" id="password" required>
			<input type="submit" value="탈퇴하기">
	</form>
</body>
</html>