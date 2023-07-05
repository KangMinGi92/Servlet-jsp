<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.notice.model.vo.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%-- <%
	Notice n=(Notice)request.getAttribute("notice");
%> --%>
<%@ include file="/views/common/header.jsp"%>
<section id="notice-container">
	<c:set var="n" value="${notice }"/>
       <table id="tbl-notice">
       <tr>
           <th>제 목</th>
           <td>${n.noticeTitle}</td>
       </tr>
       <tr>
           <th>작성자</th>
           <td>${n.noticeWriter}</td>
       </tr>
       <tr>
           <th>첨부파일</th>
           <td>
           		<c:if test="${n.filePath!=null}">
          		<div id="download-container" onclick="fileDownload('${n.filePath}');"> <!-- 매개변수가 있는 함수를 호출! -->
          			<img src="${path }/images/file.png" width="20">
          			<span>${n.filePath}</span>
       			</div>
          		</c:if>
           </td>
       </tr>
       <tr>
           <th>내 용</th>
           <td>${n.noticeContent}</td>
       </tr>
       <c:set var="loginMember" value="${sessionScope.loginMember}"/>
       <c:if test="${loginMember!=null and loginMember.userId==admin or loginMember.userId==n.noticeWriter }">
       <tr>
           <th colspan="2">
               <input type="button" value="수정하기" onclick="">
               <input type="button" value="삭제하기" onclick="">
           </th>
       </tr>
       </c:if>
   </table>
   <script>
   const fileDownload=(filename)=>{
	   location.assign("${path}/fileDownload.do?name="+filename);
   }
   </script>
</section>
<style>
div#download-container{cursor:pointer;}
section#notice-container{width:600px; margin:0 auto; text-align:center;}
section#notice-container h2{margin:10px 0;}
table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
<%@ include file="/views/common/footer.jsp"%>