package com.bitstudy.app.controller;

import com.bitstudy.app.domain.AccompanyCommentDto;
import com.bitstudy.app.domain.AccompanyDto;
import com.bitstudy.app.service.AccompanyCommentService;
import com.bitstudy.app.service.AccompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/accompany")
public class AccompanyCommentController {


    @Autowired
    AccompanyService accompanyService;
    @Autowired
    AccompanyCommentService accompanyCommentService;

    /* 새 댓글 작성 후 등록하기 */
    @PostMapping("/writeCmt")
        public String writeComment( AccompanyCommentDto accompanyCommentDto,Integer accompanyNo, Integer page, Integer pageSize, Model model, HttpSession session){

//        String currUserId = (String) session.getAttribute("userId");
//        accompanyCommentDto.setAccompanyCommentWriter(currUserId);
        try {
            accompanyCommentService.createCmt(accompanyCommentDto);
//            System.out.println("댓글내용: "+accompanyCommentList);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        System.out.println(accompanyCommentDto);

        return "redirect:/accompany/read?accompanyNo=" + accompanyNo;
    }
    
    /*댓글 수정*/
    @ResponseBody
    @PostMapping("/modifyCmt")
    public int modifyCmt(@RequestParam Map<String, Object> paramMap){
        System.out.println(paramMap);
        System.out.println("수정 맵퍼 들어옴");
        int result = accompanyCommentService.modifyCmt(paramMap);
        return result;
    }


    /*댓글 삭제*/
    @PostMapping("/deleteCmt")
    public String deleteCmt(@RequestParam("accompanyCommentNo") int accompanyCommentNo,@RequestParam("accompanyNo") int accompanyNo, Model model){
        int result = accompanyCommentService.removeCmt(accompanyCommentNo);
        System.out.println(result);
        if(result == 1){
            System.out.println("댓글 삭제 성공");

        }
        else{
            System.err.println("댓글 삭제 이상");
        }

        return "redirect:/accompany/read?accompanyNo=" + accompanyNo;
    }


}
