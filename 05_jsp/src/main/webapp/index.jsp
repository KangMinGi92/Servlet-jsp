<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 첫 jsp페이지</title>
</head>
<body>
	<h2>나의 첫 jsp페이지</h2>
	<h3>jsp가 제공하는 태그에 대해 알아보자.</h3>
	<ul>
		<li>
			지시자 : <%-- <%@ 태그명 속성설정(속성명="속성값") %> --%><br>
			page : 페이지에 대한 설정을 하는태그, 응답contentType, import정보, 언어정보 등을 설정<br>
			include : 페이지(jsp)내에 다른 페이지(jsp)를 불러올때 사용하는 태그 *헤더 푸터와 같은페이지에 사용<br>
			taglib : jsp에 적용할 외부라이브러리 등록(JSTL, springform)<br>
		</li>
		<li>
			선언문 : <%-- <%! 자바코드 %> --%><br>
			자바클래스 구현부에 작성하는 코드 (JAVA에 클래스 중괄호 부분에 들어갈 코드를 작성할때 사용)<br>
			메소드 선언, 멤버변수 선언 이용할떄 사용하지만 거의 사용하지 않음!<br>
			* 조건문, 반복문 등은 사용이 불가능함.<br>
		</li>
		<li>
			스크립트릿 : <%-- <% 자바코드 %> --%><br>
			자바의 메소드 내부에 들어갈 코드 작성할때 사용<br>
			많이 사용한다.<br>
			지역변수, 반복문, 조건문 사용<br>
		</li>
		<li>
			표현식 : <%-- <%= 출력할문구||변수명||메소드호출 %> --%><br>
			html 화면에 변수나, 메소드 실행결과를 출력할때 사용<br>
		</li>
	</ul>
	<h3>선언문 활용하기</h3>
	<%!
		//멤버변수, 멤버메소드를 선언할때 사용
		String testData;
		public int age=19;
		public String getMsg(){
			return "안녕하세요";
		}
		//조건문, 반복문은 사용할 수 없다.
		/*if(test.equals("test")){
			
		} */
		
		/* for(int i=0;i<10;i++){
			
		} */
	%>
	<h3>선언문에 작성한 내용 이용하기</h3>
	<ol>
		<li>testData : <%= testData %></li>
		<li>age : <%=age %></li>
		<li>getMsg() : <%=getMsg() %></li>
	</ol>
	<h3>스크립트릿이용하기</h3>
	<%
		//자바코드를 작성하는 부분
		//_jspservice()메소드 내부에 작성됨.
		String msg="이제 곧 lunch시간!";
		//public double height=180.5; java처럼 메소드내부에 접근제한자를 사용할 수 없다.
		int rndNum=(int)(Math.random()*10+1);
		if(rndNum>3){
			out.print("3보다크다!");
		}
		for(int i=0;i<10;i++){
			out.println("출력"+i+"<br>");
		}
	%>
	<h3><%=msg %></h3>
	<h3>랜덤수 : <%=rndNum %></h3>
	<%
		String[] names={"유병승","최주영","이은지","김현영","허성현","김찬은"};
	%>
	<ul>
		<%for(String name:names){
			if(!name.equals("최주영")){%>
			<li><%=name %></li>
			<%}%>
		<%}%>
	</ul>
	<%if(msg.contains("점심")){ %>
		<h1>점심 맛있게 드세요!!</h1>
	<%} %>
</body>
</html>