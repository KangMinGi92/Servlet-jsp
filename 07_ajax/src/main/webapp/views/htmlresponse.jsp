<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.ajax.model.vo.Actor" %>

<%
	//ajax 응답페이지 작성방법은 ajax가 넣어줄 태그들만 만들어서 넣어주면된다.
	List<Actor> actors=(List<Actor>)request.getAttribute("actors");
%>
<table>
	<tr>
		<th>이름</th>
		<th>전화번호</th>
		<th>프로필</th>
	</tr>
	<%if(actors.isEmpty()){ %>
		<tr>
			<td colspan="3">조회된 배우가 없습니다.</td>
		</tr>
	<%}else{ 
		for(Actor a : actors){%>
			<tr>
				<td><%=a.getName() %></td>
				<td><%=a.getPhone() %></td>
				<td>
					<img src="<%=request.getContextPath() %>/images/<%=a.getProfile()%>" height="50" width="50">
				</td>
			</tr>
		<%} %>
	<%} %>
</table>