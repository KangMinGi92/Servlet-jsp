<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp'%>
	<section>
		<p><%=headerData %></p>
		<!-- include로 불러온데이터는 해당 파일에 선언한 데이터를 가져다 쓸 수 있다. -->
		<table>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>			
			</tr>
			<tr>
				<td>제목1</td>
				<td>작성자1</td>
				<td>작성일1</td>			
			</tr>
		</table>
	</section>
<%@ include file="/views/common/footer.jsp"%>