package com.bitstudy.app.dao;

import com.bitstudy.app.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.SQLException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;


    @Test
    public void insertUser() throws SQLException {
        UserDto userDto = new UserDto("asd1","1234","홍길동","남","17000502","0103333333","gud122@hasd123");
       userDao.insertUser(userDto);
    }

    @Test
    public void selectUser() throws Exception {
        userDao.selectUser("asd1");
        System.out.println(userDao.selectUser("asd1"));
    }


    @Test
    public void updateBirthUser() throws Exception {
        UserDto userDto =userDao.selectUser("asd1");
        userDto.setUserBirth("20231102");
//        userDto.setUserBirth()
        userDao.updateBirthUser(userDto);
    }

    @Test
    public void updatePwUser() throws Exception {
        UserDto userDto =userDao.selectUser("asd1");
        userDto.setUserPw("23434");
        userDao.updatePwUser(userDto);
    }

    @Test
    public void updatePhoneUser() throws Exception {
        UserDto userDto =userDao.selectUser("asd1");
        userDto.setUserPhoneNo("01020233333");
        userDao.updatePhoneUser(userDto);
    }

    @Test
    public void deleteUser() throws Exception {
        UserDto userDto =userDao.selectUser("asd1");
        userDao.deleteUser("asd1");
    }

    @Test
    public void insert100() {
        for (int i = 0 ; i<20 ;i++){
            UserDto userDto = new UserDto("asd"+i,"1234","홍길동"+i,"남","20100220","0103333333","gud122@hasd123");
            userDao.insertUser(userDto);
        }
    }
}