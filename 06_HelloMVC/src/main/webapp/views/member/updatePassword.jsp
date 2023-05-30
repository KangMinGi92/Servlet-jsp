<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.member.dto.MemberDto" %> 
<%
	MemberDto loginMember=(MemberDto)session.getAttribute("loginMember");
	String password=String.valueOf(loginMember.getPassword());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div#updatePassword-container{
        background:red;
    }
    div#updatePassword-container table {
        margin:0 auto;
        border-spacing: 20px;
    }
    div#updatePassword-container table tr:last-of-type td {
        text-align:center;
    }
</style>
</head>
<body>
    <div id="updatePassword-container">
		<form name="updatePwdFrm" action="<%=request.getContextPath()%>/member/updatePasswordEnd.do" method="post" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="userId" value="<%=request.getParameter("userId")%>">
						<input type="submit" value="변경" onclick="return passwordCheck();">&nbsp;
						<input type="button" value="닫기" onclick="window.close();">						
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
<script>

	/*변경할 비밀번호 와 비밀번호 확인 일치여부 확인 후 submit넘김*/
	const passwordCheck=()=>{
		const passwordNew=document.getElementById("password_new").value;
		const passwordCheck=document.getElementById("password_chk").value;
		if(passwordNew==passwordCheck){
			return true;
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	}
	
/* 비밀번호 변경 새창에 입력된값 비밀번호,비밀번호 확인 value 에 대입
	const inputPassword=()=>{
		opener.document.getElementById("password_").value=document.getElementById("password_new").value;
		opener.document.getElementById("password_2").value=document.getElementById("password_chk").value;	
		close();
	} */

</script>
</html>