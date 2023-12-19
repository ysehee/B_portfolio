package com.bitstudy.app.controller;

import com.bitstudy.app.dao.AccompanyDao;
import com.bitstudy.app.domain.*;
import com.bitstudy.app.service.AccompanyCommentService;
import com.bitstudy.app.service.AccompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/accompany")
public class AccompanyController {
    @Autowired
    AccompanyService accompanyService;
    @Autowired
    AccompanyCommentService accompanyCommentService;

    /*동행 게시글 전체 불러오기*/
    @RequestMapping("/board")
    public String showAccompanyList(HttpSession session, HttpServletRequest request, Model model) {

        session = request.getSession();
        String loginUserId = (String) session.getAttribute("id");

        List<AccompanyDto> accompanyList = accompanyService.getList();

        if (loginUserId != null) {
            List<AccompanyLikeDto> likeList = accompanyService.getLikeBtnUserList(loginUserId);
            model.addAttribute("likeList", likeList);
        }

        model.addAttribute("accompanyList", accompanyList);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyList";
    }


    /*동행 게시글 하나 불러오기*/
    /*게시글에 달린 댓글 전체 불러오기*/
    @GetMapping("/read")
    public String read(Integer accompanyNo, HttpSession session, HttpServletRequest request, Model model) {
        try {
            session = request.getSession();

            String loginUserId = (String) session.getAttribute("id");

            AccompanyDto accompanyDto = accompanyService.read(accompanyNo);
            List<AccompanyCommentDto> accompanyCommentList = accompanyCommentService.getCmtList(accompanyNo);
            accompanyService.viewUp(accompanyNo);

            if (loginUserId != null) {
                List<AccompanyLikeDto> likeList = accompanyService.getLikeBtnUserList(loginUserId);
                model.addAttribute("likeList", likeList);
            }

            model.addAttribute("accompanyDto", accompanyDto);

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");   // yyyy-MM-dd HH:mm:ss
            String formatSdt = formatter.format(accompanyDto.getAccompanyTripStartDate());

            String formatEdt = formatter.format(accompanyDto.getAccompanyTripEndDate());

            model.addAttribute("formatSdt",formatSdt);
            model.addAttribute("formatEdt",formatEdt);

            model.addAttribute("accompanyCommentList", accompanyCommentList);
            model.addAttribute("loginUserId", loginUserId);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "accompanyBoard";
    }


    /* 동행 새 글 작성 */
    @GetMapping("/write")
    public String write(Model model, HttpSession session, HttpServletRequest request) {
        model.addAttribute("mode", "new");

        session = request.getSession();
        String loginUserId = (String) session.getAttribute("id");

        return "accompanyBoard";
    }

    @PostMapping("/writeBoard")
    public String writeBoard(AccompanyDto accompanyDto ,Model model, HttpSession session, HttpServletRequest request) {
        session = request.getSession();
        String loginUserId = (String) session.getAttribute("id");

        accompanyDto.setAccompanyWriter(loginUserId);
        accompanyService.create(accompanyDto);

        return "redirect:/accompany/board";
    }

    /* 동행글 수정 */
    @ResponseBody
    @PostMapping("/modify")
    public int modify(@RequestParam Map<String, Object> paramMap) {
        int result = accompanyService.modify(paramMap);

        return result;
    }


    /*동행글 삭제*/
    @PostMapping("/deleteBoard")
    public String deleteBoard(@RequestParam("accompanyNo") int accompanyNo) {
        accompanyService.remove(accompanyNo);

        return "redirect:/accompany/board";
    }


    /* 동행글 찜하기 */
    @ResponseBody
    @GetMapping("/like")
    public int likeAcc(@RequestParam Map<String, Object> paramMap) {
        int result = 0;

        AccompanyLikeDto chkLike = accompanyService.chkLikeUser(paramMap);

        if (chkLike == null) {
            accompanyService.createLikeInfo(paramMap);
            accompanyService.likeUp(paramMap);

            result = 0;
        } else if (chkLike != null) {
            accompanyService.removelike(paramMap);
            accompanyService.likeDown(paramMap);

            result = 1;
        }
        return result;
    }


    /* 정렬방식 */
    @RequestMapping("/viewWay")
    public String showIWant(@RequestParam("sort") String viewWay, Model model) {
        System.out.println(viewWay);

        List<AccompanyDto> accompanyList = new ArrayList<>();

        if (viewWay.equals("recent")) {
            accompanyList = accompanyService.getRecentList();
        } else if (viewWay.equals("like")) {
            accompanyList = accompanyService.getLikeList();
        } else if (viewWay.equals("topView")) {
            accompanyList = accompanyService.getViewList();
        } else {
            System.out.println("정렬방식 에러");
        }

        model.addAttribute("accompanyList", accompanyList);

        return "accompanyList";
    }


    /* 동행 검색 */
    @GetMapping("/accSearch")
    public String accompanySearch(String accompanySearchText, Model model,HttpSession session, HttpServletRequest request) {

        session = request.getSession();
        String loginUserId = (String) session.getAttribute("id");

        List<AccompanyDto> accompanyList = accompanyService.searchList(accompanySearchText);
        model.addAttribute("accompanyList", accompanyList);
        model.addAttribute("loginUserId", loginUserId);

        return "accompanyList";
    }
}