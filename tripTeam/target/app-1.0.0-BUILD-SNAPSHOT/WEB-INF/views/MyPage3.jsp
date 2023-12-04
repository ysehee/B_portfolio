<%--
  Created by IntelliJ IDEA.
  User: user8241
  Date: 2023-11-17
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>트렌디한 등산앱, 오르리청산-orri</title>
    <link rel="icon" href="<c:url value='${contextPath}/img/favicon.png' />" alt="언덕 아이콘  제작자: Saepul Nahwan - Flaticon">
    <link rel="stylesheet" href="<c:url value='/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">
    <!-- <link rel="stylesheet" href="./css/swiper_bundle.css"> -->
    <!-- <link rel="stylesheet" href="./css/1.index_mountain_swiper.css"> -->
    <!-- <link rel="stylesheet" href="./css/1.index_total_info_swiper.css"> -->
    <!-- Link Swiper's CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" /> -->
    <link rel="stylesheet" href="<c:url value='/css/font.css' />">
    <link rel="stylesheet" href="<c:url value='/css/common.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_media.css' />">
    <link rel="stylesheet" href="<c:url value='/css/mypage3.css' />">
    <link rel="stylesheet" href="<c:url value='/css/mypage.css' />">
    <link rel="stylesheet" href="<c:url value='/css/modal.css' />">
    <script src="<c:url value='https://code.jquery.com/jquery-1.12.4.js' />"></script>

    <!-- 글씨폰트 NOTO SANS KR  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">
    <!-- 게시판 css/js -->
    <!-- <link rel="stylesheet" href="./css/6.accompany_package_travel.css"> -->


</head>

</style>
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
                    <a href="#"><p>경기・수도권</p></a>
                    <a href="#"><p>강원</p></a>
                    <a href="#"><p>충청・전라</p></a>
                    <a href="#"><p>경상・울릉</p></a>
                    <a href="#"><p>제주</p></a>
                </div>
            </li>
            <li>
                <p class="ham_item_name">추천명산</p>

                <div class="ham_items">
                    <a href="#"><p>한국의 산</p></a>
                    <a href="#"><p>해외의 산</p></a>
                    <a href="#"><p>클라이밍</p></a>
                    <a href="#"><p>둘레길</p></a>
                </div>
            </li>
            <li>
                <p class="ham_item_name">커뮤니티</p>

                <div class="ham_items">
                    <a href="#"><p>산악회</p></a>
                    <a href="#"><p>등산동행</p></a>
                    <a href="#"><p>자유게시판</p></a>
                    <a href="#"><p>맛집추천</p></a>
                </div>
            </li>
        </ul>
    </div>

    <div class="select_form">
        <!-- js로 갈아 끼울예정 시작 -->


        <div class="section_left tab-content current" id="tab-1" >
            <div class="form_title3">
                <h1 class="font_800" id="modify_title">내 여행 후기</h1>
            </div>
            <div class="my_board">
                <h2 class="title_sceond" >내가 작성한 게시물</h2>
                <ul class="post-list">
                    <c:forEach var="board" items="${userReviews}">
                        <li class="post">

                            <p class="board_id">${board.id} 번</p>
                            <img class="profile-image" src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명"/>
                            <h3 class="post-title"><a href="#">제목 : ${board.boardTitle}</a></h3>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="my_comment">
                <h2 class="title_sceond">내가 작성한 댓글</h2>
                <ul class="comment-list">
                    <c:forEach var="comment" items="${usercomments}">
                        <li class="comment_li">
                            <div class="comment_id">${comment.boardId} 번 </div>
                            <div class="commnet_writer">작성자: ${comment.commentWriter}</div>
                            <div class="comment_content">댓글내용: ${comment.commentContents}</div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!-- js로 갈아 끼울예정 끝 -->
        <div class="section_left tab-content" id="tab-2"></div>
        <div class="section_left tab-content" id="tab-3"></div>
        <div class="section_left tab-content" id="tab-4"></div>
        <div class="section_left tab-content" id="tab-5"></div>

        <div class="section_right">
            <h1 class="mypage_title">MyPage</h1>
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-1"><a  class="my_spot" href="<c:url value='/mypage' />">회원정보 수정 및  탈퇴</a></li>
                <li class="tab-link" data-tab="tab-2"><a  class="my_spot" href="<c:url value='/mypage2' />">예약 내역</a></li>
                <li class="tab-link" data-tab="tab-3"><a  class="my_spot" href="<c:url value='/mypage3' />">내 여행 후기</a></li>
                <li class="tab-link" data-tab="tab-4"><a  class="my_spot" href="<c:url value='/mypage4' />">내 동행</a></li>
            </ul>
        </div>
    </div>
</div>
<%-- 가고자하는 url주소 변수에 담아서 외부스트립트에서 쓸수있게 여기서 스트립트 파일로 변수
 선언 해주고 그걸 가지고 외부스트립트에서 쓸수있다 (js에서 jstl 쓸때 유용하다, js에서 c:url 같은거 못하니 이렇게 변수 선언해주고 그 변수를 js에서 사용하면 맵핑주소붙여서 이동할수있다.
 )--%>
<footer class="footer"></footer>
<%String modifyAddUrl = request.getContextPath() + "/modifyAdd";%>
<%String outUrl = request.getContextPath() + "/out";%>

<script>var modifyAddUrl = '<%= modifyAddUrl %>';</script>
<script>var outUrl = '<%= outUrl %>';</script>

<script src="<c:url value='/js/mypage.js' />"></script>
<script src="<c:url value='/js/alert.js' />"></script>



</body>
</html>