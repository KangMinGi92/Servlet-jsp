<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%//https://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/ 들어가서 참고할것!! %>
	<c:set var="data" value="How Are You? I am Fine"/>
	<h3><c:out value="${data }"/></h3>
	<h3><c:out value="${fn:toUpperCase(data) }"/></h3>
	<h3><c:out value="${fn:toLowerCase(data) }"/></h3>
	<h3><c:out value="${fn:replace(data,'Fine','Bad') }"/></h3>
	<h3><c:out value="${fn:contains(data,'Fine')?'깝치지마라':'슬프네'}"/></h3>
</body>
</html>