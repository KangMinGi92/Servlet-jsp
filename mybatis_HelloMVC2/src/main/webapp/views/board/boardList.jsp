<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.board.model.vo.Board, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%
	List<Board> boards=(List)request.getAttribute("boards"); 
%> --%>
<%@ include file="/views/common/header.jsp"%>
<c:set var="boards" value="${boards}"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<section id="board-container">
	<h2>게시판 </h2>
	<c:if test="${not empty sessionScope.loginMember }">
		<form>
			<input type="button" id="btn-add" value="글쓰기" onclick='location.assign("${path}/board/insertboardForm.do")'>
		</form>
	</c:if>
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${empty boards }">
		<tr>
			<td colspan="6">조회된 게시판이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty boards }">
			<c:forEach var="b" items="${boards }" varStatus="">
				<tr>
					<td>${b.boardNo}</td>
					<td>
						<a href="${path}/board/boardView.do?no=${b.boardNo}">${b.boardTitle }</a>
					</td>
					<td>${b.boardWriter}</td>
					<td>${b.boardDate}</td>
					<td>
					<c:if test="${not empty b.boardRenamedFilename }">
						<img src="${path}/images/file.png" width="20">
					</c:if>
					</td>
					<td>${b.boardReadcount}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<c:set var="pageBar" value="${requestScope.pageBar}" />
    <div id="pageBar">
    	<c:out value="${pageBar}" escapeXml="false"/>
    </div>
</section>
<style>
	section#board-container{width:600px; margin:0 auto; text-align:center;}
	section#board-container h2{margin:10px 0;}
	table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	div#pageBar span.cPage{color: #0066ff;}
    }
</style>
<%@ include file="/views/common/footer.jsp"%>