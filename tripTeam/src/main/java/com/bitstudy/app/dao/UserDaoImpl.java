package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {


    @Autowired
    UserDao userDao;

    @Autowired
    SqlSession session;
    String namespace="com.bitstudy.app.dao.userMapper.";


    /* ************ 모든 정보 넣어 회원가입 (insert) ************ */
    @Override
    public int insertUser(UserDto userDto) {
        System.out.println("userDto: " + userDto);
        return session.insert(namespace+"insert" , userDto);

    }
    /* ************ id 에 해당하는 정보 모두 조회하기(select) ************ */
    @Override
    public UserDto selectUser(String id) throws Exception {
        return session.selectOne(namespace+"selectOne" , id);


    }
    @Override
    public int checkId(String id) {
        return session.selectOne(namespace+"checkId", id);
    }

    /* ************ id에 해당하는 회원정보 모두변경  ************ */
    @Override
    public int updateAllUser(UserDto user) throws Exception {
        return session.update(namespace+"updateAll",user);
    }
    /* ************ id에 해당하는 생년월일 변경  ************ */
    @Override
    public int updateBirthUser(UserDto user) throws Exception {
        return session.update(namespace+"update_Birth",user);
    }
    /* ************ id에 해당하는 비밀번호 변경  ************ */
    @Override
    public int updatePwUser(UserDto user) throws Exception {
        return session.update(namespace+"update_Pw",user);
    }
    /* ************ id에 해당하는 휴대폰번호 변경  ************ */
    @Override
    public int updatePhoneUser(UserDto user) throws Exception {
        return session.update(namespace+"update_Phone",user);
    }


    /* ************ id 에 해당하는 정보삭제(회원탈퇴) ************ */
    @Override
    public int deleteUser(String id) throws SQLException {
        return session.delete(namespace+"deleteOne",id);
    }

    /* 아이디 찾기 */
    @Override
    public UserDto findMemberId(UserDto user){
        return session.selectOne(namespace+"findMemberId",user);
    }

    /* 비밀번호 찾기 */
    @Override
    public int pwdCheck(UserDto user) {
        return session.selectOne(namespace+"pwdCheck",user);
    }


    /* 임시 비밀번호 업데이트 */
    @Override
    public int pwdUpdate(UserDto user){
        return session.update(namespace+"pwdUpdate",user);
    }

    /* */

    @Override
    public List<UserDto> allselected(){
        return session.selectList(namespace+"allselect");
    }

    @Override
    public List<UserDto> selectAll() {
        return session.selectList(namespace + "selectAll");
    }

}
