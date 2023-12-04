<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dynamic Element Addition</title>
  <link rel="stylesheet" href="<c:url value='/css/reservationPayment.css' />">
  <link rel="stylesheet" href="<c:url value='/css/common.css' /> ">
  <link rel="stylesheet" href="<c:url value='/css/header.css' />">
  <link rel="stylesheet" href="<c:url value='/css/1.index.css' />">

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

  <form id="reservationForm" action="<c:url value="/paymentComplete" />" method="GET" onsubmit="return formCheck(this)">
    <%--<form id="reservationForm" action="#" method="GET">--%>
    <div id="container">
      <div id="leftArea">
        <!-- Left Area Content -->
        <div id="reservationTitle">
          <div id="leftTitle">
            <div id="iconBox">
              <img src="<c:url value='/img/booking_icon1.png'/>" alt="예약하기 아이콘">
            </div>
            <p>예약하기</p>
          </div>
          <div>
            <button id="addButton" type="button">인원 + </button>
            <button id="minusButton" type="button">인원 - </button>
          </div>
        </div>

        <div id="plzChk">
          <p>꼭 확인해주세요</p>
          <div>
            <img src="<c:url value='/img/eyes_icon.png'/>" alt="예약하기 아이콘">
          </div>
        </div>

        <!-- 초기에 하나만 보이도록 설정 -->
        <div class="peopleInfo" id="peopleInfo1">
          <p>예약자 정보</p>
          <div class="infoBox">
            <input type="text" id="userId" name="userId" value="bitstudy" style="display: none">
            <input type="text" id="packageNoInput1" name="packageNo" value="${packageDto.packageNo}" style="display: none">
            <table>
              <tr>
                <td><label for="nameInput1">예약자 이름</label></td>
                <td><label for="genderInput1">성별</label></td>
              </tr>
              <tr>
                <td><input type="text" id="nameInput1" name="reservationName"></td>
                <td><input type="text" id="genderInput1" name="reservationGender"></td>
              </tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr style="display: none;">
                <td><label for="birthDate1">생년월일</label></td>
                <td><input type="text" id="birthDate1" name="reservationBirth" readonly></td>
              </tr>
              <tr>
                <td><label for="birthYear1">출생연도</label></td>
                <td class="label" colspan="2">
                    <span>월</span>
                    <span>일</span>
                </td>
              </tr>
              <tr>
                <td>
                  <select type="text" id="birthYear1" placeholder="예) 1990">
                  </select>
                </td>
                <td colspan="2">
                  <select id="birthMonth1"><!-- 월 옵션 추가 --></select>
                  <select id="birthDay1"><!-- 일 옵션 추가 --></select>
                </td>
              </tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr>
                <td><label for="nationality1">국가</label></td>
                <td><label for="phone1">휴대전화 번호</label></td>
              </tr>
              <tr>
                <td>
                  <input type="text" id="nationality1" name="reservationNationality">
                </td>
                <td>
                  <input type="text" id="phone1" name="reservationPhone">
                </td>
              </tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr><td colspan="2"></td></tr>
              <tr>
                <td><label for="email1">이메일주소</label></td>
              </tr>
              <tr>
                <td colspan="3"><input type="email" id="email1" name="reservationEmail"></td>
              </tr>
            </table>
            <input type="text" id="startDate1" value="${packageDto.packageStartDate}" name="packageStartDate" style="display: none">
            <input type="text" id="packagePrice1" value="${packageDto.packagePrice}" name="packagePrice" style="display: none">
            <input type="text" id="reservationTotalPrice1" value="${packageDto.packagePrice}" name="reservationTotalPrice" style="display: none">
          </div>
        </div>
      </div>

      <div id="rightArea">
        <!-- Right Area Content -->
        <div class="pay">
          <p>결제하기</p>
          <div id="plzChk1">
            <p class="chk">꼭 확인해주세요</p>
            <div>
              <img src="<c:url value='/img/eyes_icon.png'/>" alt="예약하기 아이콘">
            </div>
          </div>
        </div>
        <div id="choicePackage">
          <div>
            <img src="<c:url value='/img/packageImg/' />${packageDto.packageId}.jpg" alt="선택한 상품 사진">
          </div>
          <div>
            <p>가자 몽골의 초원으로!</p>
            <p>선택된 상품 1개</p>
          </div>
        </div>

        <label for="startDate">여행 날짜 : </label>
        <span id="startDate">${packageDto.packageStartDate}</span><br><br>
        <label for="reservationTotalPrice">결제 금액 : </label>
        <span id="reservationTotalPrice">${packageDto.packagePrice}</span><br><br>

        <!-- submit 버튼을 form 태그 안에 추가 -->
        <div class="payMethod">
          <p>신용카드 결제</p>
        </div>
        <div class="payMethod">
          <p>체크카드 결제</p>
        </div>
        <div class="payMethod">
          <p>계좌이체</p>
        </div>
        <button type="submit">결제하기</button>
      </div>
    </div>
  </form>
</div>
<footer class="footer"></footer>
</body>

<script>
  // 생년월일 합쳐서 url 보내는 함수
  function populateBirth(peopleInfo) {
    const peopleInfoId = document.getElementById(peopleInfo);

    if (!peopleInfoId) {
      console.error(`Element with id ${peopleInfoId} not found`);
      return;
    }
    const birthDateInput = peopleInfoId.querySelector('[id^="birthDate"]');
    const selectedYear = peopleInfoId.querySelector(`[id^="birthYear"]`).value;
    const selectedMonth = peopleInfoId.querySelector(`[id^="birthMonth"]`).value;
    const selectedDay = peopleInfoId.querySelector(`[id^="birthDay"]`).value;

    const formattedBirthDate = selectedYear + '-' + selectedMonth + '-' + selectedDay;

    birthDateInput.value = formattedBirthDate;
  }

  // 생년월일 변경 이벤트 핸들러
  function handleDateChange(event) {
    // 생년월일을 업데이트합니다.
    const peopleInfoId = event.target.id.replace(/\D/g, ''); // 숫자만 추출
    populateBirth(`peopleInfo${peopleInfoId}`);
  }

  // 아이디가 addButton인 버튼을 클릭할 때마다 peopleInfo 섹션을 추가하는 기능
  document.getElementById('addButton').addEventListener('click', function () {
    // 마지막 peopleInfo 요소의 ID를 찾습니다.
    const lastPeopleInfoId = document.querySelector('.peopleInfo:last-child').id;

    // 마지막 숫자만 추출
    var lastNumber = parseInt(lastPeopleInfoId.match(/\d+/)[0]);


    // 새로운 peopleInfo 요소의 ID 생성
    const newPeopleInfoId = `peopleInfo`+ (lastNumber+1);

    // 새로운 peopleInfo 요소를 생성합니다.
    const newPeopleInfo = document.createElement('div');
    newPeopleInfo.className = 'peopleInfo';
    newPeopleInfo.id = newPeopleInfoId;

    // 라벨과 인풋 요소를 직접 추가합니다.
    newPeopleInfo.innerHTML =
            '<p>예약자 정보 ' + (lastNumber + 1) + '</p>' +
            '<input type="text" id="userId" name="userId" value="bitstudy" style="display: none">' +
            ' <input type="text" id="packageNoInput" ' + (lastNumber + 1) + ' name="packageNo" value="${packageDto.packageNo}" style="display: none">' +
            '<div class="infoBox">' +
            '<table>' +
            '<tr>' +
            '<td><label for="nameInput' + (lastNumber + 1) + '">예약자 이름</label></td>' +
            '<td><label for="genderInput' + (lastNumber + 1) + '">성별</label></td>' +
            '</tr>' +
            '<tr>' +
            '<td><input type="text" id="nameInput' + (lastNumber + 1) + '" name="reservationName"></td>' +
            '<td><input type="text" id="genderInput' + (lastNumber + 1) + '" name="reservationGender"></td>' +
            '</tr>' +
            '<tr><td colspan="2"></td></tr>' +
            '<tr style="display: none;">' +
            '<td><label for="birthDate' + (lastNumber + 1) + '">생년월일</label></td>' +
            '<td><input type="text" id="birthDate' + (lastNumber + 1) + '" name="reservationBirth" readonly></td>' +
            '</tr>' +
            '<tr>' +
            '<td><label for="birthYear' + (lastNumber + 1) + '">출생연도</label></td>' +
            '<td class="label" colspan="2">' +
            '<span>월</span>' +
            '<span>일</span>' +
            '</td>' +
            '</tr>' +
            '<tr>' +
            '<td><select type="text" id="birthYear' + (lastNumber + 1) + '" placeholder="예) 1990"></select></td>' +
            '<td colspan="2">' +
            '<select id="birthMonth' + (lastNumber + 1) + '"><!-- 월 옵션 추가 --></select>' +
            '<select id="birthDay' + (lastNumber + 1) + '"><!-- 일 옵션 추가 --></select>' +
            '</td>' +
            '</tr>' +
            '<tr><td colspan="2"></td></tr>' +
            '<tr>' +
            '<td><label for="nationality' + (lastNumber + 1) + '">국가</label></td>' +
            '<td><label for="phone' + (lastNumber + 1) + '">휴대전화 번호</label></td>' +
            '</tr>' +
            '<tr>' +
            '<td><input type="text" id="nationality' + (lastNumber + 1) + '" name="reservationNationality"></td>' +
            '<td><input type="text" id="phone' + (lastNumber + 1) + '" name="reservationPhone"></td>' +
            '</tr>' +
            '<tr><td colspan="2"></td></tr>' +
            '<tr><td colspan="2"></td></tr>' +
            '<tr><td colspan="2"></td></tr>' +
            '<tr>' +
            '<td><label for="email' + (lastNumber + 1) + '">이메일주소</label></td>' +
            '</tr>' +
            '<tr>' +
            '<td colspan="3"><input type="email" id="email' + (lastNumber + 1) + '" name="reservationEmail"></td>' +
            '</tr>' +
            '</table>' +
            '<input type="text" id="startDate'+ (lastNumber + 1) + '" value="${packageDto.packageStartDate}" name="packageStartDate" style="display: none">' +
            '<input type="text" id="packagePrice'+ (lastNumber + 1) + '" value="${packageDto.packagePrice}" name="packagePrice" style="display: none">' +
            '<input type="text" id="reservationTotalPrice'+ (lastNumber + 1) + '" value="${packageDto.packagePrice}" name="reservationTotalPrice" style="display: none">' +
            '</div>';


    // 새로운 peopleInfo 요소를 기존 요소의 바로 아래에 추가합니다.
    document.getElementById('leftArea').appendChild(newPeopleInfo);

    // 새로 추가된 peopleInfo에 대해 드롭다운 목록을 초기화합니다.
    populateYear('birthYear' + (lastNumber + 1));
    populateMonths('birthMonth' + (lastNumber + 1));
    populateDays('birthDay' + (lastNumber + 1), 'birthYear' + (lastNumber + 1), 'birthMonth' + (lastNumber + 1));

    // 새로 추가된 peopleInfo에 대해 생년월일을 초기화합니다.
    populateBirth(newPeopleInfo.id);

    // 새로 추가된 peopleInfo에 대한 월과 년도 드롭다운에 이벤트 리스너를 추가합니다.
    document.getElementById('birthMonth' + (lastNumber + 1)).addEventListener('change', handleDateChange);
    document.getElementById('birthYear' + (lastNumber + 1)).addEventListener('change', handleDateChange);

  });

  // 아이디가 minusButton인 버튼을 클릭할 때마다 마지막 peopleInfo 섹션을 삭제하는 기능
  document.getElementById('minusButton').addEventListener('click', function () {
    console.log("minusButton clicked");
    // 마지막 peopleInfo 요소를 찾습니다.
    const lastPeopleInfo = document.querySelector('.peopleInfo:not(#peopleInfo1)');

    // 삭제 기능을 처리하는 함수를 호출합니다.
    deletePeopleInfo(lastPeopleInfo);
  });

  // 각 peopleInfo 섹션에 대한 삭제 버튼 이벤트 처리를 위한 함수
  function deletePeopleInfo(peopleInfo) {
    console.log("deletePeopleInfo called");
    // 부모 컨테이너에서 해당 peopleInfo 섹션을 제거합니다.
    peopleInfo.parentNode.removeChild(peopleInfo);
  }

  // 연도 목록을 채우는 함수
  function populateYear(selectId) {
    const currentYear = new Date().getFullYear();
    const birthYearSelect = document.getElementById(selectId);

    for (let year = currentYear; year >= 1910; year--) {
      const option = document.createElement('option');
      option.value = year;
      option.textContent = year + '년';
      birthYearSelect.appendChild(option);
    }
  }

  // 월 목록을 채우는 함수
  function populateMonths(selectId) {
    const monthSelect = document.getElementById(selectId);

    for (let i = 1; i <= 12; i++) {
      const option = document.createElement('option');
      option.value = i;
      option.textContent = i + '월';
      monthSelect.appendChild(option);
    }
  }

  // 일 목록을 채우는 함수
  function populateDays(selectId, selectedYear, selectedMonth) {
    const daySelect = document.getElementById(selectId);
    const yearSelect = document.getElementById(selectedYear)
    const monthSelect = document.getElementById(selectedMonth);
    const daysInMonth = new Date(yearSelect.value, monthSelect.value, 0).getDate();

    // 기존 옵션을 모두 제거
    daySelect.innerHTML = '';

    for (let i = 1; i <= daysInMonth; i++) {
      const option = document.createElement('option');
      option.value = i;
      option.textContent = i + '일';
      daySelect.appendChild(option);
    }
  }

  // 초기화 시 첫 번째 peopleInfo에 대해 드롭다운 목록을 초기화합니다.
  populateYear('birthYear1');
  populateMonths('birthMonth1');
  populateDays('birthDay1', 'birthYear1','birthMonth1');
  populateBirth('peopleInfo1');

  <%--// 날짜, 가격 url로 보내는 함수--%>
  <%--document.addEventListener('DOMContentLoaded', function () {--%>
  <%--  const form = document.querySelector('form');--%>
  <%--  const startDateInput = document.createElement('input');--%>
  <%--  startDateInput.type = 'hidden';--%>
  <%--  startDateInput.name = 'packageStartDate';--%>
  <%--  startDateInput.value = '${packageStartDate}';--%>
  <%--  form.appendChild(startDateInput);--%>

  <%--  const totalPriceInput = document.createElement('input');--%>
  <%--  totalPriceInput.type = 'hidden';--%>
  <%--  totalPriceInput.name = 'reservationTotalPrice';--%>
  <%--  totalPriceInput.value = '${reservationTotalPrice}';--%>
  <%--  form.appendChild(totalPriceInput);--%>
  <%--});--%>

  // 폼 제출 시에 생년월일을 업데이트하는 이벤트 리스너 추가
  document.getElementById('reservationForm').addEventListener('submit', function (event) {
    // 폼 제출 시 모든 peopleInfo 섹션을 반복하면서 생년월일을 업데이트합니다.
    document.querySelectorAll('.peopleInfo').forEach(function (peopleInfo) {
      populateBirth(peopleInfo.id);
    });
  });

  // 요소 클릭했을 때 색깔 바뀌기
  let prevClick = null;
  for(let items of document.querySelectorAll('.payMethod')) {
    console.log(document.querySelectorAll('.payMethod'));
    items.addEventListener('click', function() {
      if(prevClick != null) {
        prevClick.classList.remove('payMethodClicked');
      }
      this.classList.add('payMethodClicked');
      prevClick = this;
    });
  }

  // 초기에 1명의 예약자 정보가 보이도록 설정
  let peopleInfoCount = 1;

  document.getElementById('addButton').addEventListener('click', function () {
    // addButton 클릭 시 예약자 정보 개수를 증가
    peopleInfoCount++;
    updatePeopleInfoCount();
  });

  document.getElementById('minusButton').addEventListener('click', function () {
    // minusButton 클릭 시 예약자 정보 개수를 감소 (최소 1명 유지)
    peopleInfoCount = Math.max(1, peopleInfoCount - 1);
    updatePeopleInfoCount();
  });


  <%--let totalPice = parseInt(${packageDto.packagePrice});--%>
  function updatePeopleInfoCount() {
    // 예약자 정보 개수를 표시
    // console.log('PeopleInfo 개수:', peopleInfoCount);
    totalPrice = parseInt(${packageDto.packagePrice}) * peopleInfoCount;
    // DOM을 통해 Input 요소 가져오기
    let inputElement = document.querySelectorAll('[id^="reservationTotalPrice"]');

    // inputElements가 NodeList이기 때문에 각각의 엘리먼트에 대해 value를 설정
    inputElement.forEach(function (element) {
      element.value = totalPrice;
      console.log("inputElement: " + element);
    });

    let spanElement = document.getElementById('reservationTotalPrice');
    spanElement.innerText = totalPrice;
    console.log(totalPrice);
  }

  function formCheck(form) {
    // 예약자 정보 개수를 가져오기
    let peopleInfoCount = document.querySelectorAll('.peopleInfo').length;

    // 각 예약자 정보에 대해 입력값 확인
    for (let i = 1; i <= peopleInfoCount; i++) {
      let nameInput = document.getElementById('nameInput' + i);
      let genderInput = document.getElementById('genderInput' + i);
      let birthYearInput = document.getElementById('birthYear' + i);
      let birthMonthInput = document.getElementById('birthMonth' + i);
      let birthDayInput = document.getElementById('birthDay' + i);
      let nationalityInput = document.getElementById('nationality' + i);
      let phoneInput = document.getElementById('phone' + i);
      let emailInput = document.getElementById('email' + i);

      // 입력값이 비어있는 경우
      if (
              nameInput.value === '' ||
              genderInput.value === '' ||
              birthYearInput.value === '' ||
              birthMonthInput.value === '' ||
              birthDayInput.value === '' ||
              nationalityInput.value === '' ||
              phoneInput.value === '' ||
              emailInput.value === ''
      ) {
        alert('예약자 정보를 모두 입력하세요.');
        return false; // 폼 제출을 중단
      }
    }

    return true; // 폼 제출 허용
  }


</script>
</body>

</html>

