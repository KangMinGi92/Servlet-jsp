<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include태그를 이용해서 공용페이지 불러오기  -->
<%@ include file="/views/common/header.jsp" %>
	<section>
		<h2>본문내용</h2>
		<p><%=headerData %></p>
		<!-- include로 불러온데이터는 해당 파일에 선언한 데이터를 가져다 쓸 수 있다. -->
	</section>
<%@ include file="/views/common/footer.jsp"%>