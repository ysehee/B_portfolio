package com.bitstudy.app.controller;

import com.bitstudy.app.dao.ReservationPeopleDao;
import com.bitstudy.app.domain.PackageDto;
import com.bitstudy.app.domain.ReservationPeopleDto;
import com.bitstudy.app.domain.ViewMyReservationDto;
import com.bitstudy.app.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class CalendarController {
    @Autowired
    CalendarService calendarService;

    @Autowired
    ReservationPeopleDao reservationPeopleDao;

    @GetMapping("/readCalendarPackage")
    public String readCalendarPackage(String packageId, Model model) {
        try {
            List<PackageDto> list = calendarService.getPriceList(packageId);

            System.out.println(list);
            model.addAttribute("dataPriceList", list);
            model.addAttribute("packageId", packageId);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "calendar";
    }

    @GetMapping("/reservationPayment")
    public String reservationPayment(PackageDto packageDto, HttpSession session, HttpServletRequest request, Model model) {
//        model.addAttribute("packageStartDate", packageDto.getPackageStartDate());
//        model.addAttribute("reservationTotalPrice", packageDto.getPackagePrice());
        String userId = (String) session.getAttribute("id");
        if(!loginchk(request)) {
            // 로그인이 안 되어 있는 경우, 세션에 packageDto 저장
            session.setAttribute("packageDto", packageDto);
            return "redirect:/login/login?prevPage="+request.getRequestURL();
        }

        // 세션에서 packageDto를 가져옴
        PackageDto savedPackageDto = (PackageDto) session.getAttribute("packageDto");

        // 세션에서 가져온 packageDto가 null이 아니면 사용
        if (savedPackageDto != null) {
            model.addAttribute("packageDto", savedPackageDto);
            session.removeAttribute("packageDto"); // 사용한 후 세션에서 제거
        } else {
            model.addAttribute("packageDto", packageDto);
        }
        model.addAttribute("userId", userId);

        return "reservationPayment";
    }

    /* ***************************************************  */
    /* *********** 여러 명의 예약자 입력 정보 받아오기 ************ */
    /* ***************************************************  */
    @GetMapping("/paymentComplete")
    public String paymentComplete(
            HttpSession session, HttpServletRequest request,
            @RequestParam List<String> packageNo,
            @RequestParam List<String> reservationName,
            @RequestParam List<String> reservationGender,
            @RequestParam List<String> reservationBirth,
            @RequestParam List<String> reservationNationality,
            @RequestParam List<String> reservationPhone,
            @RequestParam List<String> reservationEmail,
            @RequestParam List<String> packageStartDate,
            @RequestParam List<String> packagePrice,
            @RequestParam List<String> reservationTotalPrice,
            Model model
    ) {

        String userId = (String) session.getAttribute("id");
        if(!loginchk(request)) {
            return "redirect:/login/login?prevPage="+request.getRequestURL();
        }
        System.out.println("packageNo"+packageNo);
        // 여기서 reservationInfoList를 생성하고 각각의 값들을 ReservationPeopleDto에 매핑
        List<ReservationPeopleDto> reservationInfoList = new ArrayList<>();

        for (int i = 0; i < reservationName.size(); i++) {
            ReservationPeopleDto reservationPeopleDto = new ReservationPeopleDto();
            reservationPeopleDto.setPackageNo(Integer.parseInt(packageNo.get(i)));
            reservationPeopleDto.setUserId(userId);
            reservationPeopleDto.setReservationName(reservationName.get(i));
            reservationPeopleDto.setReservationGender(reservationGender.get(i));
            reservationPeopleDto.setReservationBirth(reservationBirth.get(i));
            reservationPeopleDto.setReservationNationality(reservationNationality.get(i));
            reservationPeopleDto.setReservationPhone(reservationPhone.get(i));
            reservationPeopleDto.setReservationEmail(reservationEmail.get(i));
            reservationPeopleDto.setPackageStartDate(packageStartDate.get(i));
            reservationPeopleDto.setPackagePrice(Integer.parseInt(packagePrice.get(i)));
            reservationPeopleDto.setReservationTotalPrice(Integer.parseInt(reservationTotalPrice.get(i)));

            reservationInfoList.add(reservationPeopleDto);
        }

        model.addAttribute("reservationInfoList", reservationInfoList);
        reservationPeopleDao.insertReservation(reservationInfoList);

        // 받아온 데이터 확인
        for (ReservationPeopleDto reservationPeopleDto : reservationInfoList) {
            System.out.println("Reservation Information:");
            System.out.println("packageNo: " +reservationPeopleDto.getPackageNo());
            System.out.println("Name: " + reservationPeopleDto.getReservationName());
            System.out.println("Gender: " + reservationPeopleDto.getReservationGender());
            System.out.println("Birth: " + reservationPeopleDto.getReservationBirth());
            System.out.println("Nationality: " + reservationPeopleDto.getReservationNationality());
            System.out.println("Phone: " + reservationPeopleDto.getReservationPhone());
            System.out.println("Email: " + reservationPeopleDto.getReservationEmail());
            System.out.println("시작날짜: " + reservationPeopleDto.getPackageStartDate());
            System.out.println("패키지가격: " + reservationPeopleDto.getPackagePrice());
            System.out.println("--------------");
        }

        return "successMyreservation";
    }

//    @GetMapping("/reservationMyPage")
//    public String reservationMyPage(HttpSession session, HttpServletRequest request, Model model) {
//        String userId = (String) session.getAttribute("id");
//        if(!loginchk(request)) {
//            return "redirect:/login/login?prevPage="+request.getRequestURL();
//        }
//        List<ViewMyReservationDto> prevList = reservationPeopleDao.viewMyPrevReservation(userId);
//        System.out.println(prevList);
//
//        List<ViewMyReservationDto> nextList = reservationPeopleDao.viewMyNextReservation(userId);
//        System.out.println(nextList);
//
//        model.addAttribute("prevReservationList", prevList);
//        model.addAttribute("nextReservationList", nextList);
//
//
//        return "viewMyReservation";
//    }

    private boolean loginchk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }

}
