<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.MemberDto" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%-- <%
	MemberDto loginMember=(MemberDto)session.getAttribute("loginMember");
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloMVC</title>
<link rel="stylesheet" type="text/css" href="${path}/css/style.css">
<script src="${path }/js/jquery-3.7.0.min.js"></script>

</head>
<body>
	<div id="container">
	<header>
		<h1><a href="${path }/index.jsp" style="text-decoration: none; color:black;">HelloMVC</a></h1>
		<div class="login-container">
		<c:set var="loginMember" value="${loginMember}" scope="session"/>
		<c:set var="saveId" value="${cookie.saveId }"/>
		<c:if test="${empty loginMember }">
			<form id="loginFrm" action="${path }/login.do"
			method="post" onsubmit="return fn_validataion();">
				<table>
					<tr>
						<td>
							<input type="text" name="userId" id="userId" 
							placeholder="아이디" value="${not empty saveId?saveId.value:''}">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="password" id="password" placeholder="패스워드">
						</td>
						<td>
							<input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="saveId" id="saveId" 
							${not empty saveId?"checked":""}>
							<label for="saveId">아이디저장</label>
							<input type="button" value="회원가입" 
							onclick="location.assign('${path}/member/enrollMember.do')">
						</td>
					</tr>
				</table>
			</form>
			</c:if>
			<c:if test="${not empty loginMember }">
				<table id="logged-in">
					<tr>
						<td colspan="2">
							${loginMember.userName}님, 환영합니다. :)
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="내 정보보기" onclick="location.replace('${path }/member/memberView.do?userId=${loginMember.userId}')">
						</td>
						<td>
							<input type="button" value="로그아웃" onclick="location.replace('${path}/logout.do')">	
						</td>
											
					</tr>
				
				</table>
			</c:if>
		</div>
		<nav>
			<ul class="main-nav">
				<li class="home"><a href="${path}/index.jsp">Home</a></li>
				<li id="notice"><a href="${path}/notice/noticeList.do">공지사항</a></li>
				<li id="board"><a href="${path}/board/boardList.do">게시판</a></li>
				<c:if test="${not empty loginMember and loginMember.userId=='admin'}">
				<li id="memberManage"><a href="${path}/admin/memberList.do">회원관리</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	<script>
		const fn_validataion=()=>{
			const userId=$("#userId").val();
			if(userId.length<4){
				alert('아이디는 4글자 이상입니다.');
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
			/* if($("#password").length<8){
				return false;
			} */
		}
	</script>
