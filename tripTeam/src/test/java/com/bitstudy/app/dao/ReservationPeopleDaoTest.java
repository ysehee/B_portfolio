package com.bitstudy.app.dao;

import com.bitstudy.app.domain.ReservationPeopleDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReservationPeopleDaoTest {
    @Autowired
    ReservationPeopleDao reservationPeopleDao;

//    @Test
//    public void insertReservation() {
//        ReservationPeopleDto reservationPeopleDto = new ReservationPeopleDto(1, "bitstudy", new Date(2023-1900, 11, 30),"홍길동", "남자", new Date(2000-1900, 12, 12), "대한민국", "010-1234-5678", "홍길동@aaa.com", 500000, "카카오페이");
//        int rowCount = reservationPeopleDao.insertReservation(reservationPeopleDto);
//        assertTrue(rowCount == 1);
//    }

    @Test
    public void deleteReservation() {
        int rowCount = reservationPeopleDao.deleteReservation("bitstudy", 1);
        assertTrue(rowCount == 1);
    }
}