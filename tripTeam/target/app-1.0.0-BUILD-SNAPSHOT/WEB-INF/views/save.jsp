<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<html>
<head>
    <title>save</title>
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
    <form action="/app/board/save" method="post" enctype="multipart/form-data">
      <div class="info">
          <%--input으로 할 필요없음 -작성자- --%>
          <input type="hidden" name="boardWriter" placeholder="작성자" readonly value="${userId}">
          <b class="wirter_u">작성자 : ${userId}</b>
          <b class="pwd_u"> <p style="font-size: 14px">게시글의 비밀번호 입력</p>
              <input type="password" name="boardPass" id="boardPass" placeholder="비밀번호">
          </b>
      </div>
        <%--썸네일 및 메인 이미지--%>
        <div class="flex_con">
            <div class="con1">
                <div id="image_container">
                    <p id="image_container_txt">게시글의 프로필 이미지를 선택해주세요</p>
                </div>
                <!-- 파일첨부 버튼 -->
                <label for="file-upload1" class="file-upload-btn1">
                    <p>프로필 이미지업로드</p>
                </label>
                <input type="file" name="imageFile" id="file-upload1" class="input-file" multiple onchange="checkFile(event);">
            </div>
            <div class="con2">
                 <div class="save_review_content_write_title">
                     <span>제목</span>
                     <input type="text" name="boardTitle" class="board_title" placeholder="게시글 제목">
                 </div>
                <hr>
                 <div class="board_content">
                    <span>내용</span>
                    <textarea name="boardContents" class="boardContents" cols="30" rows="10" placeholder="후기 내용을 작성해 주세요"></textarea>
                 </div>
            </div>
        </div>
<%--글 내용 작성--%>

<%--디테일 사진들 --%>
        <div class="con3" style="width: 1300px; margin: 0 auto; margin: 15px auto;">
            <div id="images_container" class="images_container">
                <p id="image_container_txt2" style="text-align: center">상세 이미지들을 선택해주세요.</p>
            </div>
            <!-- 파일첨부 버튼 -->
            <label for="file-upload" class="file-upload-btn2">
                디테일 이미지업로드
            </label>
            <input type="file" name="detailImages" id="file-upload" class="input-file"  multiple onchange="setDetailImage(event);">
        </div>
            <div class="submit_btn_or_cancle_btn">
                <input type="submit" class="save_review_content_btn" value="작성">
                <input type="submit" class="cancle_review_content_btn" value="취소">
            </div>
    </form>
</div>

<footer class="footer"></footer>


<script>
    function checkFile(event) {
        var files = event.target.files;
        if (files.length > 1) {
            alert("하나의 이미지만 선택해주세요.");
            event.target.value = "";
        } else {
            var file = files[0];
            var fileType = file.type;
            if (!fileType.startsWith('image/')) {
                alert("이미지 파일만 선택할 수 있습니다.");
                event.target.value = "";
            } else {
                setThumbnail(event);
            }
        }
    }
    <!-- 이미지 미리보기 -->
    function setThumbnail(event) {
        var reader = new FileReader();
        reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            img.setAttribute("width", 200);
            img.setAttribute("height", 150);
            var container = document.querySelector("div#image_container");
            container.innerHTML = ""; // 기존 이미지 삭제
            container.appendChild(img);

            var prv_txt = document.getElementById("image_container_txt");
            prv_txt.style.display = "none";
        };

        var file = event.target.files[0];
        if (file) {
            reader.readAsDataURL(file);
        }
    }
    function setDetailImage(event){
        for(var image of event.target.files){
            var reader = new FileReader();

            reader.onload = function(event){
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                img.setAttribute("width", 150);
                img.setAttribute("height", 100);
                document.querySelector("div#images_container").appendChild(img);

            };
            console.log(image);
            if (!image.type.startsWith('image/')) {
                alert("이미지 파일만 선택할 수 있습니다.");
                continue;
            }
            reader.readAsDataURL(image);
            var prv_txt2 = document.getElementById("image_container_txt2");
            prv_txt2.style.display = "none";
        }
    }

</script>
</body>
</html>