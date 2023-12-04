<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/selectPackagePage.css' /> ">
    <link rel="stylesheet" href="<c:url value='/css/reviewBoard.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/calendar.css' />">
    <link rel="stylesheet" href="<c:url value='/css/common.css' /> ">
    <link rel="stylesheet" href="<c:url value='/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">
</head>

<%--<a href="<c:url value="/board/read?bno=${boardDto.bno}&page=${ph.page}&pageSize=${ph.pageSize}&option=${param.option}&keyword=${param.keyword}"/>">${boardDto.title}</a>--%>

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
    <div class="banner_img">
        <img src="<c:url value='/img/review_content_save_banner.jpeg'/>" alt="board_long_banenr">
    </div>

    <form method="GET" id="packSearchBox">
        <%--        <label for="packCategory">Category</label>--%>
        <div class="packSearchBox_con1">
            <%--<label for="packCategory">Category</label>--%>
            <select type="text" id="packCategory" class="optionSize" placeholder="국내여행 or 해외여행">
                <option value="">지역 선택 </option>
            </select>

            <%--<label for="packLocation">Location</label>--%>
            <select id="packLocation">
                <option value="">세부 지역 선택</option>
            </select>
        </div>

        <div class="packSearchBox_con2">
            <%--            <label for="packDate">일정 </label>--%>
            <input type="date" id="packDate" autocomplete="off" onfocus="restrictDateSelection()"  date-placeholder="날짜 선택" required>
            <%--            <input type="month" name="start_month" id="m1" name="start_month" month-placeholder="출발하시려는 월을 선택해 주세요." required>--%>
            <!-- Schedule 옵션 추가 -->
            </input>
            <button type="submit" id="submitButton">
                <img src="<c:url value='/img/search_icon.png'/>" alt="search_icon">
            </button>
        </div>
    </form>

    <div id="packBigBox">
        <c:forEach var="item" items="${allPackageList}">
            <div class="packBox" id="${item.packageId}">
                <div class="packImg">
                    <img src="<c:url value='/img/packageImg/' />${item.packageImg}.jpg"  alt="여행지사진">
                </div>
                <div class="packInfo">
                    <div class="packLocation">
                        <div style="width: 20px; height: 20px; margin-right: 10px">
                            <img src="<c:url value='/img/icon_location2.png'/>" style="width: 100%">
                        </div>
                        <span style="margin-top: 3px">${item.packageType}</span>
                        <span style="margin-top: 3px"> + </span>
                        <span style="margin-top: 3px">${item.packageLocation}</span>
                    </div>
                    <div class="packTitle">
                        <p>${item.packageTitle}</p>
                    </div>
                    <div class="packPrice">
                        <div style="width: 20px; height: 20px; margin-right: 10px">
                            <img src="<c:url value='/img/icon_money1.png'/>" style="width: 100%">
                        </div>
                        <p>${item.packagePrice}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>
<footer class="footer"></footer>
</body>

<script>
    // window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    // document.addEventListener('DOMContentLoaded', function () {
    //     buildCalendar();
    // });

    // Category 목록을 채우는 함수
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

    ////////////////////////////////////////////////////////////////////

    // input값이 한자리 숫자인 경우 앞에 '0' 붙여주는 함수
    // function leftPad(value) {
    //     if (value < 10) {
    //         value = "0" + value;
    //         return value;
    //     }
    //     return value;
    // }

    /////////////////////////////////////////////////////
    // Submit 버튼 클릭 시 호출되는 함수
    function submitForm() {
        // 선택한 값 가져오기
        var selectedCategory = document.getElementById('packCategory').value;
        var selectedLocation = document.getElementById('packLocation').value;
        var selectedDate = document.getElementById('packDate').value;

        // URL 생성
        var url = 'viewPackage'; // 여기에 결과페이지의 경로를 넣으세요.
        url += '?packageCategory=' + encodeURIComponent(selectedCategory);
        url += '&packageLocation=' + encodeURIComponent(selectedLocation);
        url += '&packageStartDate=' + encodeURIComponent(selectedDate);

        // URL로 리다이렉션
        window.location.href = url;
    }

    // Submit 버튼에 이벤트 리스너 추가
    document.getElementById('submitButton').addEventListener('click', function(event) {
        event.preventDefault(); // 폼의 기본 동작을 막음 (페이지 새로고침 방지)
        submitForm();
    });

    /////////////////////////////////////////////////////
    // 아이디가 packBigBox요소를 클릭하면 다른 페이지로 넘어가면서 url로 정보 전송하기
    function clickPackage(packBoxId) {
        let url = "readCalendarPackage";
        url += '?packageId=' + packBoxId;

        // URL로 리다이렉션
        window.location.href = url;
    }

    let packageIdList = [];

    <c:forEach var="item" items="${allPackageList}">
    packageIdList.push("${item.packageId}");
    </c:forEach>

    for(let item of packageIdList) {
        document.getElementById(item).addEventListener('click', function() {
            clickPackage(item);
        })
    }

    //오늘날짜 구해서 이전 날짜 들은 선택 불가하게 만드는 기능임!
    function restrictDateSelection() {
        var inputDate = document.getElementById('packDate');

        // 현재 날짜
        var today = new Date();

        // 현재 날짜 이전의 날짜를 비활성화하기 위해 최소 날짜를 설정
        var minDate = today.toISOString().split('T')[0];
        inputDate.min = minDate;

        // 선택한 날짜 가져오기
        var selectedDate = new Date(inputDate.value);

        // 만약 선택한 날짜가 오늘 날짜 이전이면
        if (selectedDate < today) {
            // 오늘 날짜로 설정
            inputDate.value = minDate;
        }
    }


</script>
</html>
