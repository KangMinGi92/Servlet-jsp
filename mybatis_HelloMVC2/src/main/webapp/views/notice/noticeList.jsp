<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.web.notice.model.vo.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ include file="/views/common/header.jsp"%>
 <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse;}
    table#tbl-notice th, table#tbl-notice td {border:1px solid; padding: 5px 0; text-align:center;} 
    #pageBar{font-weight:bolder;}
    #pageBar a,#pageBar span{
    	text-decoration:none;
    	font-size:20px;
    	margin-left:2%;
    	margin-right:2;
    }
    section#notice-container>div:first-of-type{
    	display:flex;
    	justify-content:end;
    }
</style>
<section id="notice-container">
	<h2>공지사항</h2>
	<div>
		<c:if test="${loginMember!=null and loginMember.userId=='admin'}">
			<button onclick="location.assign('${path}/notice/insertForm.do')">글쓰기</button>
		</c:if>
	</div>
       <table id="tbl-notice">
           <tr>
           
               <th>번호</th>
               <th>제목</th>
               <th>작성자</th>
               <th>첨부파일</th>
               <th>작성일</th>
           </tr>
        <c:if test="${empty notices }">
			<tr>
				<td colspan="5">조회된 공지사항이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty notices }">
			<c:forEach var="n" items="${notices }">
				<tr>
					<td>${n.noticeNo}</td>
					<td>
						<a href="${path}/notice/noticeView.do?no=${n.noticeNo}">${n.noticeTitle}</a>		
					</td>
					<td>${n.noticeWriter}</td>
					<td>
						<c:if test="${not empty n.filePath}">
							<img src="${path }/images/file.png" width="20">
						</c:if>
						<c:if test="${empty n.filePath}">
							<span>첨부파일이 없습니다.</span>
						</c:if>
					</td>
					<td><fmt:formatDate value="${n.noticeDate}" type="date"/></td>
				</tr>
			</c:forEach>
		</c:if>
       </table>
       <div id="pageBar">
       		${pageBar}
       </div>
</section>
<%@ include file="/views/common/footer.jsp"%>