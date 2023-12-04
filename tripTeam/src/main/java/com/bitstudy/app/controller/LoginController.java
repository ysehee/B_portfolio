package com.bitstudy.app.controller;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import com.bitstudy.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.Random;

@Controller
//@RequestMapping("/login")
public class LoginController {


    @Autowired
    UserService userService;

    /*로그인 페이지 이동 시작*/
    @GetMapping("/login/login")
    public String loginForm(HttpSession session) {
        return "Login";
    }
    /*로그인 페이지 이동 끝*/

    /*로그아웃 기능 시작*/
    @GetMapping("/login/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 즉시 삭제
        /*본래이동할곳 */
        return "redirect:/"; // 삭제 후 메인페이지로 다시 이동
        /*임시 이동소*/
//        return "redirect:/join/add";
    }
    /*로그아웃 기능 끝*/



/*============= 로그인 시작 ===========*/
    @PostMapping("/login/login")
    public String login(String id, String pwd, boolean login_keep, Model m,
                        HttpServletResponse response,
                        HttpServletRequest request,
                        String prevPage) throws Exception {

        if (loginChk(id, pwd)) {
            // 로그인이 성공한 경우
            String successMsg = URLEncoder.encode("로그인되었습니다.", "utf-8");
            m.addAttribute("prevPage", prevPage);

            /*id 쿠키생성 시작*/
            Cookie cookie = new Cookie("id", id);
            if (login_keep) {
                cookie.setMaxAge(60 * 60 * 24 * 365); // 1년
                cookie.setPath("/");
            } else {
                cookie.setMaxAge(0);
                cookie.setPath("/");
            }
            response.addCookie(cookie);
            /*id 쿠키생성 끝*/

            /*pwd 쿠키생성 시작 -쿠키 추가할시 쿠키 변수네임 다르게 해서 넣어준다 */
            Cookie cookie1 = new Cookie("pwd", pwd);
            if (login_keep) {
                cookie1.setMaxAge(60 * 60 * 24 * 365); // 1년
                cookie1.setPath("/");
            } else {
                cookie1.setMaxAge(0);
                cookie1.setPath("/");
            }
            response.addCookie(cookie1);
            /*pwd 쿠키생성 끝*/

            /* 세션 생성해 로그인 로그아웃 기능이나 로그인한 아이디뜨게끔 가능*/
            HttpSession session = request.getSession();
            session.setAttribute("id", id);


            prevPage = prevPage.trim().replace(",", "");
            
            /*바로 아래 본 prevPage 주소*/
            prevPage = (prevPage == null || ("").equals(prevPage)) ? "/" : prevPage;


            /*본래 이동할곳*/
            return "redirect:"+prevPage+"?msg="+successMsg;

            /*임시 이동소*/
//            return "redirect:/join/add?msg="+successMsg;
        }


        else {
            // 로그인이 실패한 경우
            String errorMsg = URLEncoder.encode("일치하는 회원정보가 없습니다.", "utf-8");
            m.addAttribute("prevPage", prevPage);
            return "redirect:/login/login?msg="+errorMsg;
        }
    }
    private boolean loginChk(String id, String pwd) throws Exception {
        UserDto user = userService.loginChk(id);
        if(user==null) return false;
        return user.getUserPw().equals(pwd);
    }
    /*============= 로그인 끝 ===========*/

    /* 회원정보 수정 페이지 이동 시작*/
    @GetMapping("/modify")
    public String modify(HttpSession session , Model m) throws Exception {
        String mod = (String) session.getAttribute("id");
        UserDto userDto = userService.selectUser(mod);
        m.addAttribute("userDto",userDto);

        return "MyPage";
    }
    /* 회원정보 수정 페이지 이동 끝*/

    /* 회원정보 수정 시작 */
    @PostMapping("/modifyAdd")
    public String modifyAdd(HttpSession session ,String userPw ,String userPhoneNo,String userEmail) throws Exception {
        String successMsg = URLEncoder.encode("회원정보가 변경되었습니다.","utf-8");
        String mod = (String) session.getAttribute("id");
        UserDto userDto = userService.selectUser(mod);
        userDto.setUserPw(userPw);
        userDto.setUserPhoneNo(userPhoneNo);
        userDto.setUserEmail(userEmail);

        int rowcount = userService.updateAllUser(userDto);

        System.out.println(rowcount);
        /*원래 이동소 */
        return "redirect:/?msg="+successMsg;
        /*임시 이동소 */
//        return "redirect:/join/add?msg="+successMsg;
    }
    /* 회원정보 수정 끝*/

    /* 회원탈퇴 시작*/
    @RequestMapping("app/user/checkPw")
    @ResponseBody
    public ResponseEntity<String> checkPw(HttpSession session, @RequestParam("userPw") String userPw) throws Exception {

        String result ="N";
        String id = (String) session.getAttribute("id");

        boolean isPwCorrect = userService.checkPw(id, userPw);
        System.out.println(isPwCorrect);
        if (isPwCorrect) {
            result = "Y";
        }
        return new ResponseEntity<String>(result, HttpStatus.OK);
    }

    @RequestMapping("app/user/delete")
    public String deleteUser(Model model,HttpSession session) throws Exception {
        String id = (String) session.getAttribute("id");
        userService.deleteUser(id);
        model.addAttribute("message", "회원탈퇴가 완료되었습니다.");
        session.invalidate();
        return "redirect:/";
    }
    /* 회원탈퇴 끝 */



    /* mypage (로그인 된상태,안된상태) 이동시 시작 */
    @GetMapping("/mypage")
    public String mypage(HttpServletRequest request, HttpSession session , Model m) throws Exception {
        if(!loginChk(request)){
            return "redirect:/login/login?prevPage="+request.getRequestURL();
        }
        /*로그인되고 이동되면서 세션에있는 아이디 정보 찾아서 그정보를
        회원정보 리스트에 뿌려준다.*/
        String mod = (String) session.getAttribute("id");
        UserDto userDto = userService.selectUser(mod);
        m.addAttribute("userDto",userDto);

        return "MyPage1";
    }





    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id") != null;
    }

    /* mypage (로그인 된상태,안된상태) 이동시 끝 */

    /* 로그인 아이디 찾기 시작*/
    @GetMapping("/login/findId")
    public String findId() {

        return "Login_findId";
    }


    @PostMapping("/login/findIdCheck")
    public String searchId(HttpServletRequest request, Model model, UserDto user, @RequestParam("userName") String userName,
                           @RequestParam("userEmail") String userEmail) {

        try {
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            UserDto id = userService.findMemberId(user);
            System.out.println(id);
            model.addAttribute("findId", id);

        } catch (Exception e) {
            model.addAttribute("msg", "오류가 발생되었습니다.");
            e.printStackTrace();
        }
        return "Login_findIdResult";
    }
    /* 로그인 아이디 찾기 끝*/


    /* 로그인 비번 찾기 시작 */
    @GetMapping("/login/findPw")
    public String findPw() {

        return "Login_findPw";
    }

    @PostMapping("/login/findPwCheck")
    public String findPwdCheck(HttpServletRequest request, Model model,
                               @RequestParam("userId") String userId, @RequestParam("userName") String userName, @RequestParam("userEmail") String userEmail,
                               UserDto user) {
        try {
            user.setUserId(userId);
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            int search = userService.pwdCheck(user);

            if (search == 0) {
                model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
            }

//            String newPwd = RandomStringUtils.randomAlphanumeric(10);
            // 임의의 문자열 조합 사용
            String newPwd = "@123nop45#6tu7d890$%abcefghij!klmqrsvwxy";
            Random random = new Random();
            int index = random.nextInt(newPwd.length());
            /*random.nextInt(newPwd.length()); newPwd 변수의 길이 중에서 하나의 숫자를 나타냅니다.*/
            newPwd = newPwd.substring(index, index + 8);
            /*newPwd.substring(index, index + 8); newPwd 변수의 index 위치부터 index + 8 위치까지의 문자열을 newPwd 변수에 다시 할당*/
            user.setUserPw(newPwd);
            userService.pwdUpdate(user);
            model.addAttribute("newPwd", newPwd);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "오류가 발생되었습니다.");
        }
        return "Login_findPwResult";


        /* 로그인 비번 찾기 끝 */
    }
}

