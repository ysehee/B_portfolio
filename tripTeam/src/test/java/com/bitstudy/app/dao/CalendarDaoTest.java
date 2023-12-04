package com.bitstudy.app.dao;

import com.bitstudy.app.domain.PackageDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CalendarDaoTest {

    @Autowired
    CalendarDao calendarDao;
//    @Test //
//    public void selectPackage() throws Exception {
//        List<PackageDto> packageDto = calendarDao.selectPackage("Asia", "Mongolia", new Date(2023-1900,11,22));
//
//        assertTrue(packageDto != null);
//
//        System.out.println(packageDto);
//    }

//    @Test
//    public void insertPackage() {
//
//        PackageDto packageDto = new PackageDto("몽골_사막", "아시아", "몽골", new Date(2023-1900,10,21), 5000000);
////        calendarDao.insertUser(packageDto);
//        assertTrue(calendarDao.insertPackage(packageDto) == 1);
//    }
}