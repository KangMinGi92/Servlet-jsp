<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.board.model.vo.Board, java.util.List, com.web.board.model.vo.BoardComment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
	Board b=(Board)request.getAttribute("board");
	List<BoardComment> comments=(List)request.getAttribute("comments");
%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ include file="/views/common/header.jsp"%>
<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
     div#comment-container button#btn-insert{width:60px;height:50px; color:white;
    background-color:#3300FF;position:relative;top:-20px;}
        /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-update{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-update{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
    /*답글관련*/
    table#tbl-comment textarea{margin: 4px 0 0 0;}
    table#tbl-comment button.btn-insert2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}
</style>
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board">
	<c:set var="b" value="${requestScope.board}"/>
		<tr>
			<th>글번호</th>
			<td>${b.boardNo}</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>${b.boardTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${b.boardWriter}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${b.boardReadcount}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${not empty b.boardRenamedFilename }">
          			<img src="${path}/images/file.png" width="20">
          			<span>${b.boardRenamedFilename}</span>
          		</c:if>
			</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>${b.boardContent}</td>
		</tr>
		<c:set var="loginMember" value="${sessionScope.loginMember }"/>
		<c:if test="${not empty loginMember and loginMember.userId==admin or loginMember.userId==b.boardWriter}">
	        <tr>
	           <th colspan="2">
	               <input type="button" value="수정하기" onclick="">
	               <input type="button" value="삭제하기" onclick="">
	           </th>
	       </tr>
       </c:if>
	</table>
	<div id="comment-container">
			<div class="comment-editor">
				<form action="${path}/board/insertComment.do" method="post">
					<textarea name="content" cols="55" rows="3" style="resize: none;"></textarea>
					<input type="hidden" name="boardRef" value="${b.boardNo}">
					<input type="hidden" name="level" value="1">
					<input type="hidden" name="boardCommentWriter" value="${not empty loginMember?loginMember.userId:''}">
					<input type="hidden" name="boardCommentRef" value="0">
					<button	type="submit" id="btn-insert">등록</button>
				</form>
			</div>
		</div>
		<table id="tbl-comment">
			<c:set var="comments" value="${requestScope.comments }"/>
			<c:if test="${not empty comments }">
				<c:forEach var="bc" items="${comments }">
					<c:if test="${bc.level==1 }">
						<tr class="levle1">
							<td>
								<sub class="comment-writer">${bc.boardCommentWriter}</sub>
								<sub class="comment-date">${bc.boardCommentDate}</sub>
								<br>
								${bc.boardCommentContent}
							</td>
							<td>
								<c:if test="${not empty loginMember}">
								<button class="btn-reply" value="${bc.boardCommentNo}">답글</button>
								</c:if>
								<c:if test="${not empty loginMember and loginMember.userId==b.boardWriter}">
								<button class="btn-update">수정</button>
								<button class="btn-delete">삭제</button>
								</c:if>
							</td>
						</tr>
					</c:if>
					<c:if test="${bc.level!=1 }">
						<tr class="level2">
							<td>
								<sub class="comment-writer">${bc.boardCommentWriter}</sub>
								<sub class="comment-date">${bc.boardCommentDate}</sub>
								<br>
								${bc.boardCommentContent}
							</td>
							<td></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
</section>
<script>
	$("#comment-container textarea[name=content]").focus(e=>{
		if(${loginMember==null}){
			alert("로그인 후 이용할 수 있습니다.");
			$("#userId").focus();
		}
	});
	$(".btn-reply").click(e=>{
		const tr=$("<tr>");
		const td=$("<td>").attr("colspan","2");
		const boardCommentRef=$(e.target).val();
		console.log(boardCommentRef);
		const form=$(".comment-editor>form").clone();
		form.find("textarea").attr("rows","1");
		form.find("input[name=level]").val("2");
		form.find("input[name=boardCommentRef]").val(boardCommentRef);
		td.css("display","none");
		td.append(form);
		tr.append(td);
		/* $(e.target).parents("tr").after(tr.children("td").slideDown(800)); */
		/* $(e.target).parents("tr").after(tr); */
		tr.insertAfter($(e.target).parents("tr")).children("td").slideDown(800);
		$(e.target).off("click");
	});
</script>
<%@ include file="/views/common/footer.jsp" %>