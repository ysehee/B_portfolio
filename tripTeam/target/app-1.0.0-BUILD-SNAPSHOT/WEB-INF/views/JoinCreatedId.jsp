<%--
  Created by IntelliJ IDEA.
  User: user8241
  Date: 2023-11-15
  Time: 오전 10:06
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
    <title>트렌디한 등산앱, 오르리청산-orri</title>
    <link rel="icon" href="<c:url value='${contextPath}/img/favicon.png' />" type="image/x-icon" alt="언덕 아이콘  제작자: Saepul Nahwan - Flaticon">
    <link rel="stylesheet" href="<c:url value='/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">
    <link rel="stylesheet" href="<c:url value='/css/swiper_bundle.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_mountain_swiper.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_total_info_swiper.css' />">
    <!-- Link Swiper's CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" /> -->
    <!-- 동적인 URL로 CSS 파일들 로드 -->
    <link rel="stylesheet" href="<c:url value='/css/font.css' />">
    <link rel="stylesheet" href="<c:url value='/css/common.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index_media.css' />">
    <link rel="stylesheet" href="<c:url value='/css/joinCreateId.css' />">

    <!-- 동적인 URL로 jQuery 및 Swiper JS 로드 -->
    <script src="<c:url value='https://code.jquery.com/jquery-1.12.4.js' />"></script>
    <script src="<c:url value='https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js' />"></script>


    <!-- 글씨폰트 NOTO SANS KR  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">

    <!-- Swiper JS -->
    <script src="<c:url value='https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js' />"></script>
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

    <main>
        <div class="wrapper">
            <form action="<c:url value="/joinCreatedId/save" />" method="GET" name="join" id="ioin" onsubmit="return joinform_check()">

                <div class="title"><h1>회원가입</h1></div>

                <!-- 이름 or 닉네임 -->

                <div class="Id">
                    <label for="id">아이디</label>
                    <input class="Check" id="id" name="userId"  type="text" placeholder="영문자로 시작하는 4~15글자 영문자-숫자 입력해야 합니다." maxlength="20" onblur="joinform_check()" >
                    <button type="button" id="checkDuplicateBtn" onclick="checkUseId()">중복 검사</button>
<%--                    <div id="idError" class="error">${ URLDecoder.decode(msg,"utf-8")  }</div>--%>
                    <div id="idError" class="error">${ URLDecoder.decode(param.msg,"utf-8")  }</div>
                </div>
                <div class="password">
                    <label for="pw">비밀번호</label>
                    <input class="Check" id="pw" name="userPw" type="password" placeholder="영문자+숫자+특수문자 조합으로 8~25자리 입력해야 합니다." maxlength="20" onblur="joinform_check()">
                    <div id="pwError" class="error"></div>
                </div>
                <div class="passwordCheck">
                    <label for="pwCheck">비밀번호 확인</label>
                    <input class="Check" id="pwCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요." onblur="joinform_check()">
                    <div id="pwCheckError" class="error"></div>
                </div>

                <div class="nameCheck">
                    <label for="nameCheck">이름</label>
                    <input class="Check" id="nameCheck" name="userName" type="text" placeholder="이름을 입력해주세요." onblur="joinform_check()">
                    <div id="nameCheckError" class="error"></div>
                </div>

                <div class="gender">
                    <label for="gender_sel">성별</label>
                    <select name="userGender" id="gender_sel" onchange="joinform_check()">
                        <option value="" disabled selected>성별 선택</option>
                        <option value="male">남</option>
                        <option value="female">여</option>
                    </select>
                    <div id="genderError" class="error"></div>
                </div>
                <div class="birth">
                    <label for="birth">생년월일</label>
                    <input class="Check" id="birth" name="userBirth"  type="text" placeholder="생년월일을 입력해주세요. ex)19980222" maxlength="20" onblur="joinform_check()">
                    <div id="birthError" class="error"></div>
                </div>

                <div class="phoneNo">
                    <label for="phoneNo">핸드폰 번호</label>
                    <input class="Check" id="phoneNo" name="userPhoneNo"  type="text" placeholder="핸드폰번호 '-' 없이 입력해주세요." maxlength="20" onblur="joinform_check()">
                    <div id="phoneNoError" class="error"></div>
                </div>

                <div class="email">
                    <label for="email_id">이메일</label>
                    <input type="hidden" name="userEmail" id="userEmail">
                    <input type="text" <%--name="email_id"--%> id="email_id" class="Check" placeholder="example" onblur="joinform_check()"> @
                    <input type="text" <%--name="email_add"--%> onblur="joinform_check()"  id="email_add" class="Check"  placeholder="example.com">
                    <select <%--name="email_sel"--%> id="email_sel" onblur="joinform_check()" onchange="change_email()" >
                        <option value="">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="daum.net">daum.com</option>
                        <option value="kakao.com">kakao.com</option>
                    </select>
                    <div id="emailError" class="error"></div>
                </div>

                <div class="line">
                    <hr>
                </div>
                <div class="signUp">
                    <button type="submit" >가입하기</button>
                </div>
            </form>
        </div>
    </main>

    <div class="sec2">

    </div>


</div>


<footer class="footer"></footer>
<script src="<c:url value='/js/joinCreateId.js' />"></script>
<script src="<c:url value='/js/alert.js' />"></script>


</body>
</html>