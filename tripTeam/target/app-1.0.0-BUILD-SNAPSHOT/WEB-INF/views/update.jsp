<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<html>
<head>
    <title>update.jsp</title>
    <link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <%--    <link rel="stylesheet" href="<c:url value='/css/5_2.review_save.css'/> ">--%>
    <link rel="stylesheet" href="<c:url value='/css/copy_review_save.css'/> ">
    <!-- 글씨폰트 NOTO SANS KR  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200;300;500;800&display=swap" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="contents">
        <div class="logo">
            <a href="<c:url value='/'/>"><img src="<c:url value='/img/logo.png'/>" alt="logo"></a>
        </div>
        <ul class="nav_ul">
            <li><a href="<c:url value='/viewPackage'/>">검색</a></li>
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
<div class="save_review_banner">
    <img src="<c:url value='/img/review_content_save_banner.jpeg'/>" alt="">
    <div class="save_review_banner_txt">
        <p>나의 함께했던 누군가와의 추억.</p>
        <p>동행 후기</p>
    </div>
</div>

<div class="save_review_content" id="save_review_content">
    <form action="/app/board/update" method="post" name="updateForm" enctype="multipart/form-data">
       <div class="info">
           <input type="hidden" name="id" value="${board.id}" readonly>
           <input type="hidden" name="boardWriter" value="${board.boardWriter}">
           <b class="wirter_u">작성자 : ${board.boardWriter}</b>
           <input type="text" name="boardPass" id="boardPass" placeholder="비밀번호">
       </div>
        <!-- 기존 이미지 표시 -->
        <div class="flex_con">
            <div class="con1">
                <div id="image_container">
                    <img src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명" />
                    <p id="image_container_txt">프로필 이미지를 수정.</p>
                </div>
                <!-- 파일첨부 버튼 -->
                <div class="select_review_page_Thumnail">
                    <label for="file-upload1" class="file-upload-btn1">
                        <p>프로필 이미지 수정하기</p>
                    </label>
                    <input type="file" name="imageFile" id="file-upload1" class="input-file" onchange="setThumbnail(event);">
                    <input type="hidden" name="mainImageExists" value="${not empty board.mainImagePath}">
                </div>
            </div>
        <div class="con2">
            <div class="save_review_content_write_title">
                <span>제목</span>
                <input type="text" name="boardTitle" class="board_title" placeholder="제목을 수정해 주세요.">
            </div>
            <hr>
            <div class="board_content">
                <span>내용</span>
                <textarea name="boardContents" class="boardContents" cols="30" rows="10" placeholder="후기 내용을 수정해 주세요.">${board.boardContents}</textarea>
            </div>
        </div>
</div>
<%--글 내용 작성--%>
        <div class="con3" style="width: 1300px; margin: 0 auto; margin: 15px auto;">
            <div id="images_container" class="images_container">
                <c:if test="${not empty fileNames}">
                    <c:forEach var="fileName" items="${fileNames}">
                        <img class="d_files" src="<c:url value='/upload/${fileName}'/>" alt="X">
                    </c:forEach>
                </c:if>
<%--                <img src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명" />--%>
                <p id="image_container_txt2" style="text-align: center"></p>
            </div>

        <%--디테일--%>
        <label for="file-upload" class="file-upload-btn2">
            디테일 이미지 수정.
        </label>
        <input type="file" name="detailImages" id="file-upload" class="input-file"  multiple onchange="setDetailImage(event);">

    </div>

        <input type="button" class="cancle_review_content_btn"  value="수정" onclick="updateReqFn()">
    </form>
</div>

</div>
</body>
<script>
    const updateReqFn = () => {
        const passInput = document.getElementById("boardPass").value;
        const passDB = '${board.boardPass}';
        if (passInput == passDB) {
            alert("게시글이 수정 되었습니다.")
            document.forms[0].submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }

    <!-- 이미지 미리보기 -->
    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.querySelector("div#image_container img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            img.setAttribute("width", 1500);
            img.setAttribute("height", 100);
            imagesContainer.appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }

    function setDetailImage(event) {
        var imagesContainer = document.getElementById("images_container");
        imagesContainer.innerHTML = ""; // 기존의 이미지를 초기화합니다.

        for (var image of event.target.files) {
            var reader = new FileReader();

            reader.onload = function (event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                img.setAttribute("width", 150);
                img.setAttribute("height", 100);
                imagesContainer.appendChild(img);
            };

            reader.readAsDataURL(image);
        }
    }

</script>
</html>