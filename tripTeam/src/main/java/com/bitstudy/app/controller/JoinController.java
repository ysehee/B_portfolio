package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLEncoder;

@Controller
public class JoinController {


    @Autowired
    UserService userService;

    @GetMapping("/join/add")
    public String joinadd() {

        return "Join";
    }

    /*ajax 아이디 중복체크 로 db 에 해당아이디있는디 유효성검사했음*/
    @PostMapping("/checkId")
    @ResponseBody
    //@ResponseBody ajax 값을 바로jsp 로 보내기위해 사용
    public ResponseEntity<String> checkId(@RequestParam("member_id") String id) throws Exception {
        String result="N";
//
        int flag = userService.checkId(id);
        /*userService.checkId(id); 해서 id가있으면 1이반환 없으면 0 이반환*/
//        System.out.println(flag);
//
        if(flag == 1){ 
            result ="Y";
        }
        //아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
//        System.out.println(id);
        return new ResponseEntity<String>(result, HttpStatus.OK);
    }

    @GetMapping("/joinCreatedId/add")
    public String joinCreatedIdadd() {
        return "JoinCreatedId";
    }

    @GetMapping("/joinCreatedId/save")
    public String joinCreatedIdsave(UserDto user, Model m) throws Exception {

            /* 회원가입 시키기 */
            userService.insertUser(user);
            return "redirect:/login/login";
        }

}