package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    int insertUser(UserDto user);

    UserDto selectUser(String uid) throws Exception;

    int checkId(String id) throws Exception;
    int updateAllUser(UserDto user) throws Exception;
    int updateBirthUser(UserDto user) throws Exception;
    int updatePwUser(UserDto user) throws Exception;
    int updatePhoneUser(UserDto user) throws Exception;

    int deleteUser(String id) throws SQLException;

    UserDto findMemberId(UserDto user)throws Exception;

    int pwdCheck(UserDto user) throws Exception;
    int pwdUpdate(UserDto user) throws Exception;

     List<UserDto> allselected() throws Exception;

    List<UserDto> selectAll() throws Exception;
}
