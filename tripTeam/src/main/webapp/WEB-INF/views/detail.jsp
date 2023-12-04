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
    <link rel="stylesheet" href="<c:url value='/css/detail.css'/> ">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
        <%--input으로 할 필요없음 -작성자- --%>
        <div class="info">
            <div class="content_info">
                <input type="hidden" name="boardWriter" placeholder="작성자" readonly value="${userId}">
                <p class="wirter_u"><b>작성자 :</b> ${userId}</p> &nbsp&nbsp&nbsp
                <p class="pwd_u"><b> | 게시글의 비밀번호 입력 : </b>
                    <input type="password" name="boardPass" id="boardPass" placeholder="비밀번호">
                </p>
            </div>
            <div class="content_lcoation">
                <span><b>조회수</b> : ${board.boardHits}</span>
                <span><b> | 게시글 번호</b> : ${board.id}</span>
                <span><b> | 작성일</b> : ${board.boardCreatedTime}</span>
            </div>
        </div>
        <%--썸네일 및 메인 이미지--%>
        <div class="flex_con">
            <div class="con1">
                <div id="image_container">
                    <img src="<c:url value='/upload/${board.mainImagePath}'/>" alt="이미지 설명" />
                    <p id="image_container_txt">프로필 이미지</p>
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
                    <h1 style="font-size: 25px"> ${board.boardTitle}</h1>
                    <%--                    <input type="text" name="boardTitle" class="board_title" placeholder="게시글 제목">--%>
                </div>
                <hr>
                <div class="board_content">
                    <span>내용</span>
                    <p>${board.boardContents}</p>
                    <%--                    <textarea name="boardContents" class="boardContents" cols="30" rows="10" placeholder="후기 내용을 작성해 주세요"></textarea>--%>
                </div>
            </div>
        </div>
        <%--글 내용 작성--%>

        <%--디테일 사진들 --%>
        <div class="con3_detail" style="width: 1300px; margin: 0 auto; margin: 15px auto;">
            <div id="images_container" class="images_container_detail">
                <c:if test="${not empty fileNames}">
                    <c:forEach var="fileName" items="${fileNames}">
                        <img class="d_files" src="<c:url value='/upload/${fileName}'/>" alt="x">
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </form>
    <%--    댓글--%>
    <div class="content_title_button">
        <button onclick="listFn()">목록</button>
        <button class="btn_2" onclick="updateFn()" <c:if test="${board.boardWriter ne userId}">style="display: none"</c:if> >수정</button>
        <button onclick="deleteFn()" <c:if test="${board.boardWriter ne userId}">style="display: none"</c:if> >삭제</button>
    </div>

    <div class="comment_sec">
        <h1>댓글</h1>
        <br>
        <div id="comment-list">
            <c:forEach items="${commentList}" var="comment">
                <div class="content_comment_list">
                    <div class="commentId" style="display: none">${userId}</div>
                    <div class="comment_user_comment">
                        <b>작성자 : ${userId}</b>
                        <div>${comment.commentContents}
                            <!-- 삭제 버튼을 작성자에게만 보여줌 수정! -->
                            <c:if test="${comment.commentWriter eq userId}">
                                <!-- 현재 로그인한 사용자와 댓글 작성자가 일치하는 경우에만 삭제 버튼이 보입니다. -->
                                <button class="comment_d" onclick="deleteComment(${comment.id})">댓글삭제</button>
                            </c:if>
                        </div>
                    </div>
                </div>
                <hr class="hr_mini">
            </c:forEach>

        </div>

        <%--댓글 버튼--%>

        <div class="write_comment">
            <%--                <input type="text" id="commentWriter" placeholder="작성자">--%>
            <input type="text" id="commentContents" style="outline:none" placeholder="댓글 작성" onkeydown="if(event.keyCode === 13) { commentWrite(); return false; }">
            <button id="comment-write-btn" onclick="commentWrite()">게시</button>
        </div>
    </div>
</div>
</div>

<footer class="footer"></footer>


<script>
    <%--   수정해야함~~~~~~~~~~~~~--%>

    <%--   수정해야함~~~~~~~~~~~~~--%>
    const listFn = () => {
        const page = '${page}';
        location.href = "/app/board/paging?page=" + page;
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href = "/app/board/update?id=" + id;
    }
    const deleteFn = () => {
        const id = '${board.id}';
        alert("해당 게시글을 삭제하였습니다.")
        location.href = "/app/board/delete?id=" + id;
    }

    const commentWrite = () => {
        const writer = '${userId}';
        const contents = document.getElementById("commentContents").value.trim();
        const board = '${board.id}';

        if (contents !== '') { // 빈 칸이 아닌 경우에만 댓글 작성
            $.ajax({
                type: "post",
                url: "/app/comment/save",
                data: {
                    commentWriter: writer,
                    commentContents: contents,
                    boardId: board
                },
                dataType: "json",
                success: function(commentList) {
                    let output = "<div>";
                    for(let i in commentList){
                        let dt = new Date(commentList[i].commentCreatedTime);
                        let y = (dt.getFullYear())
                        let m = (dt.getMonth()+1)
                        let d = (dt.getDate())

                        output += '<div class="content_comment_list">';
                        output += '<div class="commentId" style="display: none">'+commentList[i].id+'</div>';
                        output += '<div class="comment_user_info">';
                        output += '<b>작성자 : '+commentList[i].commentWriter+'</b>';
                        output += '</div>';
                        output += '<div class="comment_user_comment">'; //시간설정 해야함
                        output += '<b>'+commentList[i].commentContents+'</b>';
                        // 작성자와 로그인한 사용자를 비교하여 삭제 버튼 표시 수정!
                        if (commentList[i].commentWriter === '${userId}') {
                            output += '<button class="comment_d" onclick="deleteComment(' + commentList[i].id + ')">댓글삭제</button>';
                        }
                        output += '</div>';
                        output += '</div>';
                        output +='<hr style="width: 1200px; margin: 10px auto">';

                    }
                    output += "</div>";

                    document.getElementById('comment-list').innerHTML = output;
                    document.getElementById('commentContents').value='';
                },
                error: function() {
                    console.log("실패");
                }
            });
        } else {
            alert('댓글을 입력해주세요.');
        }
    }



    document.addEventListener('DOMContentLoaded', function() {
        const images = document.querySelectorAll('.d_files');

        images.forEach(function(image) {
            if (!image.getAttribute('src') || image.getAttribute('src') === '') {
                image.remove();
            }
        });
    });



    function deleteComment(id) {
        console.log(id)
        $.ajax({
            type: "DELETE",
            url: "/app/comment/delete/" + id,
            success: function(response) {

                console.log("삭제 성공");
                //댓글 목록 갱신???
                location.reload();
            },
            error: function() {

                console.log("삭제 실패");
            }
        });
    }

</script>

</body>
</html>