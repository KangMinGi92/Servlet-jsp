<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	div#board-container{width:600px; margin:0 auto; text-align:center;}
	div#board-container h2{margin:10px 0;}
	table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse;}
	table#tbl-board th{width:125px; border:1px solid; padding:5px 0; text-align:center;}
	table#tbl-board td{border:1px solid;padding:5px 0 5px 10px;text-align:left;}
</style>
<div id='board-container'>
	<h2>게시판 작성</h2>
	<form action='${path}/board.insertBoard.do' method="post" enctype="multipart/form-data">
		<table id='tbl-board'>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="boardWriter" value="<${sessionScope.loginMember.userId}" readonly></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upFile"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols="42" rows="5" name="boardContent" id="boardContent"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="게시글등록하기" onclick="return enrollcheck();">
				</th>
			</tr>
		</table>
	</form>
</div>
<script>
	function enrollcheck(){
		const content=$("#boardContent").val();
		if(content==""){
			return false;
		}else{
			return true;
		}
	}
</script>
<%@ include file="/views/common/footer.jsp"%>