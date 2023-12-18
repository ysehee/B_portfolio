<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<html>
<head>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<title>동행글 본문</title>
	<link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/1.index.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">
	<style>
		.accompany_info{
			display: flex;
			justify-content: space-between;
			font-size: 13px;
		}
		.accompany_form{
			display: flex;
			flex-direction: column;
			gap: 15px;
		}
		#accompanyContent{
			height: 400px;
			border-radius: 15px;
			font-size: 20px;
		}
		#accompanyCommentContent{
			width: 60%;
			height: 30px;
		}
		.accompanyCommentContent {
			width: 40%;
		}
		#btnModiEnter,
		.btn_editDoneCmt{
			visibility: hidden;
		}
		.showCmtRep > p{
			margin: 0;
		}
		.heartBtn{
			width: 43px;
			height: 43px;
			overflow: hidden;
			cursor: pointer;
			border-radius: 50%;
		}
		.heartBtn > img{
			width: 100%;
			height: 100%;
			box-sizing: border-box;
			scale: 1.2;
		}
		.thumImg{
			width: 100%;
			height: 45vh;
		}
		/*새로 추가된 부분*/
		.showCmt{
			width: 100%;
		}
		#writeCmt_form{
			width: 100%;
		}
		#pickBtn{
			width: 100%;
			height: 60px;
			font-size: 20px;
		}
		#accompanyTitle{
			height: 50px;
			font-size: 24px;
			font-weight: 800;
		}
		.btnDiv > button {
			height: 100%;
		}
		.btn {
			/*margin-left: 30px;*/
			width: 80px;
			border: none;
			background-color: #87C4FF;
			border-radius: 12%;
			color: #fff;
			box-shadow: rgba(25, 25, 25, 0.2) 0px 2px 10px;
		}
		#writeCmt_form >input,
		#writeCmt_form > button,
		#btn_write{
			height: 40px;
			box-sizing: border-box;
		}
		.border_r {
			border-radius: 10px;
		}
		#writeCmt_form{
			display: flex;
			gap: 10px;
		}
		.red_spot:before {
			transform: translateX(-3px);
			content: '';
			display: inline-block;
			width: 6px;
			height: 6px;
			margin-left: 13px;
			border-radius: 50%;
			background: #ee1c25;
			vertical-align: middle;
		}
	</style>
</head>
<body>
<%-- 로그인 유저 정보 --%>
<input type="hidden" id="loginUserId" value="${loginUserId}">
<%-- 로그인한 회원이 좋아요한 게시글 리스트--%>
<input type="hidden" id="likeList" value="${likeList}">

<header class="header">
	<div class="contents">
		<div class="logo">
			<a href="<c:url value='/' />"><img src="<c:url value='/img/logo.png' />" alt="logo"></a>
		</div>
		<ul class="nav_ul">
			<li><a href="<c:url value='/viewPackage'/>">검색</a></li>
			<li><a href="<c:url value='/accompany/board'/>">동행 +</a></li>
			<li><a href="<c:url value='/board/paging'/>">후기 +</a></li>
			<li style="color: #39A7FF;"><a href="<c:url value='/mypage'/>">Mypage</a></li>
		</ul>
		<ul class="login_box">
			<li class="join" style="font-weight: 500;">
				<c:if test="${empty userId }">
					<a href="<c:url value='/join/add'/>">회원가입</a>
				</c:if>
				<c:if test="${not empty userId }">
					<a href="<c:url value=''/>"><b style="font-weight: 500; ">${userId}</b><span style="font-size: 14px; font-weight: 300; "> 님 환영합니다!</span></a>
				</c:if>
			</li>
			<li class="v_line"></li>
			<li class="login" >
				<a href="<c:url value='${ logInOutLink }' />" style="font-weight: 500;">${ logInOutTxt }</a>
			</li>

			<li class="mode"><a href="<c:url value='/board/save'/>">글쓰기</a></li>
		</ul>
	</div>
</header>

<div id="wrap" style="width: 1300px; margin: 0 auto;">
	<c:if test="${mode !='new' }">
		<img class="thumImg" style="border-radius: 15px" src="<c:url value="/img/accompany_img/${accompanyDto.accompanyImg}"></c:url>">
	</c:if>
	<c:if test="${mode =='new' }">
		<img class="thumImg" style="border-radius: 15px" src="<c:url value="/img/accompany_img/free.png"></c:url>">
	</c:if>
	<div style="display: flex; margin-top: 40px">
		<div class="w_900"  style="width: 80%; padding-right: 20px; border-radius: 10px">
			<form action=${mode=='new'?"writeBoard":"deleteBoard"}  method="post" id="frm" class="accompany_form">

				<input type="text" name="accompanyTitle" id="accompanyTitle"  style="width: 100%; outline: none; padding-right: 20px;border: 1px solid rgb(219, 219, 219); padding-left: 30px" placeholder="글 제목을 입력하세요"  value="${accompanyDto.accompanyTitle}" ${mode=="new"?"":"readonly"} >
				<div class="accompany_info"  style="width: 100%; box-sizing: border-box">
					<%--		<input name="accompanyNo" class="accompanyNo" value="${accompanyDto.accompanyNo}">--%>
					<%--		<input name="accompanyRecruit" value="${accompanyDto.accompanyRecruit}">--%>
					<%--		<input name="accompanyTripStartDate" value="${accompanyDto.accompanyTripStartDate}">--%>
					<div style=" display: flex; gap:20px;  border: 1px solid rgb(219, 219, 219); border-radius: 10px; padding: 10px;">
						<select id="accompanyArea" name="accompanyArea" class="accompanyArea "  ${mode=="new"?"":"disabled"}>

						<c:if test="${ mode!='new'}">
							<option value="${accompanyDto.accompanyArea}">
								<c:choose>
									<c:when test="${accompanyDto.accompanyArea eq 'korea'}">
										국내
									</c:when>
									<c:when test="${accompanyDto.accompanyArea eq 'europe'}">
										유럽
									</c:when>
									<c:when test="${accompanyDto.accompanyArea eq 'asia'}">
										아시아
									</c:when>
									<c:when test="${accompanyDto.accompanyArea eq 'america'}">
										아메리카
									</c:when>
									<c:otherwise>
										Unknown
									</c:otherwise>
								</c:choose>
							</option>
						</c:if>
						<c:if test="${ mode=='new'}">
							<option value="korea">국내</option>
							<option value="asia">아시아</option>
							<option value="america">아메리카</option>
							<option value="europe">유럽</option>
						</c:if>
						</select>
						<input id="accompanyRecruitInput" type="hidden" value="${accompanyDto.accompanyRecruit}" style="margin-right: 20px">
						<select id="accompanyRecruit" name="accompanyRecruit" class="accompanyRecruit " ${mode=="new"?"":"disabled"} >

							<c:if test="${ mode!='new'}">
								<option value="${accompanyDto.accompanyRecruit}">${accompanyDto.accompanyRecruit}명</option>
							</c:if>

							<c:if test="${ mode=='new'}">
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
							</c:if>
						</select>
						<div class="accom_date" style="margin-top: 5px;">
							<%-- 날짜 계산하는 part입니다. --%>
							<input type="date" style="border: 1px solid rgb(219, 219, 219);" name="accompanyTripStartDate" id="startDate" placeholder="여행 시작일" onchange="calculateDateDifference()" value="${formatSdt}" ${mode=="new"?"":"readonly"} required>
							<span>~</span>
							<input type="date" style="border: 1px solid rgb(219, 219, 219);" name="accompanyTripEndDate" id="endDate" placeholder="여행 종료일" onchange="calculateDateDifference()" value="${formatEdt}" ${mode=="new"?"":"readonly"}required>
							<span id="days" style="width: 100px;"></span> <%-- 여행일수 출력. --%>
						</div>
					</div>
					<%--	<input name="accompanyArea" value="${accompanyDto.accompanyArea}">--%>
					<c:if test="${ mode!='new'}">
						<div onclick="heartClick(this)" class="heart_empty heartBtn">
							<input type="hidden" class="accompanyNo" name="accompanyNo" value="${accompanyDto.accompanyNo}">
							<c:if test="${fn:contains(likeList, accompanyDto.accompanyNo)}">
								<img class="heart_empty" src="<c:url value="/img/like/heart_fill.png"></c:url>">
							</c:if>
							<c:if test="${! fn:contains(likeList, accompanyDto.accompanyNo)}">
								<img class="heart_empty" src="<c:url value="/img/like/heart_empty.png"></c:url>">
							</c:if>
						</div>
					</c:if>
				</div>


				<textarea name="accompanyContent" id="accompanyContent" style="width: 100%; padding: 20px; outline: none; border: 1px solid rgb(219, 219, 219);" ${mode=="new"?"":"readonly"} >${accompanyDto.accompanyContent}</textarea>
				<div class="btn_box" style=" display: flex; flex-direction: row-reverse">
					<c:if test="${ mode!='new'}">
						<div class="btnDiv" id="btnDiv" style="height: 45px;">
							<button type="button" class="btn" id="btnModiEnter" disabled>등록하기</button>
							<input type="hidden" name="accompanyNo" id="accompanyNo" value="${accompanyDto.accompanyNo}" readonly >
							<c:if test="${accompanyDto.accompanyWriter eq loginUserId}">
								<button type="button"  class="btn" id="btn_modify">수정</button>
								<button type="button" class="btn" id="btn_del">삭제</button>
							</c:if>
							<button type="button" class="btn" id="btn_list">글 목록</button>
						</div>
					</c:if>
					<c:if test="${ mode=='new'}">
						<button type="submit" class="btn" id="btn_write">등록</button>
					</c:if>
				</div>
			</form>

			<%--			<form action="#" method="get" id="pickForm">--%>
			<%--				<input type="hidden" name="accompanyNo" id="parentAccompanyNo" value="${accompanyDto.accompanyNo}">--%>
			<%--				<input type="hidden" name="accompanyWriter" id="parentAccompanyWriter" value="${accompanyDto.accompanyWriter}">--%>
			<%--				<input type="hidden" name="accompanyPickApyUser" id="parentaccompanyPickApyUser" value="${loginUserId}">--%>
			<%--				<button type="submit" id="pickBtn" onclick="openChildPopup()">동행하기</button>--%>
			<%--			</form>--%>

			<c:if test="${ mode!='new'}">
				<h3 style="margin-bottom: 20px" class="red_spot">댓글</h3>
				<div class="accompany_comment" style="width: 1020px">
					<c:forEach var="item" items="${accompanyCommentList}">
						<form action="deleteCmt" method="post" class="showCmt">
							<div class="showCmtRep">
								<input type="hidden" name="accompanyNo" class="accompanyNo"  value="${accompanyDto.accompanyNo}" readonly >
								<input type="hidden" name="accompanyCommentNo" class="accompanyCommentNo" value="${item.accompanyCommentNo}">
								<input type="text"  style="text-align: center; border: none; outline: none; font-family: Noto Sans KR,sans-serif;
    font-weight: 800;" value="${item.accompanyCommentWriter}" value="${item.accompanyCommentWriter}" readonly>
								<input type="text" style="border: none; border-bottom: 1px solid; outline: none; " class="accompanyCommentContent" value="${item.accompanyCommentContent}" readonly>
								<c:if test="${accompanyDto.accompanyWriter eq loginUserId}">
									<button type="button" style="height: 32px" class="btn btn_editCmt" onclick="goModifyCmtBtn(this)" >댓글 수정</button>
									<button type="submit" style="height: 32px" class="btn btn_deleteCmt">댓글 삭제</button>
								</c:if>
								<button type="button" style="height: 32px" class="btn btn_editDoneCmt" onclick="modifyCmtBtn(this)" disabled>수정 완료</button>
							</div>
							<hr>
						</form>
					</c:forEach>
					<form action="writeCmt" method="post" id="writeCmt_form">
						<input type="hidden" name="accompanyNo"  value="${accompanyDto.accompanyNo}" readonly >
						<input type="text"  style="text-align: center; border: none; outline: none; font-family: Noto Sans KR,sans-serif;
    font-weight: 800;" name="accompanyCommentWriter" id="accompanyCommentWriter" value="${loginUserId}" >
						<c:if test="${not empty loginUserId }">
							<input type="text" name="accompanyCommentContent" id="accompanyCommentContent" placeholder="댓글을 입력하세요">
							<button type="button" id="btn_save" class="btn" onclick="loginFlagBtn()">댓글 등록</button>
						</c:if>
					</form>
				</div>
			</c:if>

			<%----%>
		</div>

		<div class="w_400" style="width: 20%; " >
			<div class="w_360" style="width: 100%; border: 1px solid green; float:right; border:none">
				<form action="#" method="get" id="pickForm">
					<input type="hidden" name="accompanyNo" id="parentAccompanyNo" value="${accompanyDto.accompanyNo}">
					<input type="hidden" name="accompanyTitle" id="parentAccompanyTitle" value="${accompanyDto.accompanyTitle}">
					<input type="hidden" name="accompanyWriter" id="parentAccompanyWriter" value="${accompanyDto.accompanyWriter}">
					<input type="hidden" name="accompanyPickApyUser" id="parentaccompanyPickApyUser" value="${loginUserId}">
<%--					<input type="hidden" name="accompanyApyDate" id="parentaccompanyApyDate" value="${accompanyDto.accompanyApyDate}">--%>
					<c:if test="${ mode!='new'}">
						<button type="submit" id="pickBtn" style=" margin-left: 30px; width: 230px; border: none; background-color: #87C4FF; border-radius: 15px; color: #fff; box-shadow: rgba(25, 25, 25, 0.2) 0px 2px 10px;" onclick="openChildPopup()">동행 신청하기</button>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</div>
<footer class="footer"></footer>


<script>

	<%--하트 아이콘 클릭--%>
	let heartClick = function(e){
		if($('#loginUserId').val() != null && $('#loginUserId').val() != ''){
			Rdata = { // 보내줄 값
				accompanyNo : $(e).children('.accompanyNo').val(),
				accompanyLikeUser : $('#loginUserId').val(),
			}

			console.log("Rdata: "+Rdata)

			$.ajax({
				url: "like",
				type: 'GET',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				// dataType : 'int',
				data: Rdata,
				success: function onData (data) {
					console.log(data);

					if(data == 0){
						alert("해당 동행글에 '찜' 하였습니다")
					}
					else if(data == 1){
						alert("해당 동행글에 대한 '찜' 을 취소했습니다")
					}
					else{
						alert("에러 발생!")
					}
				},
				error: function onError (error) {
					console.error("알 수 없는 에러 발생! / 에러내용: " +error);
				}
			});

		}
	}

	$('.heartBtn').click(function (){
		if($('#loginUserId').val() != null && $('#loginUserId').val() != ''){

			var heartIcon = $(this).children("img");
			heartIcon.attr("src", function (index, attr){
				if(attr.match('empty')){
					return attr.replace("empty", "fill");
				}
				else {
					return attr.replace("fill", "empty")
				}
			})
		}
		else{
			alert('로그인 후 다시 시도해주세요');
		}
	});

	// [글 목록] 버튼 눌렀을 때 '뒤로가기' 기능 (나중에 글 목록으로 가는 코드로 변경하기)
	$('#btn_list').click(function () {
		history.back();
	});

	// 동행글 삭제
	$('#btn_del').click(function () {
		let res = confirm("정말 삭제하시겠습니까?");

		if (res) {
			$('#frm').submit();
		}
	})

	// 동행글 [수정] 버튼 누르면 readonly 풀리고 [수정], 버튼 숨기[등록] 버튼 보이기

	$('#btn_modify').click(function (){
		$('#accompanyTitle').attr('readonly',false);
		$('#accompanyContent').attr('readonly',false);
		$('#btnModiEnter').attr('disabled',false);
		$('#btnModiEnter').css('visibility','visible');
		$('#btn_modify').hide();
		$('#btn_del').show();
	});

	// 동행글 [수정완료] 누르면 값 DB 에 저장하고 [수정완료] 버튼 숨기고 [수정] 버튼 보이기
	$('#btnModiEnter').click(function (){

		Rdata = { // 보내줄 값
			accompanyNo : $('#accompanyNo').val(),
			title : $('#accompanyTitle').val(),
			content : $('#accompanyContent').html()
		}

		$.ajax({
			url: "modify",  //action
			type: 'POST', // method
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data: Rdata ,
			success: function onData (data) {
				console.log(data);
				console.log("글 수정")

				if(data == 1){
					$('#accompanyTitle').attr('readonly',true);
					$('#accompanyContent').attr('readonly',true);
					$('#btnModiEnter').attr('disabled',true);
					$('#btnModiEnter').css('visibility','hidden');
					$('#btn_modify').show();
					$('#btn_del').show();
				}else{
					alert('알 수 없는 오류 발생!');
				}
				alert('동행글 수정이 완료되었습니다!');
			},
			error: function onError (error) {
				console.error(error);
			}
		});
	})


	/*//////////////////////////////////////////////////////////////////////*/

	/* 댓글 등록하기 로그인 검증*/
	let loginFlagBtn = function(){

		if($('#loginUserId').val() != null && $('#loginUserId').val() != ''){
			$('#writeCmt_form').submit();
		}
		else{
			alert('로그인 후 다시 시도해 주세요')
			location.href = '/app/login/login';
		}

	}

	// 댓글 수정
	let modifyCmtBtn = function(e){

		Rdata = { // 보내줄 값
			accompanyNo : $(e).parent().children('.accompanyNo').val(),
			accompanyCommentNo : $(e).parent().children('.accompanyCommentNo').val(),
			CommentContent : $(e).parent().children('.accompanyCommentContent').val()
		}

		$.ajax({
			url: "modifyCmt",  //action
			type: 'POST', // method
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'json',
			data: Rdata ,
			success: function onData (data) {
				console.log(data);

				if(data == 1){
					$(e).parent().children('.accompanyCommentContent').attr('readonly',true);
					$(e).parent().children('.btn_editDoneCmt').attr('disabled',true);
					$(e).parent().children('.btn_editDoneCmt').css('visibility','hidden');
					$(e).parent().children('.btn_editCmt').show();
					$(e).parent().children('.btn_deleteCmt').show();
				}else{
					alert('알 수 없는 오류 발생!');
				}
				alert('댓글 수정이 완료되었습니다!');
			},
			error: function onError (error) {
				console.error(error);
			}
		});
	}

	let goModifyCmtBtn = function (e){

		$(e).parent().children('.accompanyCommentContent').attr('readonly', false);
		$(e).parent().children('.btn_editDoneCmt').attr('disabled', false);
		$(e).parent().children('.btn_editDoneCmt').css('visibility', 'visible');
		$(e).parent().children('.btn_editCmt').hide();
		$(e).parent().children('.btn_deleteCmt').hide();
	};



	// [동행하기] 버튼 클릭 이벤트
	let openChildPopup = function (e){
		console.log("동행하기 버튼 클릭")

		if($('#loginUserId').val() != null && $('#loginUserId').val() != '') {

			var popupSrc = 'openPickPopup';
			var popupURL = 'width=500px,height=300px,scrollbars=yes';
			var popupName = '동행하기팝업';

			var popup = window.open(popupSrc, popupName, popupURL);
		}
		else{
			alert('로그인 후 다시 시도해 주세요')
		}

	}

	// 여기서 부터는 여행 일 수 나타내는 스크립트 입니다.
	function calculateDateDifference() {
		// 시작일과 종료일 input 요소에서 날짜 값을 가져옴
		var startDateInput = document.getElementById("startDate");
		var endDateInput = document.getElementById("endDate");

		// 값이 비어있으면 계산하지 않음
		if (!startDateInput.value || !endDateInput.value) {
			return;
		}

		// 날짜 객체로 변환
		var startDate = new Date(startDateInput.value);
		var endDate = new Date(endDateInput.value);

		// 두 날짜 간의 차이를 계산 (밀리초 단위)
		var timeDifference = endDate - startDate;

		// 밀리초를 일로 변환
		var daysDifference = timeDifference / (1000 * 60 * 60 * 24);

		// 결과를 화면에 표시
		var resultElement = document.getElementById("days");
		resultElement.textContent = "여행 기간: " + daysDifference + "일";
	}

</script>

</body>
</html>


