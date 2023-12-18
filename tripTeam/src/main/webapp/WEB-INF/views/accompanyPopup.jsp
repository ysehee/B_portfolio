<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<title>동행신청하기</title>
	<style>
		.accPickPopup {
			width: 100%;
			height: 100%;
			border-radius: 10px;
			border: 1px solid ;
			padding: 7px;
			box-sizing: border-box;
		}
		.accPickInputBox{
			display: flex;
			flex-direction: column;
			gap: 3px;
		}
		.accPickPopup input {
			/*display: inline-block;*/
			width: 78%;
			padding: 10px 20px;
			border-radius: 8px;
			border: 1px solid rgb(219, 219, 219);
			margin-bottom: 10px;
			outline: none;

		}
		.accPickInput{
			display: flex;
			gap: 3px;
		}
		.accPickInput div {
			width: 22%;
			font-family: Noto Sans KR,sans-serif;
			font-weight: 800;
		}

		.accFont8{
			font-family: Noto Sans KR,sans-serif;
			font-weight: 800;
		}
		.accPickInputBox{
			width: 500px;
			margin: 0 auto;
		}


		.button_tag {
			display: flex;
			justify-content: center;
			margin: 0 auto;
			gap: 10px;
			margin-top: 20px;
		}

		.accPickPopup button {
			width: 180px;
			height: 50px;
			text-align: center;
			border-radius: 8px;
			font-size: 16px;
			font-family: Noto Sans KR,sans-serif;
			font-weight: 500;
			border: none;

			color: white;
			background-color: #87C4FF;
		}
	</style>
	<!-- 글씨폰트 NOTO SANS KR  -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<div class="accPickPopup">
	<h2 class="accFont8" style="text-align: center">동행신청하기</h2>

	<div class="accPickInputBox">
			<input type="hidden" name="accompanyNo" id="childAccompanyNo" readonly>
		<div class="accPickInput">
			<div>동행글 제목</div>
			<input type="text" name="accompanyTitle" id="childAccompanyTitle" readonly>
		</div>
		<div class="accPickInput">
			<div>동행글 작성자</div>
			<input type="text" name="accompanyWriter" id="childAccompanyWriter" readonly>
		</div>
		<div class="accPickInput">
			<div>동행 신청자</div>
			<input type="text" name="userId" id="childAccompanyPickApyUser" value=${loginUserId} readonly>
		</div>
		<div class="accPickInput">
			<div>동행 메세지</div>
			<input type="text" name="accompanyMessage" id="childAccompanyMessage" placeholder="동행글 작성자에게 보낼 메세지를 입력하세요. ">
		</div>
			<input type="hidden" name="accompanyApyDate" id="childAccompanyApyDate">
	</div>
	<div class="button_tag " >
	<button type="button" id="pickU">보내기</button>
	<button type="button" id="accCancel">취소</button>
	</div>
</div>




<script>

	var parentAccNo = opener.window.document.getElementById("parentAccompanyNo").value;
	document.getElementById('childAccompanyNo').value = parentAccNo;

	var parentApy = opener.window.document.getElementById("parentAccompanyTitle").value;
	document.getElementById('childAccompanyTitle').value = parentApy;

	var parentWrt = opener.window.document.getElementById("parentAccompanyWriter").value;
	document.getElementById('childAccompanyWriter').value = parentWrt;

	var parentApy = opener.window.document.getElementById("parentaccompanyPickApyUser").value;
	document.getElementById('childAccompanyPickApyUser').value = parentApy;

	// var parentApy = opener.window.document.getElementById("parentaccompanyApyDate").value;
	// document.getElementById('childAccompanyApyDate').value = parentApy;


	$('#pickU').click(function (){
		console.log("보내기 클릭")

		Rdata = { // 보내줄 값
			accompanyNo : document.getElementById('childAccompanyNo').value,
			accompanyPickApyUser : document.getElementById('childAccompanyPickApyUser').value,
			accompanyWriter : document.getElementById('childAccompanyWriter').value,
			accompanyMessage : document.getElementById('childAccompanyMessage').value,
			accompanyApyDate : document.getElementById('childAccompanyApyDate').value
		}

		console.log(Rdata);
		console.log("Rdata 보낼 준비")


		$.ajax({
			url: "pickU",
			type: 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			// dataType : 'json',
			data: Rdata,
			success: function onData (data) {
				console.log(data);

				if(data ==1){
					alert("동행 신청 완료!")
					window.close();
				}
				else{
					alert("에러 발생!")
				}

			},
			error: function onError (error) {
				console.error("알 수 없는 에러 발생! / 에러내용: " +error);
				alert("동행 메세지를 입력하세요")
			}
		});
	})

	$('#accCancel').click(function (){
		console.log("닫혀라")
		window.close();
	})




</script>


</body>
</html>

