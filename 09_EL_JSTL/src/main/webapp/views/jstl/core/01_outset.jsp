<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--JSTL을 적용하기 위해서는 반드시 페이지에 지시자로 taglib를 선언해야함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><c:out value="우와 코어태그로 출력"/></h3>
	<h3>${"우와 코어태그로 출력" }</h3>
	<h3><%="우와 코어태그로 출력" %></h3>
	<!--위 3가지 자바코드를 불러오는 방식  -->
	
	<h2>set/out태그 이용하기</h2>
	<p>
		c:out태그 : value속성에 있는 값을 페이지에 출력할 때 사용하는 태그<br>
		c:set태그 : 내장객체영역에 데이터를 key,value형식으로 저장할때 사용하는 태그<br>
	</p>
	<ul>c:set 태그속성
		<li>var : key값(변수명)을</li>
		<li>value : key에 저장된 값 / EL표현식, 리터럴 사용</li>
		<li>scope : 변수가 선언될 내장객체를 지정, request,session,application</li>
	</ul>
	<ul>c:out 태그속성
		<li>value : 출력될 데이터 / EL표현식, 리터럴을 사용</li>
		<li>default : 출력될 데이터가 없을때 대체로 출력하는 값</li>
		<li>escapeXml : value속성에 태그형식으로 작성했을때 태그로 해석할지 여부를 선택</li>
	</ul>
	<h3>변수선언하기</h3>
	<c:set var="comment" value="점심맛있게 먹었나요?"/>
	<p>${comment }</p>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	<p>절대경로 : ${path }</p>
	<c:set var="test" value="requestData" scope="request"/>
	<c:set var="test" value="sessionData" scope="session"/>
	<c:set var="test" value="applicationData" scope="application"/>
	<p>${test }</p>
	<p>${sessionScope.test }</p>
	<p>${applicationScope.test }</p>
	
	<h3>c:out태그로 데이터 출력하기</h3>
	<p><c:out value="점심은 뭐드셨나요?"/></p>
	<p><c:out value="${path }"/></p> 
	<p>${path }</p>
	<c:set value="<script>location.assign('http://www.naver.com');</script>" var="testData"/>
	<%-- <div>${testData }</div> --%><!--EL로 표현이 가능하긴하지만 보안상의 이유로 c:out으로 처리한다.!!  -->
	<div><c:out value="${testData }"/></div>
	<div><c:out value="${testData }" escapeXml="true"/></div> 
	<!--escapeXml은 자바스크립트에서 html로 데이터를 읽을지 아니면 innertext로 읽을지 처리하는거와 동일한 옵션  -->
	<!--escapeXml값이 false면 태그로 해석하고,true면 text로 해석하는 옵션  -->
	
	<p>${test11==null?"없음":test11 }</p>
	<c:set var="test11" value="있는값"/>
	<p><c:out value="${test11 }" default="없음"/></p>
	
	<h3>c:url태그</h3>
	<p>링크되는 주소값 데이터를 저장하는 태그 == c:set</p>
	<c:url var="cesearch" value="http://search.naver.com/search.naver">
		<c:param name="query" value="김찬은"/>
	</c:url>
	<a href="${cesearch}">검색</a>		
	<a href="<c:out value='${cesearch }'/>">검색</a>
	
	
</body>
</html>