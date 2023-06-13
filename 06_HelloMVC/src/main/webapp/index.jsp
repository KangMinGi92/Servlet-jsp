<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
	div#quest{display:flex; justify-content:center;}
	div#memberList{display:flex; justify-content:center;}
	div#memberList>table th, div#memberList>table td{border:1px solid black;}
</style>
<section id="content">
	<h2 align="center" style="margin-top:200px">
		안녕하세요. MVC입니다.
	</h2>
	<div id=quest>
	<button id="memberAll">전체회원조회</button>
	<input type="text" id="id"><button id="searchId">아이디조회</button>
	</div>
	<div id="memberList"></div>
	
	<script>
		$("#searchId").click(e=>{
			//console.log($("#id").val());
			if($("#id").val()!=""){
			$.ajax({
				url:"<%=request.getContextPath()%>/gsonSearchId.do",
				data:{id:$("#id").val()},
				dataType:"json",
				success:data=>{
					console.log(data);
					const table=$("<table>").css({"text-align":"center"});
					const header=$("<tr>")
					const headerdata=["아이디","이름","나이","성별","이메일","전화번호","주소","취미","가입일"]
					headerdata.forEach(e=>{
						const th=$("<th>").text(e);
						header.append(th);
					})
					table.append(header);
					data.forEach(e=>{
						const tr=$("<tr>");
						const userId=$("<td>").text(e.userId);
						const userName=$("<td>").text(e.userName);
						const age=$("<td>").text(e.age);
						const gender=$("<td>").text(e.gender);
						const email=$("<td>").text(e.email);
						const phone=$("<td>").text(e.phone);
						const address=$("<td>").text(e.address);
						const hobby=$("<td>").text(e.hobby);
						const enrollDate=$("<td>").text(e.enrollDate);
						tr.append(userId).append(userName).append(age).append(gender).append(email).append(phone).append(address).append(hobby).append(enrollDate);
						table.append(tr);
						});
						$("#memberList").html(table);
				}
				
			});
			}else{
				alert("조회된 아이디가 없습니다.");
			}
		})
		
		
		$("#memberAll").click(e=>{
			$.get("<%=request.getContextPath()%>/gsonMemberAll.do",
					data=>{
						console.log(data);
						const table=$("<table>").css({"text-align":"center"});
						const header=$("<tr>")
						const headerdata=["아이디","이름","나이","성별","이메일","전화번호","주소","취미","가입일"]
						headerdata.forEach(e=>{
							const th=$("<th>").text(e);
							header.append(th);
						})
						table.append(header);
						data.forEach(e=>{
							//console.log(e.userId);
							const tr=$("<tr>");
							const userId=$("<td>").text(e.userId);
							const userName=$("<td>").text(e.userName);
							const age=$("<td>").text(e.age);
							const gender=$("<td>").text(e.gender);
							const email=$("<td>").text(e.email);
							const phone=$("<td>").text(e.phone);
							const address=$("<td>").text(e.address);
							const hobby=$("<td>").text(e.hobby);
							const enrollDate=$("<td>").text(e.enrollDate);
							tr.append(userId).append(userName).append(age).append(gender).append(email).append(phone).append(address).append(hobby).append(enrollDate);
							table.append(tr);
							})
							$("#memberList").html(table);
					})
		});
		
		
	</script>
</section>
<%@ include file="/views/common/footer.jsp" %>
