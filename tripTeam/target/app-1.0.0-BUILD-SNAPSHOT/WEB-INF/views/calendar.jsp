<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page session="false" %> <%-- 이 페이지에서는 세션을 새로 생성 안하겠다 라는 뜻 --%>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'/login/login':'/login/logout'}" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'로그인':'로그아웃'}" />
<c:set var="userId" value="${ pageContext.request.getSession(false).getAttribute('id')==null?'':pageContext.request.getSession(false).getAttribute('id')}" />

<!DOCTYPE html>
<html>
<head>
    <title>달력</title>
    <link rel="stylesheet" href="<c:url value='/css/common.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/header.css'/> ">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

        /*body { background-color : skyblue; }*/

        /*div {*/
        /*    background-color : white;*/
        /*    height: auto;*/
        /*    width: 400px;*/
        /*    margin: 0px;*/
        /*    padding: 20px;*/
        /*    margin: 0 auto;*/
        /*    border-radius:5px;*/
        /*    box-shadow:0px 40px 30px -20px rgba(0,0,0,0.3);*/
        /*}*/

        .Calendar td {
            width: 50px;
            height: 50px;
        }

        .Calendar {
            text-align: center;
            margin-left: 10px;
        }

        .Calendar>thead>tr:first-child>td {
            font-family: 'Questrial', sans-serif;
            font-size: 1.1em;
            font-weight: bold;
        }

        .Calendar>thead>tr:last-child>td {
            font-family: 'Questrial', sans-serif;
            font-weight: 600;
        }

        .Calendar>tbody>tr>td>p:nth-of-type(1) {
            font-family: 'Montserrat', sans-serif;
            height: 30px;
            width: 30px;
            border-radius: 30px;
            transition-duration: .2s;
            line-height: 30px;
            margin: 2.5px;
            margin: 0 auto;
            /* margin-bottom: 5px; */
            display: block;
            text-align: center;
        }

        .Calendar>tbody>tr>td>p:nth-of-type(2) {
            font-family: 'Montserrat', sans-serif;
            height: 15px;
            width: 30px;
            font-size: 11px;
            transition-duration: .2s;
            line-height: 15px;
            margin: 2.5px;
            margin: 0 auto;
            margin-bottom: 5px;
            display: block;
            text-align: center;
            color: black;
        }

        .pastDay {
            color: lightgray;
        }

        .today {
            background-color: #F5D042;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }

        .futureDay {
            background-color: #FFFFFF;
            cursor: pointer;
        }
        .futureDay:hover{
            background:#eee;
        }

        .futureDay.choiceDay,
        .today.choiceDay {
            background: #0A174E;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }

        #saturday {
            color: skyblue;
        }

        #sunday {
            color: red;
        }

        #datePrice {
            margin-top: 10px;

            display: flex;
            flex-direction: column;
        }

        #datePrice input {
            width: 120px;
            margin: 5px 0;
        }

        #datePrice div {
            padding: 0;
        }

        .packNo {
            display: none;
            background-color: #00bbff;
        }

        .main_content{
            max-width: 1300px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
        }
        .packImg{
            width: 1300px;
            height: 650px;
            margin: 0 auto;
            border-radius: 15px;
            margin-bottom: 15px;
        }
        .main_content1{
            width: calc((100% - 20px) - 400px);
            /*border: 1px solid green;*/
            border-radius: 15px ;
            /*height: 1000px;*/
            position: relative;

            box-shadow: rgba(25, 25, 25, 0.2) 0px 6px 10px;
        }
        .main_content2{
            width: 400px;
            height: 531px;
            /*border: 1px solid red;*/
            /*padding-left: 10px;*/
            box-sizing: border-box;
            box-shadow: rgba(25, 25, 25, 0.2) 0px 6px 10px;
            border-radius: 15px;
        }
        .Calendar_div{
            margin: 0 auto;
        }
        .main_content1_header{

        }
        .nav {
            width: 100%;
            height: 50px;
            background-color: #87C4FF;
            border-radius: 15px 15px 0 0;
            display: flex;
            align-items: center;
            gap: 40px;
            justify-content: space-around;
            color: #fff;
            /*color: black;*/
            top: 0;
            left: 0;

            /*position: absolute;*/
        }

        .nav li {
            /*font-size: 20px;*/
        }

        .box {
            width: 100%;
            /*height: 1000px; */
            /*border: 1px solid;*/
            box-sizing: border-box;
            font-size: 22px;
            font-weight: bold;
        }

        #datePrice > table > tr > td {
            text-align: center;

        }
        #datePrice > table {
            margin-bottom: 23px;
        }

        #dateInfo,
        #totalPrice {
            width: 100px;
            font-size: 18px;
            border: none;
        }

    </style>
</head>

<body>
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
<div class="packImg" style="width: 1300px; overflow: hidden">
    <img src="<c:url value='/img/detailPage/detailPage_1.png'/>" style="width: 100%">
</div>
<div class="main_content">
    <div class="main_content1">
        <div class="box" id="box1">
            <ul class="nav nev1">
                <li><a href="#box1">상품 상세</a></li>
                <li><a href="#box2">상품 정보</a></li>
                <li><a href="#box3">유의 사항</a></li>
            </ul>
            <div style="width: 100%; height: 3068px ; overflow: hidden">
                <img src="<c:url value='/img/detailPage/detailPage_2.png'/>" style="width: 100%">
            </div>
        </div>
        <div style="width: 100%; height: 4260px ; overflow: hidden">
            <img src="<c:url value='/img/detailPage/detailPage_3.png'/>" style="width: 100%">
        </div>
        <div class="box" id="box2">
            <ul class="nav nev2">
                <li><a href="#box1">상품 상세</a></li>
                <li><a href="#box2">상품 정보</a></li>
                <li><a href="#box3">유의 사항</a></li>
            </ul>
            <div style="width: 100%; height: 5237px ; overflow: hidden">
                <img src="<c:url value='/img/detailPage/detailPage_4.png'/>" style="width: 100%">
            </div>
            <div style="width: 100%; height:4880px ; overflow: hidden">
                <img src="<c:url value='/img/detailPage/detailPage_5.png'/>" style="width: 100%">
            </div>
            <div style="width: 100%; height:4880px ; overflow: hidden">
                <img src="<c:url value='/img/detailPage/detailPage_6.png'/>" style="width: 100%">
            </div>
        </div>
        <div class="box" id="box3">
            <ul class="nav nev3">
                <li><a href="#box1">상품 상세</a></li>
                <li><a href="#box2">상품 정보</a></li>
                <li><a href="#box3">유의 사항</a></li>
            </ul>
            <div style="width: 100%; height:1474px ; overflow: hidden">
                <img src="<c:url value='/img/detailPage/detailPage_7.png'/>" style="width: 100%">
            </div>
        </div>
    </div>

    <div class="main_content2">
        <div class="Calendar_div">
            <table class="Calendar">
                <thead>
                <tr>
                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                    <td colspan="5">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                </tr>
                <tr>
                    <td id="sunday">일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td id="saturday">토</td>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

        <form id="myForm" action="<c:url value="/reservationPayment" />" method="GET" onsubmit="return formCheck(this)">
            <%--<form>--%>
            <div id="datePrice">
                <input type="text" id="packageNo" name="packageNo" readonly="readonly" style="display: none">
                <input type="text" id="packageId" name="packageId" style="display: none">
                <table style="margin-left: 20px">
                    <tr>
                        <td><label for="dateInfo">출발일</label></td>
                        <td><input type="text" id="dateInfo" name="packageStartDate" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td><label for="totalPrice">상품 금액</label></td>
                        <td><input type="text" id="totalPrice" name="packagePrice" readonly="readonly">
                            <span style="font-size: 18px">원</span></td>
                    </tr>
                </table>
                <button style="width: 300px; margin: 0 auto; height: 30px; background-color:#87C4FF; color: #fff; border: none; border-radius: 5px">예약하기</button>
            </div>
        </form>
    </div>
</div>
<footer class="footer"></footer>
</body>

<script>
    <%--    --%>
    $(document).ready(function() {
        $('.nav a').click(function(){
            // 태그의 기본 이벤트를 실행하지 않게 한다.
            // a태그의 경우 화면 다 지우고 새로 로드 하는걸 안하게 한다
            event.preventDefault();

            console.log($(this).attr('href'))
            let href = $(this).attr('href');

            $('html, body').animate({
                scrollTop: $(href).offset().top
            }, 1000)
        })
    })
    // window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    document.addEventListener('DOMContentLoaded', function () {
        buildCalendar();
    });

    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    const datePrices = [10000, 20000, 30000, 15000, 25000, 35000];

    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
    function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

        while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가

        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
            let nowColumn = nowRow.insertCell();        // 열 추가
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

            let nowColumn = nowRow.insertCell();        // 새 열을 추가하고

            let newDIV = document.createElement("p");
            newDIV.className = "day";
            newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) {                 // 토요일인 경우
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                nowColumn.style.color = "#0000CD";
                // newDIV.classList.add("saturday");
                console.log("newDIV: "+newDIV);
            }

            if (nowDay.getDay() == 0) {
                nowColumn.style.color = "#DC143C";
            }

            // 날짜 밑에 가격 입력
            // 아래 else if 랑 else 문 안에 추가 코드 작성함
            let newPrice = document.createElement("p");
            newPrice.className = "price";

            // packageNo 입력
            let packNo = document.createElement("p");
            packNo.className = "packNo";

            if (nowDay < today) {                       // 지난날인 경우
                newDIV.className = "pastDay";

            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                newDIV.classList.add("today");
                newDIV.onclick = function () {
                    choiceDate(this);
                    // let day = document.querySelector('.choiceDay');
                    let price = document.querySelector('.choiceDay').nextSibling;
                    // price.classList.add("choicePrice");
                    choicePrice(price);

                    let number = price.nextSibling;
                    choiceNo(number);
                }

                // 가격 입력 요소 추가
                newPrice.classList.add("todayPrice");
                // newPrice.innerHTML = leftPad(datePrices[nowDay.getDate() % 5]);
                nowColumn.appendChild(newPrice);

                // packNo 요소 추가
                packNo.classList.add("todayNo");
                nowColumn.appendChild(packNo);
            }
            else {                                      // 미래인 경우
                newDIV.classList.add("futureDay");
                newDIV.onclick = function () {
                    choiceDate(this);
                    let price = document.querySelector('.choiceDay').nextSibling;
                    // price.classList.add("choicePrice");
                    choicePrice(price);

                    let number = price.nextSibling;
                    choiceNo(number);
                }

                // 가격 입력 요소 추가
                newPrice.classList.add("futurePrice");
                // newPrice.innerHTML = leftPad(datePrices[nowDay.getDate() % 5]);
                nowColumn.appendChild(newPrice);

                // packNo 요소 추가
                packNo.classList.add("futureNo");
                nowColumn.appendChild(packNo);
            }
        }

        // 년, 월, 일을 2020-11-11 형태로 조합할 배열 만들기
        let realDateArray = [];

        // 년, 월, 일을 2020-11-11 형태로 조합하기
        let realYear = document.getElementById('calYear').innerText;
        let realMonth = document.getElementById('calMonth').innerText;
        let realDays = document.querySelectorAll('.day');

        // 각 요소에 대해 반복하면서 해당 날짜로 id를 지정해준다.
        realDays.forEach(function(realDay) {
            let dateForArray = realYear + "-" + realMonth + "-" + realDay.innerText;
            console.log("년월일 : " + dateForArray);
            realDay.nextElementSibling.id = dateForArray;

            // let nextRealDay = realDay.nextElementSibling;
            // nextRealDay.nextElementSibling.classList.add(dateForArray);
            realDateArray.push(dateForArray);
        });

        // 모델에 저장된 dataPriceList 안의 값을 자바스크립트 배열에 저장하기
        let comparisonList = [];

        <c:forEach  var="item" items="${dataPriceList}">
        comparisonList.push("${item.packageStartDate}, ${item.packagePrice}, ${item.packageNo}");
        </c:forEach>

        // realDateArray와 comparisonList의 날짜 비교해서 달력에 가격 넣기
        for(let i = 0; i < realDays.length; i++) {
            let comDay = realDays[i].innerText;
            for (let j = 0; j < comparisonList.length; j++) {
                let comparisonYear = comparisonList[j].split('-')[0];
                let comparisonMonth = comparisonList[j].split('-')[1];
                let comparisonDay = comparisonList[j].split(',')[0].split('-')[2];

                console.log("comparisonMonth: "+comparisonMonth + ", comparisonDay: " + comparisonDay);

                if (realYear == comparisonYear && realMonth == comparisonMonth && comDay == comparisonDay) {
                    let dayText = document.getElementById(comparisonList[j].split(',')[0]);
                    dayText.innerHTML = leftPad(comparisonList[j].split(',')[1]);

                    let packNoText = dayText.nextElementSibling;
                    packNoText.innerHTML = leftPad(comparisonList[j].split(',')[2]);
                    // packNo.innerHTML = leftPad(comparisonList[j].split(',')[2]);
                    console.log(comparisonList[j].split(',')[2]);
                }
                else {
                    console.log("no");
                }
            }
        }

        document.getElementById("myForm").addEventListener("submit", function (event) {
            // 공백을 제거하고 다시 설정
            let packageNoInput = document.getElementById("packageNo");
            packageNoInput.value = packageNoInput.value.trim();
        });


        // 선택한 패키지정보(packageId) 넘기기 -> display:none 처리한 input 태그에 값 지정
        document.getElementById('packageId').value = "${packageId}";

    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class
        pushDate(newDIV);
        // pushNo();
    }

    // 가격 선택
    function choicePrice(newPrice) {
        if (document.getElementsByClassName("choicePrice")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choicePrice")[0].classList.remove("choicePrice");  // 해당 날짜의 "choiceDay" class 제거
        }
        newPrice.classList.add("choicePrice");           // 선택된 날짜에 "choiceDay" class
        pushPrice(newPrice);
    }

    // No 선택
    function choiceNo(packNo) {
        if (document.getElementsByClassName("choiceNo")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceNo")[0].classList.remove("choiceNo");  // 해당 날짜의 "choiceDay" class 제거
        }
        packNo.classList.add("choiceNo");           // 선택된 날짜에 "choiceDay" class
        pushNo(packNo);
    }

    // 선택한 날짜 input에 넣기
    function pushDate(newDIV) {
        let selectedYear = nowMonth.getFullYear();
        let selctedMonth = nowMonth.getMonth()+1;
        let selctedDate = document.getElementsByClassName("choiceDay")[0].innerText;

        document.getElementById("dateInfo").value = selectedYear+"-"+selctedMonth+"-"+selctedDate;
    }

    // 선택한 날짜의 가격 Input에 넣기
    function pushPrice(newDIV) {
        let selectedPrice = document.getElementsByClassName("choicePrice")[0].innerText;

        document.getElementById("totalPrice").value = selectedPrice;
    }

    // 선택한 날짜의 packageNo input에 넣기
    function pushNo() {
       // 내가 선택한 날짜의 packageNO
        let selectNO = document.getElementsByClassName('choiceNo')[0].innerText;
        let result = selectNO.replace(/\s/g, '');
        // 앞에 0을 제거
        let selectNo = result.replace(/^0+/, '');

        document.getElementById('packageNo').value = selectNo;
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
        buildCalendar();    // 달력 다시 생성
    }
    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
        buildCalendar();    // 달력 다시 생성
    }
    //
    // // input값이 한자리 숫자인 경우 앞에 '0' 붙여주는 함수
    // function leftPad(value) {
    //     if (value < 10) {
    //         value = "0" + value;
    //         return value;
    //     }
    //     return value;
    // }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙여주는 함수
    function leftPad(value) {
        // day 클래스를 가진 인풋 요소에만 적용
        if (document.querySelector('.day') && value < 10) {
            value = "0" + value;
        }
        return value;
    }

</script>

</html>


