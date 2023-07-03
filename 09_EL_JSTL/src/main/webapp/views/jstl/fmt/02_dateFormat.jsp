<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 데이터 출력하기</title>
</head>
<body>
	<h2>날짜데이터 처리하기</h2>
	<c:set var="today" value="<%= new Date() %>"/>
	<h3><c:out value="${today }"/></h3>
	<ol>
		<li>type : date, time, both값을 설정</li>
			<ul>
				<li>date : 날짜만 출력 년, 월, 일 출력</li>
				<li>time : 시간만 출력 시, 분, 초, 출력</li>
				<li>both : 날짜와 시간 모두 출력 년, 월, 일, 시, 분, 초</li>
			</ul>
		<li>dateStyle : 날짜를 출력하는 방식(default, short, long, full)</li> 
		<li>timeStyle : 시간을 출력하는 방식(medium, short, long, full)</li>
	</ol> 
	<h3>date : <fmt:formatDate value="${today }" type="date"/></h3>
	<h3>time : <fmt:formatDate value="${today }" type="time"/></h3>
	<h3>both : <fmt:formatDate value="${today }" type="both"/></h3>
	
	<h2>기본스타일을 이용해서 형식변경하기</h2>
	<h3>date : <fmt:formatDate value="${today }" type="date" dateStyle="default"/></h3>
	<h3>short : <fmt:formatDate value="${today }" type="date" dateStyle="short"/></h3>
	<h3>long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/></h3>
	<h3>full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/></h3>
	
	<h3>medium : <fmt:formatDate value="${today }" type="time" timeStyle="medium"/></h3>
	<h3>short : <fmt:formatDate value="${today }" type="time" timeStyle="short"/></h3>
	<h3>long : <fmt:formatDate value="${today }" type="time" timeStyle="long"/></h3>
	<h3>full : <fmt:formatDate value="${today }" type="time" timeStyle="full"/></h3>
	
	<h3>두스타일 적용하기 :
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="short"/></h3>
	<h2>패턴으로 스타일 커스터마이징하기</h2>	
	<p>
		yy(년) MM(월) dd(일) hh(시) mm(분) ss(초) SSS(밀리세컨초)
	</p>
	<h3>
		<fmt:formatDate value="${today }" type="date" pattern="yyyy/MM/dd"/>
	</h3>
	<h3>
		<fmt:formatDate value="${today }" type="time" pattern="hh:mm:ss"/>
	</h3>
	<h3>
		<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd (E) hh:mm:ss"/>
	</h3>
	
	<h2>시간기준 설정해서 출력하기</h2>
	<h3>
		<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="time"/>
		</fmt:timeZone>
		<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="time"/>
		</fmt:timeZone>
	</h3>
	
	<h2>locale설정을 바꾸면 나라에 맞는 형식으로 날짜를 출력</h2>
	<h3>
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</h3>
	<fmt:setLocale value="ja_JP"/>
		<h3>
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</h3>
		<fmt:setLocale value="zh_CN"/>
		<h3>
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</h3>
		<fmt:setLocale value="fr_FR"/>
	<h3>
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</h3>
	<p>현재 로케일 확인 : ${pageContext.request.locale }</p>
</body>
</html>