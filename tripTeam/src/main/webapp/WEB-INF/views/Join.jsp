<%--
  Created by IntelliJ IDEA.
  User: user8241
  Date: 2023-11-15
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blue Horizon 블루호라이즌  :: 회원가입</title>
    <link rel="icon" href="<c:url value='${contextPath}/img/favicon.png' />" type="image/x-icon" alt="언덕 아이콘  제작자: Saepul Nahwan - Flaticon">
    <link rel="stylesheet" href="<c:url value='/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">
    <link rel="stylesheet" href="<c:url value='/css/swiper_bundle.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_mountain_swiper.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_total_info_swiper.css' />">
    <!-- Link Swiper's CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" /> -->
    <link rel="stylesheet" href="<c:url value='/css/font.css' />">
    <link rel="stylesheet" href="<c:url value='/css/common.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_media.css' />"><!-- 반응형 -->
    <link rel="stylesheet" href="<c:url value='/css/join.css' />">

    <!-- 동적인 URL로 jQuery 및 Swiper JS 로드 -->
    <script src="<c:url value='https://code.jquery.com/jquery-1.12.4.js' />"></script>
    <script src="<c:url value='https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js' />"></script>

<%--    <link rel="stylesheet" href="./css/1.index_media.css"> --%>
<%--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>

    <!-- 글씨폰트 NOTO SANS KR  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">


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
                <li class="join" style="font-weight: 500">
                    <c:if test="${empty userId }">
                        <a href="<c:url value='/join/add'/>">회원가입</a>
                    </c:if>
                    <c:if test="${not empty userId }">
                        <a href="<c:url value=''/>"><b style="font-weight: 500; ">${userId}</b><span style="font-size: 14px; font-weight: 300; "> 님 환영합니다!</span></a>
                    </c:if>
                </li>
                <li class="v_line"></li>
                <li class="login">
                    <a href="<c:url value='${ logInOutLink }' />">${ logInOutTxt }</a>
                </li>

                <li class="mode"><a href="<c:url value='/board/save' />">글쓰기</a></li>
            </ul>
        </div>
        <div class="pan">
            <div class="contents">
                <div class="pan_wrap">
                    <div class="pan_item" id="pan1">
                        <p>등산여행</p>
                        <p>테마산행</p>
                        <p>캠핑</p>
                        <p>백패킹</p>
                        <p>아카데미</p>
                    </div>
                    <div class="pan_item" id="pan2">
                        <p>경기・수도권</p>
                        <p>강원</p>
                        <p>충청・전라</p>
                        <p>경상・울릉</p>
                        <p>제주</p>
                    </div>
                    <div class="pan_item" id="pan3">
                        <p>한국의 산</p>
                        <p>해외의 산</p>
                        <p>클라이밍</p>
                        <p>둘레길</p>
                    </div>
                    <div class="pan_item" id="pan4">
                        <p>산악회</p>
                        <p>등산동행</p>
                        <p>자유게시판</p>
                        <p>맛집추천</p>
                    </div>
                </div>
            </div>

        </div>
    </header>

    <!-- 반응형 헤더 -->
    <header class="header1">
        <div class="ham_btn">
            <div class="h_line"></div>
            <div class="h_line"></div>
            <div class="h_line"></div>
        </div>
        <div class="small_logo">
            <a href="1.index.html"><img src="./img/logo.png" alt="small_logo"></a>
        </div>

        <div class="alert">
            <a href="#"><img src="./img/notification.png" alt=""></a>
        </div>
    </header>

    <div class="ham_menu">
        <ul class="ham_ul">
            <li>
                <p class="ham_item_name">등산상점</p>

                <div class="ham_items">
                    <a href="#"><p>등산여행</p></a>
                    <a href="#"><p>테마산행</p></a>
                    <a href="#"><p>캠핑</p></a>
                    <a href="#"><p>백패킹</p></a>
                    <a href="#"><p>아카데미</p></a>
                </div>
            </li>
            <li>
                <p class="ham_item_name">등산버스</p>

                <div class="ham_items">
                    <a href="<c:url value='#' />"><p>경기・수도권</p></a>
                    <a href="<c:url value='#' />"><p>강원</p></a>
                    <a href="<c:url value='#' />"><p>충청・전라</p></a>
                    <a href="<c:url value='#' />"><p>경상・울릉</p></a>
                    <a href="<c:url value='#' />"><p>제주</p></a>
                </div>
            </li>
            <li>
                <p class="ham_item_name">추천명산</p>

                <div class="ham_items">
                    <a href="<c:url value='#' />"><p>한국의 산</p></a>
                    <a href="<c:url value='#' />"><p>해외의 산</p></a>
                    <a href="<c:url value='#' />"><p>클라이밍</p></a>
                    <a href="<c:url value='#' />"><p>둘레길</p></a>
                </div>
            </li>
            <li>
                <p class="ham_item_name">커뮤니티</p>

                <div class="ham_items">
                    <a href="<c:url value='#' />"><p>산악회</p></a>
                    <a href="<c:url value='#' />"><p>등산동행</p></a>
                    <a href="<c:url value='#' />"><p>자유게시판</p></a>
                    <a href="<c:url value='#' />"><p>맛집추천</p></a>
                </div>
            </li>
        </ul>
    </div>

    <div class="w_800">
        <div class="join_wrap">

            <div class="join_title_box">
                <div class="join_title_txt">
                    <p>BlueHorizon 과 함께 해요!</p>
                    <img src="<c:url value='/img/login_join/megaphone.png' />" alt="">
                </div>

                <div class="join_img">
                    <img src="<c:url value='/img/login_join/squirrel.png' />" alt="">
                </div>

                <div class="join_desc">
                    <p>함께 동행하는 즐거움, BlueHorizon</p>
                </div>
            </div>

            <div class="social_join">
                <div class="social_join_title">
                    <p>소셜 계정으로 간편 가입</p>
                </div>

                <ul>
                    <li class="naver">
                        <a href="#"><img src="<c:url value='/img/login_join/naver.png' />" alt=""></a>
                    </li>
                    <li class="kakao">
                        <a href="#"><img src="<c:url value='/img/login_join/kakao.png' />" alt=""></a>
                    </li>
                    <li class="google">
                        <a href="#"><img src="<c:url value='/img/login_join/google.png' />" alt=""></a>
                    </li>
                    <li class="apple">
                        <a href="#"><img src="<c:url value='/img/login_join/apple.png' />" alt=""></a>
                    </li>
                </ul>
            </div>

            <a href="#">
                <div class="making_id">
                    <a href="<c:url value='/joinCreatedId/add' />"><p>BlueHorizon 아이디 만들기</p></a>
                </div>
            </a>

            <div class="have_id">
                <p>이미 계정이 있나요?</p>
                <a href="<c:url value='/login/login' />"><p>로그인</p></a>
            </div>
        </div>
    </div>
</div>
<footer class="footer"></footer>
<script src="<c:url value='/js/alert.js' />"></script>
</body>
</html>
