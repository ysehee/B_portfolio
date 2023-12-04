package com.bitstudy.app.controller;

import com.bitstudy.app.dao.ReservationPeopleDao;
import com.bitstudy.app.dao.SearchPackageDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.AccompanyService;
import com.bitstudy.app.service.ReviewCommentService;
import com.bitstudy.app.service.ReviewService;
import com.bitstudy.app.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MyPageController {
    //후기관련
    private final ReviewService reviewService;
    private final ReviewCommentService reviewCommentService;
    private final UserService userService;
    private final ReservationPeopleDao reservationPeopleDao;

//후기관련

    //내가 쓴 후기 게시글/댓글 찾기
    @GetMapping("/mypage3") //   /mypage
    public String saveForm(Model model,
                           HttpSession httpSession,
                           HttpServletRequest request) {
        String userId = (String) httpSession.getAttribute("id");
        if (!loginchk(request)){
            return "redirect:/login/login?prevPage="+request.getRequestURL();
        }
        System.out.println("userId: "+userId);
        //내 게시글 찾기
        List<ReviewDto> userReviews = reviewService.findBoardsByUserId(userId);
        // 모델에 데이터 추가
        model.addAttribute("userReviews", userReviews);

        //내 댓글 찾기
        List<ReviewCommentDto> usercomments = reviewCommentService.findCommentsByUserId(userId);
        model.addAttribute("usercomments",usercomments);

        return "MyPage3";
    }

    private boolean loginchk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }


    /* 임시 마이페이지 컨트롤 2.3번 시작*/
//    @GetMapping("/mypage2")
//    public String mypage2(Model m) throws Exception {
//        List<UserDto> user = userService.allselected();
//        m.addAttribute("user",user);
//        return "MyPage2";
//    }

    @GetMapping("/mypage2") public String reservationMyPage(HttpSession session, HttpServletRequest request, Model model) {
        String userId = (String) session.getAttribute("id");
        if(!loginchk(request))
        { return "redirect:/login/login?prevPage="+request.getRequestURL(); }
        List prevList = reservationPeopleDao.viewMyPrevReservation(userId);
        System.out.println(prevList);
        List nextList = reservationPeopleDao.viewMyNextReservation(userId);
        System.out.println(nextList);
        model.addAttribute("prevReservationList", prevList);
        model.addAttribute("nextReservationList", nextList); return "MyPage2";
    }

    @GetMapping("/mypage4")
    public String mypage4() {


        return "MyPage4";
    }
    /* 임시 마이페이지 컨트롤 2.3번 끝 */


//    @GetMapping("/")
//    public String mainView(Model model) throws Exception {
//        /*List<ReviewDto> reviewDtoList = reviewService.findMainPage();
//        model.addAttribute("boardlist",reviewDtoList);*/
//
//        List<UserDto> userDtos = userService.selectAll();
//        model.addAttribute("user",userDtos);
//        return "home";
//    }

    @Autowired
    SearchPackageDao searchPackageDao;

    @Autowired
    AccompanyService accompanyService;
    @GetMapping("/")
    public String mainView(Model model) throws Exception {
        List<ReviewDto> reviewDtoList = reviewService.findMainPage();
        model.addAttribute("boardlist",reviewDtoList);
        // 오늘 날짜 이후의 패키지들을 불러와 리스트에 저장하기
        Date today = new Date();

        // 날짜를 원하는 형식으로 변환하기 위해 SimpleDateFormat을 사용
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        // 날짜를 문자열로 변환
        String startDate = sdf.format(today);
        List<PackageCardDto> list = searchPackageDao.packageForHome(startDate);
        System.out.println(list);

        //동행글을 메인페이지로
        List<AccompanyDto> accompanyDtoList = accompanyService.accompanyToMain();
        model.addAttribute("accompanyDtoList",accompanyDtoList);


        // 모델에 저장
        model.addAttribute("packageForHome", list);
//        List<UserDto> userDtos = userService.selectAll();
//        model.addAttribute("user",userDtos);
        return "home";
    }

}

