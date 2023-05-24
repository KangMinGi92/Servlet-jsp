<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3 style="color:red">500에러 발생발생!!!</h3>
	<!-- page속성에 isErrorPage="true"로 설정해야 exception 을 설정할 수 있다. -->
	<p><%=exception.getMessage() %></p>
</body>
</html>