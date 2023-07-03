<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp" %> --%>
<!-- jsp액션태그 이용해서 헤더 불러오기 -->
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/views/common/header.jsp">
	<jsp:param name="title" value="메인화면"/>
</jsp:include>
<section>
	<h3>본문내용을 출력하자...</h3>
	<%-- <p>접속한 회원 : <%=userId %></p> --%>
	<!-- jsp:include로 페이지 불러오면 헤더에 저장한 변수를 불러올 수 없다.! -->
</section>
	<%-- <jsp:forward page="/views/board.jsp"/> --%>
	<!--위 액션태그는 페이지 전환용 태그이지만, mvc2패턴부터는 페이지 전환을 서블릿에서 해주기때문에 거의 사용하지 않는다.  -->
</body>
</html>