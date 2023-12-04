<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/successMyReservation.css' />">
    <link rel="stylesheet" href="<c:url value='/css/common.css' />">
    <link rel="stylesheet" href="<c:url value='/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">

</head>
<body>
<div id="wrap">
    <header class="header">
        <div class="contents">
            <div class="logo">
                <a href="<c:url value='/'/>"><img src="<c:url value='/img/logo.png'/>" alt="logo"></a>
            </div>
            <ul class="nav_ul">
                <li><a href="#">검색</a></li>
                <li><a href="./6.accompany_package_travel.html">동행 +</a></li>
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

    <div>
        <div class="chkReservation">
            <div>
                <img src="<c:url value='/img/icon_kitty.png' />" alt="예약완료">
            </div>
            <p>
                예약이 완료되었습니다!
            </p>
        </div>

        <div>
            <div>
                <button id="viewMyBooking">내 예약 내역</button>
                <button id="gotoHome">메인페이지</button>
            </div>
        </div>
    </div>
</div>
<footer class="footer"></footer>
</body>
<script>
    document.getElementById('viewMyBooking').addEventListener('click', function() {
        // '내 예약 내역' 버튼을 눌렀을 때 이동할 페이지 URL
        var bookingUrl = '<c:url value='/mypage2' />';
        window.location.href = bookingUrl;
    });

    document.getElementById('gotoHome').addEventListener('click', function() {
        // '메인페이지' 버튼을 눌렀을 때 이동할 페이지 URL
        var homeUrl = '<c:url value='/' />';
        window.location.href = homeUrl;
    });
</script>
</html>
