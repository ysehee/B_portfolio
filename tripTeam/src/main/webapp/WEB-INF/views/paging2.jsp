<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<%-- fmt 라이브러리로 시간 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--<link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">--%>

<%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--<script src="./js/5.reviewBoard.js"></script>--%>

<html>
<!-- 글씨폰트 NOTO SANS KR  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">
<head>
    <title>paging</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css'/>">
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
                <li class="join">
                    <c:if test="${empty userId }">
                        <a href="<c:url value='/join/add'/>">회원가입</a>
                    </c:if>
                    <c:if test="${not empty userId }">
                        <a href="<c:url value=''/>">${userId}<span style="font-size: 14px">님 환영합니다!</span></a>
                    </c:if>
                </li>
                <li class="v_line"></li>
                <li class="login">
                    <a href="<c:url value='${ logInOutLink }' />">${ logInOutTxt }</a>
                </li>

                <li class="mode"><a href="<c:url value='/board/save'/>">글쓰기</a></li>
            </ul>
        </div>
    </header>
    <div class="banner_img">
        <img src="<c:url value='/img/new_banner.jpg'/>" alt="board_long_banenr">
    </div>
    <div class="select_review">
        <button class="review_btn_gradient1" id="accompany_review" onclick="showContent('accompany_review_ul')"><span id="review_title1" class="review_title" >동행 후기</span></button>
        <%--        <button class="review_btn_gradient2" id="package_tour_review" onclick="showContent('package_tour_review_ul')"><span id="review_title2" class="review_title">패키지 여행 후기</span></button>--%>
    </div>
    <div class="accompany_review review" id="accompany_review_review">
        <div class="orderby_desc">
            <button id="orderby_desc_btn_newest">
                <span id="orderby_desc_title_newest"><a href="/app/board/paging">최신 순</a></span>
            </button>
            <button id="orderby_desc_btn_popularity" >
                <span id="orderby_desc_title_popularity"><a href="/app/board/paging2">인기 순</a></span>
            </button>
        </div>
        <div>
            <ul class="accompany_review_ul" id="accompany_review_ul">
                <%--게시글 들어가는 부분--%>
                <c:forEach items="${reviewDtoList_p}" var="board">
                    <li class="package_tour_review_li">
                        <a href="/app/board?id=${board.id}&page=${paging.page}">
                            <div class="user_info">
                                <div class="user_info_name"><b class="writer_b">${board.boardWriter}님</b><b class="r_date">
                                    <fmt:formatDate value="${board.boardCreatedTime}" pattern="MM-dd HH:mm" /></b> </div>
                                <div class="user_info_start_travel"><!-- 여행 출발한 월 -->
                                    <span> 제목 : ${board.boardTitle}</span>
                                </div>
                            </div>
                            <div class="accompany_review_img">
                                <img src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명" />
                            </div>
                            <div class="user_info_travelinfo">
                                <div class="user_info_travelinfo_content">
                                    <p class="user_info_contents">내용 :  ${board.boardContents}</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>

            <ul class="package_tour_review_ul" id="package_tour_review_ul">
                <%--게시글 들어가는 부분--%>

                <div class="select_review_page"> <%-- 하단 페이지 넘기는 방식 --%>
                    <c:choose>
                        <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                        <c:when test="${paging.page<=1}">
                            <span>[이전]</span>
                        </c:when>
                        <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                        <c:otherwise>
                            <a href="/app/board/paging?page=${paging.page-1}">[이전]</a>
                        </c:otherwise>
                    </c:choose>

                    <%--  for(int i=startPage; i<=endPage; i++)      --%>
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                        <c:choose>
                            <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                            <c:when test="${i eq paging.page}">
                                <span>${i}</span>
                            </c:when>

                            <c:otherwise>
                                <a href="/app/board/paging?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${paging.page>=paging.maxPage}">
                            <span>[다음]</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/app/board/paging?page=${paging.page+1}">[다음]</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </ul>
        </div>
    </div>

    <footer class="footer"></footer>
</div>

</body>
<script>
    //후기 게시판 진입 후 기본 세팅이랑, 버튼 클릭하면 동행,패키지 후기 나오는 기능
    // 페이지 진입 시 기본 값
    window.addEventListener('DOMContentLoaded', function() {
        showContent('accompany_review_ul');
        //showContent('package_tour_review_review');
    });

    function showContent(content) {
        var contentA = document.getElementById("accompany_review_ul");
        var contentB = document.getElementById("package_tour_review_ul");

        // 내용 숨김
        contentA.style.display = "none";
        contentB.style.display = "none";

        // 선택한 내용 보이기
        if (content === "accompany_review_ul") {
            contentA.style.display = "flex";
            console.log("1111")
        } else if (content === "package_tour_review_ul") {
            contentB.style.display = "flex";
            console.log("2222")
        }
    }
    // document.getElementById("review_title1").style.color = "#000"
    // document.getElementById("review_title2").style.color = "#000"
    document.getElementById("review_title1").style.color = "#fff"
    function button1Click() {
        document.getElementById("accompany_review").style.backgroundColor = "#87C4FF";
        document.getElementById("package_tour_review").style.backgroundColor = "#efefef"
        document.getElementById("review_title1").style.color = "#fff"
        document.getElementById("review_title2").style.color = "#000"
        //색상 변경 애니메이션 효과
        document.getElementById('package_tour_review').style.transition = 'background-color 0.3s ease-in-out, width 0.3s ease-in-out';


    }
    function button2Click() {
        document.getElementById("package_tour_review").style.backgroundColor = "#87C4FF";
        document.getElementById("accompany_review").style.backgroundColor = "#efefef"
        document.getElementById("review_title1").style.color = "#000"
        document.getElementById("review_title2").style.color = "#fff"
        //색상 변경 애니메이션 효과
        document.getElementById('accompany_review').style.transition = 'background-color 0.3s ease-in-out, width 0.3s ease-in-out';
    }
    // 버튼1에 이벤트 핸들러 바인딩
    document.getElementById("accompany_review").addEventListener("click", button1Click);
    // 버튼2에 이벤트 핸들러 바인딩
    document.getElementById("package_tour_review").addEventListener("click", button2Click);

    // 동행/패키지 버튼 선택 애니메이션 js


    /////////////////////////////
    /*orderby_desc = 정렬방식 */
    window.onload = function() {
        document.getElementById("orderby_desc_btn_newest").checked = true;
        document.getElementById("orderby_desc_btn_newest").style.backgroundColor = "#87C4FF";
        document.getElementById("orderby_desc_btn_newest").style.color = "#fff"

        console.log("최신순 선택 됨")
    };


    var desc_btn1= document.getElementById('orderby_desc_btn_newest');
    var desc_btn2= document.getElementById('orderby_desc_btn_popularity');

    var desc_btn_title1 = document.getElementById("orderby_desc_title_newest");
    var desc_btn_title2 = document.getElementById("orderby_desc_title_popularity");


    function select_desc_btn1() {//최신순 눌렀을때 색상 변경 기능
        desc_btn1.style.backgroundColor = "#87C4FF";
        desc_btn2.style.backgroundColor = "#efefef"

        desc_btn_title1.style.color = "#fff"
        desc_btn_title2.style.color = "#000"

        //색상 변경 애니메이션 효과
        desc_btn1.style.transition = 'background-color 0.3s ease-in-out, width 0.3s ease-in-out';


        console.log("aaaa")
    }
    function select_desc_btn2() {//인기순 눌렀을때 색상 변경 기능
        desc_btn2.style.backgroundColor = "#87C4FF";
        desc_btn1.style.backgroundColor = "#efefef"

        desc_btn_title2.style.color = "#fff"
        desc_btn_title1.style.color = "#000"

        //색상 변경 애니메이션 효과
        desc_btn2.style.transition = 'background-color 0.3s ease-in-out, width 0.3s ease-in-out';

        console.log("bbbb")
    }

    desc_btn1.addEventListener("click", select_desc_btn1);
    desc_btn2.addEventListener("click", select_desc_btn2);
</script>
</html>
