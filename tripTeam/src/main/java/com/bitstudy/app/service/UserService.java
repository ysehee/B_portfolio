package com.bitstudy.app.service;

import com.bitstudy.app.dao.UserDao;
import com.bitstudy.app.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;


@Service
public class UserService {

    @Autowired
    UserDao userDao;

    /*회원가입창에서 아이디 중복검사 ajax*/
        public int checkId(String id) throws Exception {
//            int result = 0;
            int result = userDao.checkId(id);
            return result;
            /*int result = 0; 굳이 0을 초기값안해줘도 count(*) 로 필드 갯수를 반환하기떄문에 회원정보가있으면 1개를 반환할것이고 없으면 0개니 0을 반환할것이다.*/

    }
    /*로그인 창 아이디 있는지 없는지 검사*/
    public UserDto loginChk(String id) throws Exception {
        return userDao.selectUser(id);
    }

    /* 해당아이디 정보 불러오기 */
    public UserDto selectUser(String id) throws Exception {
        return userDao.selectUser(id);
    }
    /* 회원정보 변경 */
    public int updateAllUser(UserDto user) throws Exception {
        return userDao.updateAllUser(user);
    }
    /* 회원정보 삭제 */
    public int deleteUser(String id) throws Exception {
        return userDao.deleteUser(id);
    }

    /* 회원가입 시키기 */
    public int insertUser(UserDto user){
        return userDao.insertUser(user);
    }
    
    
    /* 회원탈퇴시 아이디 체크후 탈퇴*/
    public boolean checkPw(String id, String userPw) throws Exception {
        UserDto userDto = userDao.selectUser(id);
        System.out.println(userDto);
        if (userDto == null) {
            return false;
        }

        return userDto.getUserPw().equals(userPw);
    }

    public void deleteUser_ajax(String userId) throws SQLException {
        userDao.deleteUser(userId);
    }
    /* 회원탈퇴시 아이디 체크후 탈퇴*/


    /* 아이디 찾기 */
    public UserDto findMemberId(UserDto user) throws Exception {
        return userDao.findMemberId(user);

    }

    /* 비밀번호 찾기 */
    public int pwdCheck(UserDto user)throws Exception
    {
        return userDao.pwdCheck(user);
    }

    /* 임시 비밀번호 업데이트 */
    public int pwdUpdate(UserDto user)throws Exception
    {
        return userDao.pwdUpdate(user);
    }

    /**/
    public List<UserDto> allselected() throws Exception {
        return userDao.allselected();
    }

    //유저정보 다 조회
    public List<UserDto> selectAll() throws Exception {
        return userDao.selectAll();
    }
}
