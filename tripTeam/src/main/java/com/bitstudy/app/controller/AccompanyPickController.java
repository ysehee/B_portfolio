package com.bitstudy.app.controller;

import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.AccompanyCommentService;
import com.bitstudy.app.service.AccompanyPickService;
import com.bitstudy.app.service.AccompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/accompany")

public class AccompanyPickController {
    @Autowired
    AccompanyPickService accompanyPickService;
    @Autowired
    AccompanyService accompanyService;
    @Autowired
    AccompanyCommentService accompanyCommentService;

    @GetMapping("/openPickPopup")
    public String openPickPopup(HttpSession session, HttpServletRequest request, Model model){
        System.out.println("팝업창 열기");

        session = request.getSession();
        String loginUserId = (String)session.getAttribute("id");

        if(loginUserId != null){
            List<AccompanyLikeDto> likeList = accompanyService.getLikeBtnUserList(loginUserId);
            model.addAttribute("likeList", likeList);
        }

        model.addAttribute("loginUserId", loginUserId);


        return "accompanyPopup";
    }

    @ResponseBody
    @PostMapping("/pickU")
    public int pickU(@RequestParam Map<String, Object> paramMap){
        System.out.println("동행 신청 보내기");

        System.out.println("paramMap 값: "+ paramMap);

        int result = accompanyPickService.createPick(paramMap);
        System.out.println("result 값: " + result);

        return result;
    }



    /*********************** 동행 마이페이지 기능 시작***********************/

    /* 내가 쓴 동행글 보기 */
    @GetMapping("/accIWrote")
    public String selectAccIWrote(String loginUserId, Model model, HttpSession session, HttpServletRequest request){

        session = request.getSession();
        loginUserId = (String)session.getAttribute("id");

        List<AccompanyDto> accompanyListIWrote = accompanyPickService.selectAccIWrote(loginUserId);
        model.addAttribute("accompanyListIWrote",accompanyListIWrote);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyAccIWrote";
    }

    /* 내가 쓴 동행 댓글 보기 */
    @GetMapping("/accCmtIWrote")
    public String showMyCmtAll(String loginUserId, Model model, HttpSession session, HttpServletRequest request){

        session = request.getSession();
        loginUserId = (String)session.getAttribute("id");

        List<AccompanyCommentDto> accompanyListCmtIWrote = accompanyCommentService.showMyCmtAll(loginUserId);
        model.addAttribute("accompanyListCmtIWrote",accompanyListCmtIWrote);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyAccCmtIWrote";
    }

    /* 내가 보낸 동행 신청 보기*/
    @GetMapping("/spendAccApy")
    public String showAccListISpend(String loginUserId, Model model, HttpSession session, HttpServletRequest request){

        session = request.getSession();
        loginUserId = (String)session.getAttribute("id");

        List<AccompanyPickDto> accompanySpendPickList = accompanyPickService.showPickSpendList(loginUserId);
        model.addAttribute("accompanySpendPickList",accompanySpendPickList);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyAccISpend";
    }

    /* 보낸 동핸신청에서 [신청 취소] 누르면 해당 내역에서 삭제하기*/
    @ResponseBody
    @PostMapping("/accPickSpendCancel")
    public int removePickSpendCancel(@RequestParam Map<String, Object> paramMap){
        System.out.println("픽넘버: "+paramMap);

        int accompanyPickNo = Integer.valueOf((String)paramMap.get("accompanyPickNo"));
        System.out.println("픽넘버 숫자형으로 변환: "+accompanyPickNo);
        int removePickSpd = accompanyPickService.removePickSpendCancel(accompanyPickNo);
        System.out.println("지우기 성공여부: "+removePickSpd);

        return accompanyPickNo;
    }

    /* 내가 받은 동행 신청 보기*/
    @GetMapping("/receiveAccApy")
    public String showAccListIReceive(String loginUserId, Model model, HttpSession session, HttpServletRequest request){

        session = request.getSession();
        loginUserId = (String)session.getAttribute("id");

        List<AccompanyPickDto> accompanyReceivePickList = accompanyPickService.showPickReceiveList(loginUserId);
        model.addAttribute("accompanyReceivePickList",accompanyReceivePickList);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyAccIReceive";
//        return "Accompany_receive";
    }


    /* 동행 확정 내역 보기*/
    @GetMapping("/accConnectionList")
    public String showAccConnectionList(String loginUserId, Model model, HttpSession session, HttpServletRequest request){

        session = request.getSession();
        loginUserId = (String)session.getAttribute("id");

        List<AccompanyConnectionDto> accompanyConnectionList = accompanyPickService.selectConnectionList(loginUserId);
        model.addAttribute("accompanyConnectionList",accompanyConnectionList);
        model.addAttribute("loginUserId", loginUserId);

        System.out.println("확정리스트: "+accompanyConnectionList);

        System.out.println("컨트롤러 : "+loginUserId);

        return "accompanyAccConnectionList";
    }

    /* 동행하기 [수락], [거절] 누르면 해당 DB 에 저장*/
    @ResponseBody
    @PostMapping("/accPickAnswerBtn")
    public int showPickConnection(@RequestParam Map<String, Object> paramMap){

            int accPickresult = accompanyPickService.createPickConnection(paramMap);

            int accompanyPickNo= 0 ;
            if(accPickresult > 0){
                accompanyPickNo = Integer.valueOf((String)paramMap.get("accompanyPickNo"));
                accompanyPickService.removePickReceive(accompanyPickNo);
            }
        return accompanyPickNo;
    }




}
