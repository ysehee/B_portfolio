<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page session="false" %>--%>
<html>
<%--<head>--%>
<title>Blue Horizon</title>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />

<!-- 글씨폰트 NOTO SANS KR  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<style>
	.swiper {
		width: 100%;
		height: 100%;
	}

	.swiper-slide {
		text-align: center;
		font-size: 18px;
		background: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;
	}

	.swiper-slide img {
		display: block;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	.package_tour_review_ul_index{
		/*width: 200%;*/
		display: flex;
		justify-content: space-between;
	}
	.package_tour_review_li_index{
		width: 800px;
		/*box-shadow: rgba(25, 25, 25, 0.5) 6px 6px 10px;*/
	}
</style>

<style>
	#new_arr {
		height: 50vw;
		max-height: 800px;
		min-height: 400px;
	}
</style>
</style>
<head>
	<title>save</title>
	<link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/selectPackagePage.css' /> ">
	<link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
	<link rel="stylesheet" href="<c:url value='/css/1.index.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/accom_home.css'/>">


	<script
			src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

</head>
<body>
<div id="wrap">
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
	<div style="width: 100%">
		<div class="banner_box">
			<div class="search_box" style="z-index: 9999">
				<div class="s_box">
					<p class="search_title">여행 패키지 검색</p>
					<span class="search_sub_title">블루호라이즌에서 아름다운 추억을 예약하세요.</span>
					<!-- <form action="./resultPackage.html" name="resultPackage" method="get"> -->
					<form action="<c:url value='/viewPackage'/> " name="resultPackage" method="GET" id="packSearchBox2" >
						<!-- 위치 선택 -->
						<div class="box-body">

							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-building"></i></span>
								<select type="text" id="packCategory" class="optionSize" placeholder="국내여행 or 해외여행">
									<option value="">지역 선택 </option>
								</select>
							</div>
							<%--						<div class="packSearchBox_con1">--%>
							<%--							&lt;%&ndash;<label for="packCategory">Category</label>&ndash;%&gt;--%>
							<%--							<select type="text" id="packCategory" class="optionSize" placeholder="국내여행 or 해외여행">--%>
							<%--								<option value="">지역 선택 </option>--%>
							<%--							</select>--%>

							<%--							&lt;%&ndash;<label for="packLocation">Location</label>&ndash;%&gt;--%>
							<%--&lt;%&ndash;							<select id="packLocation">&ndash;%&gt;--%>
							<%--&lt;%&ndash;								<option value="">세부 지역 선택</option>&ndash;%&gt;--%>
							<%--&lt;%&ndash;							</select>&ndash;%&gt;--%>
							<%--						</div>--%>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-building"></i></span>
								<select id="packLocation">
									<option value="">세부 지역 선택</option>
								</select>
							</div>

						</div>
						<!-- 연,월 선택 -->
						<span class="search_sub_title">여행기간 검색 설정</span><br>
						<input type="month" name="start_month" id="m1" name="start_month" month-placeholder="출발하시려는 월을 선택해 주세요." required>

						<input type="submit" id="btn" value="검색">
					</form>
				</div>
			</div>

			<section id="new_arr" style=" width: 800px;height: 500px; float:right; border-radius: 15px; overflow: hidden">
				<div class="box"></div>

				<!-- Swiper -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="<c:url value='/img/main_swiper/new_img7.jpg'/>">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/img/main_swiper/new_img8.jpeg'/>">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/img/main_swiper/new_img4.png'/>">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/img/main_swiper/new_img5.png'/>">
						</div>
						<div class="swiper-slide">
							<img src="<c:url value='/img/main_swiper/new_img6.png'/>">
						</div>
					</div>
					<div class="swiper-pagination"></div>

					<!-- If we need navigation buttons -->
					<%--				<div class="swiper-button-prev"></div>--%>
					<%--				<div class="swiper-button-next"></div>--%>
				</div>
			</section>
		</div>
	</div>

	<div class="section">
		<div class="contents">
			<div class="total_info">
				<div class="info_left">
					<a href="<c:url value='/viewPackage'/>">
						<div class="market">
							<img src="<c:url value='/img/main_swiper/main_pack.jpeg'/>">
						</div>
						<p>패키지 상품</p>
					</a>
				</div>

				<div class="info_mid">
					<a href="<c:url value='/accompany/board'/>">
						<div class="together">
							<img src="<c:url value='/img/main_swiper/main_accom.jpg'/>">
						</div>
						<p id="info_mid_p1">동행 찾기</p>
					</a>

					<a href="<c:url value='/board/paging'/>" >
						<div class="bus">
							<img src="<c:url value='/img/main_swiper/main_review.jpeg'/>">
						</div>
						<p id="info_mid_p2">동행 후기</p>
					</a>
				</div>

				<div class="info_right mr_0">
					<div class="right_box">
						<div class="mypage_left">
							<img src="<c:url value='/img/main_swiper/new_logo.png'/>">
							<a href="<c:url value='/mypage'/>">
								<div class="white_box">
									<p>MY PAGE</p>
								</div>
							</a>
						</div>
						<div class="mypage_right mr_0">
							<a href="#"><p id="p1">동행 글 작성하기</p></a>
							<a href="#"><p id="p2">후기 글 작성하기</p></a>
						</div>
					</div>
					<div class="friends">
						<%--						<div class="friends_title">--%>
						<%--							<img src="<c:url value='/img/main_swiper/new_logo.png'/>" style="scale:2">--%>
						<%--							<p>Blue Horizon과 함께하는 사람들</p>--%>
						<%--						</div>--%>

						<div class="swiper myFriendsSwiper friends_slide">
							<%--							<div class="swiper-wrapper swiper_wrapper_friends">--%>
							<%--								모든 유저들 나올거임!--%>
							<%--							</div>--%>
							<img src="<c:url value='/img/new_banner.jpg'/>" style="width: 100%; height: 100%">
						</div>

					</div>
				</div>
			</div>
			<%--후기게시판--%>
			<div class="review_con">
				<div class="review_con_title">
					<h1>최신 후기</h1>
					<p style="font-size: 16px"><a href="<c:url value='/board/paging'/>">더보기 +</a></p>
				</div>
				<ul class="package_tour_review_ul" id="package_tour_review_ul">
					<c:forEach items="${boardlist}" var="board">
						<li class="package_tour_review_li">
							<a href="/app/board?id=${board.id}&page=${paging.page}">
								<div class="user_info">
									<div class="user_info_name"><p>${board.boardWriter}님</p></div>
									<div class="user_info_start_travel"><!-- 여행 출발한 월 -->
										<span> 제목 : ${board.boardTitle}</span>
									</div>
								</div>
								<div class="accompany_review_img">
									<img src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명" />
								</div>
								<div class="user_info_travelinfo">
									<div class="user_info_travelinfo_content">
											${board.boardContents}
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<%--패키지게시판--%>
			<div class="package_con">
				<div class="review_con_title">
					<h1>패키지 +</h1>
					<a href="<c:url value='/viewPackage'/>">더보기 +</a>
				</div>
				<div id="packBigBox">
					<c:forEach var="item" items="${packageForHome}">
						<div class="packBox" id="${item.packageId}">
							<div class="packImg">
								<img src="<c:url value='/img/packageImg/' />${item.packageImg}.jpg"  alt="여행지사진">
							</div>
							<div class="packInfo">
								<div class="packLocation">
									<span>${item.packageType}</span>
									<span> + </span>
									<span>${item.packageLocation}</span>
								</div>
								<div class="packTitle">
									<p>${item.packageTitle}</p>
								</div>
								<div class="packPrice">
									<p>${item.packagePrice}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<%--동행--%>
			<div class="accompany_con">
				<div class="review_con_title">
					<h1>동행 +</h1>
					<a href="<c:url value='/accompany/board'/>">더보기 +</a>
				</div>
				<div class="accompanyItem_div" style=" width: 1300px; margin: 0 auto;" >
					<ul style="display: flex; justify-content: space-between; flex-direction: row; flex-wrap: wrap;">
						<c:forEach var="accompanyDto" items="${accompanyDtoList}">
							<li class="accompanyItem" style="border: 1px solid #a9a9a9; border-radius: 16px; width: calc((100%  - (20px * 3))/ 4); margin-bottom: 20px; box-shadow: 0 6px 20px rgba(0,0,0,0.2); position: relative">
								<a href="<c:url value="/accompany/read?accompanyNo=${accompanyDto.accompanyNo}"/>">

										<%--		<div class="accompanyNo">동행글 번호: ${accompanyDto.accompanyNo}</div>--%>
									<div style="padding-left: 15px">
										<input class="accompanyNo" value="${accompanyDto.accompanyNo}" style="display: none; padding-left: 15px; ">No : ${accompanyDto.accompanyNo}
									</div>

									<div class="accompanyItem_div_top" style=" display: flex; justify-content: space-between; margin-top: 5px">
										<div style="padding-left: 15px">모집인원:  ${accompanyDto.accompanyRecruit}</div>
										<div style="padding-right: 15px">여행지역: ${accompanyDto.accompanyArea}</div>
									</div>
									<div class="accompanyItem_div_img" style="position: relative">
										<img src="<c:url value="/img/accompany_img/${accompanyDto.accompanyImg}"></c:url>" style="width: 100%; height: 200px">
										<input type="hidden" class="accompanyNo" value="${accompanyDto.accompanyNo}">
										<div class="accompanyItem_div_viewCount" style="position: absolute; bottom: 0; right: 15px; padding: 3px; background: rgba(255,255,255,0.65); border-radius: 10px 10px 0px 0px; display: flex; justify-content: space-between"; >
											<div>조회수: ${accompanyDto.accompanyViewCnt}</div>
											<div>찜 수: ${accompanyDto.accompanyLikeCnt}</div>
										</div>
									</div>
									<div class="accompanyItem_div_content_title" style="font-size: 20px; color: dimgray; font-weight: 500;">${accompanyDto.accompanyTitle}</div>
									<div class="accompanyItem_div_content" style="font-size: 16px; color:darkgray">${accompanyDto.accompanyContent}</div>
									<br>
								</a>
								<div onclick="heartClk(this)" class="heart_empty heartBtn" style="position: absolute; top: 50px; right:10px;">
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
			</div>
		</div>
	</div>
	<%-- top버튼용 ㅎ;--%>
	<a href="#" style="display: block; width: 100px; height: 100px; border: 1px solid; line-height: 120px; text-align: center; border-radius: 50%; float: right; position: fixed; bottom: 100px; right: 50px; background-color: #87C4FF;; font-size:50px; color: #fff; z-index: 99999">
		⌃
	</a>
</div>


<footer class="footer"></footer>
<script src="<c:url value='/js/index.js'/>"></script>
<script src="<c:url value='/js/alert.js' />"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
	var swiper = new Swiper(".mySwiper", {
		slidesPerView: 1, // 칸 수
		// spaceBetween: 0,
		// freeMode: true,
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		// Navigation arrows
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		autoplay: {
			delay: 3000, // 몇초마다 슬라이드 이동할지
		},
		speed: 1000, // 몇초만에 left 0 으로 도착할지
		loop: true,
		direction: 'horizontal', //horizontal,vertical 배치 방향
		effect: 'fade' // 'slide', 'fade', 'cube', 'coverflow', 'flip' or 'creative'
	});


	$('#new_arr').hover(function(){
		swiper.autoplay.stop();
	}, function(){
		swiper.autoplay.start()
	})


	//
	var swiper1 = new Swiper(".mySwiper1", {
		slidesPerView: 1, // 칸 수
		// spaceBetween: 0,
		// freeMode: true,
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		// Navigation arrows
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		autoplay: {
			delay: 3000, // 몇초마다 슬라이드 이동할지
		},
		speed: 1000, // 몇초만에 left 0 으로 도착할지
		loop: true,
		direction: 'horizontal', //horizontal,vertical 배치 방향
		effect: 'fade' // 'slide', 'fade', 'cube', 'coverflow', 'flip' or 'creative'
	});


	// $('#new_arr').hover(function(){
	// 	swiper.autoplay.stop();
	// }, function(){
	// 	swiper.autoplay.start()
	// })

	//
	function makeCategory(selectId) {
		let packCategory = ['국내', '아시아', '유럽', '아메리카'];
		let categorySelect = document.getElementById(selectId);
		categorySelect.className = 'optionSize';

		for (let i = 0; i < packCategory.length; i++) {
			let option = document.createElement('option');
			option.value = packCategory[i];
			option.textContent = packCategory[i];
			categorySelect.appendChild(option);
		}
	}

	// Location 목록을 채우는 함수
	function makeLocation(selectId) {
		// let packLocation = ['서울', '제주', '동해', '부산', '전주', '대구', '순천'];
		let locationSelect = document.getElementById(selectId);
		locationSelect.className = 'optionSize';

		for (let i = 1; i < packLocation.length; i++) {
			const option = document.createElement('option');
			option.value = packLocation[i];
			option.textContent = packLocation[i];
			locationSelect.appendChild(option);
		}
	}

	makeCategory('packCategory');
	makeLocation('packLocation');

	///////////////////////////////////////
	// 지역 선택하기 기능
	let obj = {
		"국내" : {
			'0' : '서울',
			'1' : '부산',
			'2' : '대구',
			'3' : '동해',
			'4' : '담양',
			'5' : '보성',
			'6' : '제주',
		},
		"아시아" : {
			'0' : '일본',
			'1' : '중국',
			'2' : '몽골',
		},
		"유럽" : {
			'0' : '영국',
		},
		"아메리카" : {
			'0' : '미국',
		},
	}

	document.getElementById('packCategory').addEventListener('change', function () {
		var selectedCategory = this.value;
		var locationSelect = document.getElementById('packLocation');

		// Clear existing options
		locationSelect.innerHTML = '<option value="">지역 선택</option>';

		// Populate location options based on the selected category
		if (selectedCategory === '국내') {
			for (var key in obj[selectedCategory]) {
				var option = document.createElement('option');
				option.value = obj[selectedCategory][key];
				option.textContent = obj[selectedCategory][key];
				locationSelect.appendChild(option);
			}
		} else if (selectedCategory === '아시아') {
			for (var key in obj[selectedCategory]) {
				var option = document.createElement('option');
				option.value = obj[selectedCategory][key];
				option.textContent = obj[selectedCategory][key];
				locationSelect.appendChild(option);
			}
		} else if (selectedCategory === '유럽') {
			for (var key in obj[selectedCategory]) {
				var option = document.createElement('option');
				option.value = obj[selectedCategory][key];
				option.textContent = obj[selectedCategory][key];
				locationSelect.appendChild(option);
			}
		} else if (selectedCategory === '아메리카') {
			for (var key in obj[selectedCategory]) {
				var option = document.createElement('option');
				option.value = obj[selectedCategory][key];
				option.textContent = obj[selectedCategory][key];
				locationSelect.appendChild(option);
			}
		}
	});
</script>
</body>
</html>
