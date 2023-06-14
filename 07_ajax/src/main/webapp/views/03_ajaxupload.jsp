<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax파일 업로드시키기</title>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h2>ajax를 이용해서 파일 업로드 하기</h2>
	<input type="file" id="upFile" multiple>
	<button id="uploadBtn">업로드파일</button>
	<script>
		$("#uploadBtn").click(e=>{
			//js가 제공하는 formData클래스를 이용함.
			const form=new FormData();
			//append로 서버에 전송할 데이터를 넣을 수 있음.
			const fileInput=$("#upFile");
			console.log(fileInput);
			$.each(fileInput[0].files,(i,f)=>{
				form.append("upfile"+i,f);
			});
			form.append("name","유병승");
			$.ajax({
				url:"<%=request.getContextPath()%>/fileUpload",
				data:form,
				type:"post",
				processData:false,
				contentType:false,
				success:data=>{
					alert("업로드가 완료되었습니다.");
				},
				error:(r,m)=>{
					alert("업로드 실패했습니다."+m);
				},
				complete:()=>{
					$("#upFile").val('');
				}
			})
		});
	</script>
	<h2>업로드 이미지 미리보기 기능</h2>
	<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8HDxAPEBAQDxMOEA8QEBINDw8QDxAPFREWFhYSFhMYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAbAAEBAAMBAQEAAAAAAAAAAAAABQEEBgMCB//EADIQAQABAgMEBwgDAQEAAAAAAAABAgMEESEFMVFxEhMyQWGRsSJCcoGhwdHhUqLwYiP/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A/awAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABjc0cRtKmjSiOlPH3f2DfYmckK7jLl3fVMeFOkPCZz8QdJE5suajR62sVctbqp5TrH1B0AnYfacTpXGXjG75woU1RVGcTnE98bgZAAAAAAAAAAAAAAAAAAAAYqqimM50iN+bKVtXE9KerjdHa8Z4fIHjjcbOI0jSnh3z4z+GoAAAAADYwmKqw08aZ3x944S1wHR2rkXYiqNYl9ouzsT1NWU9mr6T3StAAAAAAAAAAAAAAAAAAA879zqaaqv4xn8+5z0znrO+d/NX2tX0bcR/KqPpqjgAAAAAAAAL2Bu9dbpnvjSecf6EFU2NV26eU/b8ApAAAAAAAAAAAAAAAAAAnbZ7NHxT6JSxtanpW8/wCNUT56I4AAAAAAAACjsbtV/DHqnKmxqdK6uUeWv3BSAAAAAAAAAAAAAAAAAB8XrfW0zT/KMnO1RNMzE6TGk83Spe1cNlPWRunteE8QTQAAAAAAAF/BWupt0x3755ym7Nw3XVdKezTPnVwWQAAAAAAAAAAAAAAAAAAGJjpaTrnxYrriiM5mIjjOjxs423eq6MTyzjLPkCbjcDNj2qdafOaefh4tN0zSxOzqbutPsT/Wfl3AjDZu4G5b93P4dXhNE074mOcSD5GYpme6flEve3g7lzdTMfFp6g12zg8JViZ4U98/aOLdw+zIp1rnpeEbv234jLSNMuAMW6ItxFMRlEPp4YjF0YeYiZ1nujWYjjL0tXabsZ0zEx4A+wAAAAAAAAAAAAAAAGni8fTZ0p9qr6Rza2Ox/SzponTvq48k4HpevVXpzqnP0jlDzAG/hdpTRpX7Ucfe/anZv0XuzVE+vk51mJyB0og28bct+9M/FlPq9o2pcjuon5T+QWBHnalzhR5T+XlXjrtfvZfDEQC1cu02ozqmI5p2J2nnpbjL/qd/yhOmZq1mc+erAM1TNU5zOczvmd8vq3cm1OdMzE+D4AVsJtGK9K8qZ4+7P4UHMt3A46bPs1a0/Wn9AsjETFUZxrE6wyAAAAAAAAAAAlbSxnSzopnT3pjv8OTY2liupjox2qo8qeKMAAAAAAAAAAAAAAAADd2fjOono1dmf6zx5LDmlTZWKz/857uzy4ApAAAAAAAAPm5XFuJqndEZy+k3a97KIojv1n7AnXrs3qpqnfP08HwAAAAAAAAAAAAAAAAADNNU0TExpMawwA6HDXov0xVx3+E98PVI2Te6NU0Tuq1j4o/SuAAAAAAA57FXeurqq4zpyjcuYqvq6Kp4ROXOdHPAAAAAAAAAAAAAAAAAAAAA+qK5tzFUb4mJh0VNXSiJjvjP5ObXNm19O1T/AM50+X+gG0AAAAADS2tVlby41RH3+yMrbYn2afin0SQAAAAAAAAAAAAAAAAAAAAFXY1WlceMT5x+kpR2NOtfKPUFUAAAAAE7bPZo5z6JQAAAAAAAAAAAAAAAAAAAAAKGxu1V8MeoArAAAA//2Q=="
	width="100" height="100" id="profile">
	<input type="file" style="display:none" id="profileInput" accept="image/*">
	<br><br><br>
	<input type="file" id="upfiles" multiple accept="image/*">
	<div id="uploadpreview"></div>
	<script>
		$("#upfiles").change(e=>{
			$("#uploadpreview").html('');
			const files=e.target.files;
			$.each(files,(i,f)=>{
				const reader=new FileReader();
				reader.onload=e=>{
					const img=$("<img>").attr({
						"src":e.target.result,
						"width":"100",
						"height":"100"
					});
					$("#uploadpreview").append(img);
				}
				reader.readAsDataURL(f);
			})
		});
		
		$("#profile").click(e=>{
			$("#profileInput").click();
		});
		
		$("#profileInput").change(e=>{
			const reader=new FileReader();
			reader.onload=e=>{
				//e.target.result속성에 변경된 file이 나옴.
				$("#profile").attr("src",e.target.result);
			}
			reader.readAsDataURL(e.target.files[0]);
		});
	</script>
	<style>
		#profile{
			border-radius:100px;
			border:3px solid yellow;
		}
	</style>
	
</body>
</html>