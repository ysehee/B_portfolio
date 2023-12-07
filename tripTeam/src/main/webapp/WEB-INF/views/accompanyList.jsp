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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/1.index.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/common.css'/> ">

	<title>동행글 게시판</title>
	<style>
		.heartBtn{
			width: 27px;
			height: 27px;
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
		input:focus {outline:none;}
		/*a{*/
		/*	width: 100%;*/
		/*	height: 100%;*/
		/*}*/
		.viewWay {
			cursor: pointer;
			transition: background-color 0.3s;


		}

		.selected {
			background-color: #e0e0e0 !important;
		}
		#newPost{
			cursor: pointer;
		}
		.accompanyItem_div_content{
			font-size: 16px;
			color: darkgray;

			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
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
<div class="banner_img">
	<img src="<c:url value='/img/accListBanner.jpg'/>" alt="accListBanner">
</div>
<%----------------------------------------------------------------------------------------------------%>


<div class="accompany_search_box" style="border: none; width: 600px; height: 80px; margin: 0 auto; transform: translateY(-50%); border-radius: 16px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.2);">
	<form action="accSearch" method="get" style="border :none; display: flex; height: 100%;">
		<input type="text" name="accompanySearchText" id="accompanySearchArea" placeholder="검색어를 입력하세요" style="width: calc(100% - 50px); border: none; padding-left: 15px; font-size: 24px">
		<button type="submit" style="border: none; width: 50px; height: 100%; background: #fff">
			<img src="<c:url value='/img/search_icon.png'/>" alt="board_long_banenr">
		</button>
	</form>
</div>
<%--<div class="accMyPageBtn">--%>
<%--	&lt;%&ndash;내가 쓴 동행글 보기&ndash;%&gt;--%>
<%--	<a href="accIWrote">내가 쓴 동행글 보기</a>--%>
<%--	&lt;%&ndash;내가 쓴 동행글 댓글 보기&ndash;%&gt;--%>
<%--	<a href="accCmtIWrote">내가 쓴 동행글 댓글 보기</a>--%>
<%--	&lt;%&ndash;내가 보낸 동행신청 보기&ndash;%&gt;--%>
<%--	<a href="spendAccApy">내가 보낸 동행신청 보기</a>--%>
<%--	&lt;%&ndash;내가 받은 동행신청 보기&ndash;%&gt;--%>
<%--	<a href="receiveAccApy">내가 받은 동행신청 보기</a>--%>
<%--	&lt;%&ndash;동행 확정 내역 보기&ndash;%&gt;--%>
<%--	<a href="accConnectionList">동행 확정 내역 보기</a>--%>
<%--</div>--%>
<%--<form action="accSearch" method="get">--%>
<%--	<input type="text" name="accompanySearchText" id="accompanySearchArea" placeholder="검색어를 입력하세요">--%>
<%--	<button type="submit">검색</button>--%>
<%--</form>--%>
<%--<h1>동행글 게시판 전체목록</h1>--%>
<div class="main_top" style="width: 1300px; margin: 0 auto; display: flex; justify-content: space-between">
	<div class="select_view" style="box-sizing: border-box; " >
		<form action="viewWay" id="viewWay" style="display: flex">
			<%--		<span>정렬방식</span>--%>
			<div id="viewWay1" class="viewWay" style="border: 1px solid darkgrey; box-shadow: 0 6px 20px rgba(0,0,0,0.1); border-radius: 16px; background-color:  ghostwhite; color: slategray; font-weight: 700;">
				<a href="viewWay?sort=recent" class="clickable" id="a1" style="display: block; padding: 1rem;">최신순</a>
			</div>
			<div id="viewWay2" class="viewWay" style="border: 1px solid darkgrey; box-shadow: 0 6px 20px rgba(0,0,0,0.1); margin: 0px 15px;border-radius: 16px; background-color:  ghostwhite; color: slategray; font-weight: 700;">
				<a href="viewWay?sort=like" class="clickable" style="display: block; padding: 1rem;">찜 순</a>
			</div>
			<div id="viewWay3" class="viewWay" style="border: 1px solid darkgrey; box-shadow: 0 6px 20px rgba(0,0,0,0.1); border-radius: 16px; background-color:  ghostwhite; color: slategray; font-weight: 700;">
				<a href="viewWay?sort=topView" class="clickable" style="display: block; padding: 1rem;">조회수 순</a>
			</div>
		</form>
	</div>
	<form action="write" method="get" id="newPostFlagForm">
		<button type="button" id="newPost" onclick="loginFlagBtn()" style="padding: 10px; border-radius: 10px; background: #87C4FF; color: #fff; border: none; height: 100%" >동행글 작성하기</button>
	</form>
</div>

<div class="accompanyItem_div" style=" width: 1300px; margin: 0 auto;" >
	<ul style="display: flex; justify-content: space-between; flex-direction: row; flex-wrap: wrap;">
		<c:forEach var="accompanyDto" items="${accompanyList}">
			<li class="accompanyItem" style="border: 1px solid #a9a9a9; border-radius: 16px; width: calc((100%  - (20px * 3))/ 4); margin-bottom: 20px; box-shadow: 0 6px 20px rgba(0,0,0,0.2); padding-top: 10px; position: relative">
				<a href="<c:url value="/accompany/read?accompanyNo=${accompanyDto.accompanyNo}"/>">

						<%--		<div class="accompanyNo">동행글 번호: ${accompanyDto.accompanyNo}</div>--%>
					<div style="padding-left: 15px; font-size: 12px;">
						<input class="accompanyNo" value="${accompanyDto.accompanyNo}" style="display: none; padding-left: 15px; ">No : ${accompanyDto.accompanyNo}
					</div>

					<div class="accompanyItem_div_top" style=" display: flex; justify-content: space-between; font-size: 14px; margin-top: 5px";>
						<div style="padding-left: 15px">모집인원:  ${accompanyDto.accompanyRecruit}</div>
						<div style="padding-right: 15px">여행지역: ${accompanyDto.accompanyArea}</div>
					</div>
					<div class="accompanyItem_div_img" style="position: relative">
						<img src="<c:url value="/img/accompany_img/${accompanyDto.accompanyImg}"></c:url>" style="width: 100%; height: 200px">
						<input type="hidden" class="accompanyNo" value="${accompanyDto.accompanyNo}">
							<%--						<div onclick="heartClk(this)" class="heart_empty heartBtn" style="position: absolute; top: 10px; right:10px;">--%>
							<%--							<c:if test="${fn:contains(likeList, accompanyDto.accompanyNo)}">--%>
							<%--								<img class="heart_empty" style=" z-index: 1;" src="<c:url value="/img/like/heart_fill.png"></c:url>">--%>
							<%--							</c:if>--%>
							<%--							<c:if test="${! fn:contains(likeList, accompanyDto.accompanyNo)}">--%>
							<%--								<img class="heart_empty" style=" z-index: 1;" src="<c:url value="/img/like/heart_empty.png"></c:url>">--%>
							<%--							</c:if>--%>
							<%--						</div>--%>
						<div class="accompanyItem_div_viewCount" style="position: absolute; bottom: 0; right: 15px; padding: 3px; font-size: 12px; background: rgba(255,255,255,0.65); border-radius: 10px 10px 0px 0px; display: flex; justify-content: space-between"; >
							<div>조회수: ${accompanyDto.accompanyViewCnt}</div>
							<div>찜 수: ${accompanyDto.accompanyLikeCnt}</div>
						</div>
					</div>
					<div class="accompanyItem_div_content_title" style="font-size: 20px; color: dimgray; font-weight: 500;">${accompanyDto.accompanyTitle}</div>
					<div class="accompanyItem_div_content" >${accompanyDto.accompanyContent}</div>
					<br>
				</a>
				<div onclick="heartClk(this)" class="heart_empty heartBtn" style="position: absolute; top: 50px; right:10px; margin-top: 10px;">
					<input type="hidden" class="accompanyNo" name="accompanyNo" value="${accompanyDto.accompanyNo}">
					<c:if test="${fn:contains(likeList, accompanyDto.accompanyNo)}">
						<img class="heart_empty" style=" z-index: 1;" src="<c:url value="/img/like/heart_fill.png"></c:url>">
					</c:if>
					<c:if test="${! fn:contains(likeList, accompanyDto.accompanyNo)}">
						<img class="heart_empty" style=" z-index: 1;" src="<c:url value="/img/like/heart_empty.png"></c:url>">
					</c:if>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
<%--<c:forEach var="accompanyDto" items="${accompanyList}">--%>
<%--	<div class="accompanyItem">--%>
<%--			&lt;%&ndash;		<div class="accompanyNo">동행글 번호: ${accompanyDto.accompanyNo}</div>&ndash;%&gt;--%>
<%--		<input class="accompanyNo" value="${accompanyDto.accompanyNo}">동행글 번호: ${accompanyDto.accompanyNo}--%>
<%--		<div id="heartBtn" onclick="heartClk(this)" class="heart_empty">--%>
<%--			<img class="heart_empty" src="<c:url value="/img/like/heart_empty.png"></c:url>">--%>
<%--		</div>--%>
<%--		<div>조회수: ${accompanyDto.accompanyViewCnt}</div>--%>
<%--		<div>찜 수: ${accompanyDto.accompanyLikeCnt}</div>--%>
<%--		<div><a href="<c:url value="/accompany/read?accompanyNo=${accompanyDto.accompanyNo}"/>">${accompanyDto.accompanyTitle}</a></div>--%>
<%--		<div>동행 게시글: ${accompanyDto.accompanyContent}</div>--%>
<%--		<div>모집인원:  ${accompanyDto.accompanyRecruit}</div>--%>
<%--		<div>여행지역: ${accompanyDto.accompanyArea}</div>--%>
<%--		<br>--%>
<%--	</div>--%>
<%--</c:forEach>--%>
<footer class="footer"></footer>
<script>


	/* 새글 등록하기 로그인 검증*/
	let loginFlagBtn = function(){

		if($('#loginUserId').val() != null && $('#loginUserId').val() != ''){
			$('#newPostFlagForm').submit();
		}
		else{
			location.href = '/app/login/login';
		}

	}

	<%--하트 아이콘 클릭--%>
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
			alert('로그인 후 다시 시도해 주세요');

		}
	});

	let heartClk = function(e){
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

	<%--정렬방식 클릭--%>

	/* 최근 업데이트 순 */

	let recentViewWay = function(e){

		Rdata = { // 보내줄 값
			viewWay : "recent"
		}
		console.log("Rdata: "+Rdata)

		$.ajax({
			url: "viewWay",
			type: 'GET',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data: Rdata,
			success: function onData (data) {
				console.log(data);
			},
			error: function onError (error) {
				console.error("알 수 없는 에러 발생 / 에러내용: " +error);
			}
		});

	}

	/* 찜하기 순 */
	let likeViewWay = function(e){

		Rdata = { // 보내줄 값
			viewWay : "like"
		}
		console.log("Rdata: "+Rdata)

		$.ajax({
			url: "viewWay",
			type: 'GET',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data: Rdata,
			success: function onData (data) {
				console.log(data);
			},
			error: function onError (error) {
				console.error("알 수 없는 에러 발생 / 에러내용: " +error);
			}
		});

	}


	/* 조회수 순 */
	let topViewWay = function(e){

		Rdata = { // 보내줄 값
			viewWay : "topView"
		}
		console.log("Rdata: "+Rdata)

		$.ajax({
			url: "viewWay",
			type: 'GET',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			data: Rdata,
			success: function onData (data) {
				console.log(data);
			},
			error: function onError (error) {
				console.error("알 수 없는 에러 발생 / 에러내용: " +error);
			}
		});

	}







</script>


</body>
</html>

